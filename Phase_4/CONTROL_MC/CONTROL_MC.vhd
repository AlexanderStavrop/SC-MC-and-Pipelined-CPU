library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROL_MC is
	Port ( Clk, Reset											  : in  std_logic;
		   ALU_zero 									  		  : in  std_logic;
		   Instruction											  : in  std_logic_vector(31 downto 0);
		   -- IFSTAGE INPUTS/OUTPUTS ---------------------------------------------
		   PC_sel, PC_LdEn, IR_WrEn  							  : out std_logic;
		   -- DECSTAGE INPUTS ----------------------------------------------------
		   RF_WrData_sel, RF_B_sel, RF_WrEn, RF_A_WrEn, RF_B_WrEn : out std_logic;
		   ImmExt_s			 									  : out std_logic_vector ( 1 downto 0);  
		   -- EXSTAGE INPUTS -----------------------------------------------------	
		   ALU_Bin_sel, ALUOut_Reg_WrEn	 						  : out std_logic;	
		   ALU_func			 									  : out std_logic_vector ( 3 downto 0);
		   -- MEMSTAGE INPUTS/OUTPUTS --------------------------------------------
		   ByteOp, Mem_WrEn, Mem_Reg_WrEn  						  : out std_logic
	);
end CONTROL_MC;

architecture Behavioral of CONTROL_MC is

	type StateType IS (Init_Reset, 
					   Instr_Fetch,
					   Decode, 
					   R_Type_Prep,   R_Type_Exec,   R_Type_End,
					   I_Type_Prep,   I_Type_Exec,   I_Type_End,
					   Branch_Prep,   Branch_Exec,   Branch_End, 
					   LoadStore_Prep,LoadStore_Exec, LoadStore_Fetch, Load_Complition);
	signal CurrState, NextState: StateType;

	-- Needed signals
	signal Opcode 	 : std_logic_vector (5 downto 0);
------------------------------------------------------ Main Functions ------------------------------------------------------------------------------------                                                                                    
begin
	fsm_comb:process(CurrState, ALU_zero, Instruction)
	begin
		Opcode  <= Instruction(31 downto 26);							 	-- Extracting the opcode		
		case CurrState is		
----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when Init_Reset  => PC_sel        	<= '0';	 			  	 	-- Initializing to zero 
								PC_LdEn		  	<= '0';					 	-- Initializing to zero
								IR_WrEn		 	<= '0';					 	-- Initializing to zero
								RF_WrData_sel 	<= '0';					 	-- Initializing to zero
								RF_B_sel	  	<= '0';					 	-- Initializing to zero
								RF_WrEn		  	<= '0';					 	-- Initializing to zero
								RF_A_WrEn	  	<= '0';					 	-- Initializing to zero
								RF_B_WrEn	  	<= '0';					 	-- Initializing to zero
								ImmExt_s	  	<= "00";					-- Initializing to zero
								ALU_Bin_sel	  	<= '0';					 	-- Initializing to zero
								ALUOut_Reg_WrEn <= '0';					 	-- Initializing to zero
								ALU_func	  	<= "0000"; 				 	-- Initializing to zero
								ByteOp        	<= '0';					 	-- Initializing to zero
								Mem_WrEn	  	<= '0';					 	-- Initializing to zero
								Mem_Reg_WrEn  	<= '0';					 	-- Initializing to zero
								NextState     	<= Instr_Fetch;			 	-- Setting the next state
----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when Instr_Fetch => PC_sel      <= '0';					 		-- Setting PC sel equal to 0
								PC_LdEn     <= '0';	 			  		 	-- Setting PC load enable off
								IR_WrEn     <= '1';	 			  	 		-- Setting IR write enable on
								RF_WrEn     <= '0';					 		-- Setting the RF write enable off 
								RF_B_sel	<= '0';					 		-- Setting RF_B_sel value to 0
								ImmExt_s  	<= "00";					 	-- Setting ImmExt_s to 0
								ALU_Bin_sel	<= '0';				 	 		-- Setting the ALU_Bin_sel to 0
								ALU_func	<= "0000"; 				 		-- Setting ALU_Func to 0
								ByteOp      <= '0';							-- Setting ByteOp value to 0
								Mem_WrEn    <= '0';					 		-- Setting the Memory write eneble off		
								NextState   <= Decode; 			  	 		-- Selecting the next state
----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
					
			when Decode 	 => IR_WrEn 	  <= '0';						-- Setting IR write enable off
								----------------------- ALU FUNCTIONS (R_Type) -------------------------
								if (Opcode = "100000") then
									NextState <= R_Type_Prep;	  	 	 	-- Selecting the next state	
								----------------------- ALU FUNCTIONS (I_Type) -------------------------
								elsif (Opcode = "111000" or Opcode = "111001" or Opcode = "110000" or Opcode = "110010" or Opcode = "110011") then
									NextState <= I_Type_Prep;	  	 	 	-- Selecting the next state
								----------------------- ALU FUNCTIONS (Branch) -------------------------
								elsif (Opcode = "111111" or Opcode = "000000" or Opcode = "000001") then
									NextState <= Branch_Prep;			 	-- Selecting the next state
								---------------------- ALU FUNCTIONS (LoadStore) -----------------------
								elsif (Opcode = "000011" or Opcode = "000111" or Opcode = "001111"or Opcode = "011111") then   
									NextState <= LoadStore_Prep;	  	 	-- Selecting the next state
								end if;
----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when R_Type_Prep => RF_B_sel 	 	<= '0';				  	 	-- Choosing Rd as RF_B (ALU_Function)	
								RF_A_WrEn	 	<= '1';				  	 	-- Setting RF_A Register write enable on
								RF_B_WrEn	  	<= '1';				  	 	-- Setting RF_B Register write enable on
								NextState     	<= R_Type_Exec;		  	 	-- Selecting the next state
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when R_Type_Exec => RF_A_WrEn	  	<= '0';				  	 	-- Setting RF_A Register write enable off
								RF_B_WrEn	  	<= '0';				  	 	-- Setting RF_B Register write enable off
								ALU_Bin_sel	  	<= '0';				  	 	-- Choosing RF_B as the second alu input because we perform ALU functions	 
								ALU_func	  	<= Instruction(3 downto 0);	-- Setting the ALU_Function through the Instruction				
								ALUOut_Reg_WrEn <= '1';					 	-- Setting the ALU_OUT Register write enable on												
								NextState     	<= R_Type_End;		  	 	-- Selecting the next state
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when R_Type_End  => ALUOut_Reg_WrEn <= '0';					 	-- Setting the ALU_OUT Register write enable off							
								RF_WrEn 	  	<= '1';					 	-- Setting the RF write enable on													
								RF_WrData_sel 	<= '0';				     	-- Writing the ALU out result in the register
								NextState     	<= Instr_Fetch;			 	-- Setting the next state 
								-- Setting variables for Instruction fetch --------------------------
								PC_sel  	  	<= '0';	 			  	 	-- Incrementing the PC by 4
								PC_LdEn 	  	<= '1';	 			  	 	-- Setting PC load enable on
----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when I_Type_Prep => RF_A_WrEn	  	<= '1';				  	 	-- Setting RF_A Register write enable on
								if (Opcode = "110010" or Opcode = "110011") then	
									ImmExt_s  	<= "00";					-- Performing upper zerofill (nandi - ori)
								elsif (Opcode = "111000" or Opcode = "110000") then	 
									ImmExt_s  	<= "01";					-- Performing sign extend (li - addi)
								elsif (Opcode = "111001") then			 
									ImmExt_s  	<= "10";					-- Performing lower zerofill (lui)
								end if;
								NextState <= I_Type_Exec;		     	 	-- Selecting the next state
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when I_Type_Exec => RF_A_WrEn	  	<= '0';				 	 	-- Setting RegA write enable on
								ALU_Bin_sel	  	<= '1';				 	 	-- Choosing Immed as the second Alu input
								ALUOut_Reg_WrEn <= '1';				 	 	-- Setting the ALU_OUT Register write enable on	
								
								if (Opcode = "111000"  or Opcode = "111001"  or Opcode = "110000") then				 
									ALU_func  	<= "0000";			     	-- Choosing Addition as the ALU func (li - lui - addi)
								elsif (Opcode = "110010") then 			 
									ALU_func  	<= "0101";			     	-- Choosing Logical NAND as the ALU func (nandi) 
								elsif (Opcode = "110011") then			 
									ALU_func  	<= "0011";				 	-- Choosing Logical OR as the ALU func (ori)
								end if;
								NextState       <= I_Type_End;		  	 	-- Selecting the next state	
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when I_Type_End  => ALUOut_Reg_WrEn <= '0';				 	 	-- Setting the ALU_OUT Register write enable off							
								RF_WrEn 	  	<= '1';				 	 	-- Setting the RF write enable on													
								RF_WrData_sel 	<= '0';				 	 	-- Writing the ALU out result in the register
								NextState     	<= Instr_Fetch;		 	 	-- Setting the next state 
								-- Setting variables for Instruction fetch --------------------------
								PC_sel  	  	<= '0';	 			 	 	-- Incrementing the PC by 4
								PC_LdEn 	  	<= '1';	 			 	 	-- Setting PC load enable on						
----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when Branch_Prep => ImmExt_s  <= "11";			     	 		-- Performing sign extend and 2 left shifts (b - beq - bne)
								if (Opcode = "000000"  or Opcode = "000001") then				 
									RF_B_sel  <= '1';				 	 	-- Choosing Rt as RF_B 
									RF_A_WrEn <= '1';				 	 	-- Setting RF_A Register write enable on
									RF_B_WrEn <= '1';				  	 	-- Setting RF_B Register write enable on
									NextState <= Branch_Exec;		 	 	-- Selecting the next state			
								else 
									NextState <= Branch_End; 		 	 	-- Selecting the next state
								end if;	
----------------------------------------------------------------------------------------------------------------------------------------------------------			
			when Branch_Exec => RF_A_WrEn	    <= '0';				 	 	-- Setting RF_A Register write enable off
								RF_B_WrEn	    <= '0';				 	 	-- Setting RF_B Register write enable off
								ALU_Bin_sel	    <= '0';				 	 	-- Choosing RF_B as the second Alu input
								ALUOut_Reg_WrEn <= '0';				 	 	-- Setting the ALU_OUT Register write enable off
								ALU_func  	    <= "0001";			     	-- Choosing Subtraction as the ALU func
								NextState 	    <= Branch_End;            	-- Selecting the next state
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when Branch_End  => if (Opcode = "000000") then
									PC_sel	    <= ALU_zero;			 	-- Setting the PC_sel equal to the result of ALU_zero (beq)	
								elsif (Opcode = "000001") then	
									PC_sel	    <= not ALU_zero;		 	-- Setting the PC_sel equal to the oposite result of ALU_zero (bne)								
								else
									PC_sel 	    <= '1';				 	 	-- Setting the PC_sel equal to 1 (Adding immed) (b)
								end if;
								PC_LdEn         <= '1'; 				 	-- Setting PC load enable on
								NextState       <= Instr_Fetch;		 	 	-- Setting the next state 
----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when LoadStore_Prep => RF_A_WrEn   		 <= '1';				-- Setting RF_A Register write enable on
								   RF_B_sel    		 <= '1';				-- Choosing Rt as RF_B 
								   ImmExt_s    		 <= "01";			    -- Performing sign extend
								   NextState  		 <= LoadStore_Exec;     -- Setting the next state 
----------------------------------------------------------------------------------------------------------------------------------------------------------																	
			when LoadStore_Exec => RF_A_WrEn   		 <= '0';				-- Setting RF_A Register write enable off
								   RF_B_WrEn   	 	 <= '1';				-- Setting RF_B Register write enable on
								   ALU_func    		 <= "0000";   			-- Choosing Addition as the ALU func
								   ALU_Bin_sel 		 <= '1';				-- Choosing Immed as the second Alu input
								   ALUOut_Reg_WrEn 	 <= '1';				-- Setting the ALU_OUT Register write enable on	
								   NextState   		 <= LoadStore_Fetch;	-- Setting the next state 
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when LoadStore_Fetch => ALUOut_Reg_WrEn	 <= '0';				-- Setting the ALU_OUT Register write enable on	
								    if (Opcode = "000011" or Opcode = "000111") then
									   ByteOp  		 <= '1';				-- Setting Byte operation equal to 1 (lb - sb)						
									else
									   ByteOp  		 <= '0';				-- Setting Byte operation equal to 0 (lw - sw)	
									end if;
									
									if (Opcode = "000111" or Opcode = "011111") then
									    RF_B_WrEn 	 <= '0';				-- Setting RF_B Register write enable off
										Mem_WrEn  	 <= '1';				-- Setting the Memory write eneble on
										NextState 	 <= Instr_Fetch;		-- Setting the next state 
										-- Setting variables for Instruction fetch --------------------------
										PC_sel    	 <= '0';	 	     	-- Incrementing the PC by 4
										PC_LdEn      <= '1';	 		 	-- Setting PC load enable on	
								    else
										Mem_Reg_WrEn <= '1';				-- Setting the Memory Register write enable on
										NextState    <= Load_Complition;	-- Setting the next state 
								    end if;
----------------------------------------------------------------------------------------------------------------------------------------------------------
			when Load_Complition  => Mem_Reg_WrEn    <= '0';				-- Setting the Memory Register write enable off
									 RF_WrEn 	     <= '1';				-- Setting the RF write enable on		
								     RF_WrData_sel   <= '1';			    -- Choosing the Alu out as the RF data in
									 -- Setting variables for Instruction fetch
								     PC_sel  	     <= '0';	 	     	-- Incrementing the PC by 4
								     PC_LdEn 	     <= '1';	 		 	-- Setting PC load enable on					
									 NextState       <= Instr_Fetch;	 	-- Setting the next state
----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------									 
			when others	=> NextState <= Instr_Fetch; 						-- Setting the next state
----------------------------------------------------------------------------------------------------------------------------------------------------------
		end case;
	end process;
	
	fsm_synch: process (clk, Reset)
	begin
		if (Reset='1') 			 then CurrState <= Init_Reset;
		elsif (rising_edge(clk)) then CurrState <= NextState;
		end if;
	end process fsm_synch;	

end;