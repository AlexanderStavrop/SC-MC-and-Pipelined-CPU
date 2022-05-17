LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity CONTROL_MC_tb is
end CONTROL_MC_tb;
 
architecture behavior of CONTROL_MC_tb is 
 
    component CONTROL_MC
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
    end component;
    

	--Inputs
	signal Clk 	           : std_logic := '0';
	signal Reset 	       : std_logic := '0';
	signal ALU_zero        : std_logic := '0';
	signal Instruction 	   : std_logic_vector(31 downto 0) := (others => '0');

	--Outputs
	signal PC_sel 		   : std_logic;
	signal PC_LdEn 		   : std_logic;
	signal IR_WrEn 		   : std_logic;	
	signal RF_WrData_sel   : std_logic;
	signal RF_B_sel 	   : std_logic;
	signal RF_WrEn 	       : std_logic;
	signal RF_A_WrEn 	   : std_logic;
	signal RF_B_WrEn 	   : std_logic;
	signal ImmExt_s 	   : std_logic_vector(1 downto 0);
	signal ALU_Bin_sel 	   : std_logic;
	signal ALUOut_Reg_WrEn : std_logic;
	signal ALU_func 	   : std_logic_vector(3 downto 0);
	signal ByteOp 	       : std_logic;
	signal Mem_WrEn 	   : std_logic;
	signal Mem_Reg_WrEn	   : std_logic;
 
	-- Clock period definitions
	constant clk_period    : time := 30 ns;
	signal stop_the_clock  : boolean;
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: CONTROL_MC 
		Port map ( Clk 			   => Clk,
				   Reset 		   => Reset,
				   ALU_zero 	   => ALU_zero,
				   Instruction     => Instruction,
				   PC_sel 		   => PC_sel,
				   PC_LdEn 		   => PC_LdEn,
				   IR_WrEn 	 	   => IR_WrEn,
				   RF_WrData_sel   => RF_WrData_sel,
				   RF_B_sel 	   => RF_B_sel,
				   RF_WrEn 		   => RF_WrEn,
				   RF_A_WrEn 	   => RF_A_WrEn,
				   RF_B_WrEn 	   => RF_B_WrEn,
				   ImmExt_s 	   => ImmExt_s,
				   ALU_Bin_sel 	   => ALU_Bin_sel,
				   ALUOut_Reg_WrEn => ALUOut_Reg_WrEn,
				   ALU_func	 	   => ALU_func,
				   ByteOp 	       => ByteOp,
				   Mem_WrEn 	   => Mem_WrEn,
				   Mem_Reg_WrEn    => Mem_Reg_WrEn
		);

	-- Clock process definitions
	clocking: process
		begin
			while not stop_the_clock loop
				Clk <= '0', '1' after clk_period / 2;
				wait for clk_period;
			end loop;
		 wait;
	end process;
 

	-- Stimulus process
	stim_proc: process
	begin		

------------------------------------------------------------------------------------------------------------------------------ 0ns
	-- Holding reset for 2 clk periods
		---------------------------------------------------------------------------------------------------------------------- 0ns
		Reset <= '1';
		wait for clk_period*2;	
		---------------------------------------------------------------------------------------------------------------------- 60ns		
		Reset <= '0';

------------------------------------------------------------------------------------------------------------------------------ 60ns
	-- Testing if I type instructions run through the expected states
	    ---------------------------------------------------------------------------------------------------------------------- 60ns	
		ALU_Zero <= '0'; 								 -- Settin ALU_Zero equal to 0
		---------------------------------------------------------------------------------------------------------------------- 60ns	
		-- ori r1, r0, 1
		---------------------------------------------------------------------------------------------------------------------- 60ns	
		Instruction(31 downto 26) <= "110011";			 -- Setting the Opcode for 'ori'
		Instruction(25 downto 21) <= "00000";			 -- Setting the Rs register to R0
		Instruction(20 downto 16) <= "00001";			 -- Setting the Rd register to R1
		Instruction(15 downto  0) <= "0000000000000001"; --	Setting the value of Immediate to 1
		wait for clk_period*5; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 210ns
		ALU_Zero <= '1'; 								 -- Settin ALU_Zero equal to 1
		wait for clk_period*5;							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 360ns

------------------------------------------------------------------------------------------------------------------------------ 360ns
	-- Testing if R type instructions run through the expected states
	    ---------------------------------------------------------------------------------------------------------------------- 360ns	
		ALU_Zero <= '0'; 								 -- Settin ALU_Zero equal to 0
		---------------------------------------------------------------------------------------------------------------------- 360ns	
		-- add r3, r1, r2
		---------------------------------------------------------------------------------------------------------------------- 360ns	
		Instruction(31 downto 26) <= "100000";			 -- Setting the Opcode for 'add'
		Instruction(25 downto 21) <= "00001";			 -- Setting the Rs register to R1
		Instruction(20 downto 16) <= "00011";			 -- Setting the Rd register to R3
		Instruction(15 downto 11) <= "00010";			 -- Setting the Rt register to R2
		Instruction(10 downto  6) <= "00000";			 -- 'Not used' bits
		Instruction( 5 downto  0) <= "110000";			 -- Setting Func to 'add'
		wait for clk_period*5; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 510ns	
		ALU_Zero <= '1'; 								 -- Settin ALU_Zero equal to 1
		wait for clk_period*5;							 -- Waiting for 5 clocks (1 for each state)		
		---------------------------------------------------------------------------------------------------------------------- 660ns

------------------------------------------------------------------------------------------------------------------------------ 660ns
	-- Testing if Branch type instructions run through the expected states
	    ---------------------------------------------------------------------------------------------------------------------- 660ns	
		ALU_Zero <= '0'; 								 -- Settin ALU_Zero equal to 0
		---------------------------------------------------------------------------------------------------------------------- 660ns	
		-- b 0x4
		---------------------------------------------------------------------------------------------------------------------- 660ns	
		Instruction(31 downto 26) <= "111111";			 -- Setting the Opcode for 'b'
		Instruction(25 downto 21) <= "00000";			 -- Setting the Rs register to 0 (irrelevant)
		Instruction(20 downto 16) <= "00001";			 -- Setting the Rd register to 1 (irrelevant)
		Instruction(15 downto  0) <= "0000000000000100"; --	Setting the value of Immediate to 4
		wait for clk_period*4; 							 -- Waiting for 4 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 780ns	
		ALU_Zero <= '1'; 								 -- Settin ALU_Zero equal to 1
		wait for clk_period*4;							 -- Waiting for 5 clocks (1 for each state)		
		---------------------------------------------------------------------------------------------------------------------- 900ns		

		---------------------------------------------------------------------------------------------------------------------- 900ns	
		-- bne r1, r0, 0x4
		---------------------------------------------------------------------------------------------------------------------- 900ns	
		Instruction(31 downto 26) <= "000001";			 -- Setting the Opcode for 'bne'
		Instruction(25 downto 21) <= "00000";			 -- Setting the Rs register to R0 
		Instruction(20 downto 16) <= "00001";			 -- Setting the Rd register to R1 
		Instruction(15 downto  0) <= "0000000000000100"; --	Setting the value of Immediate to 4
		ALU_Zero 				  <= '1'; 				 -- Setting ALU_Zero equal to 0 (Supposing R1 = R0)
		wait for clk_period*5; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 1050ns	
		ALU_Zero 				  <= '0'; 				 -- Setting ALU_Zero equal to 1 (Supposing R1 /= R0)
		wait for clk_period*5; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 1200ns	

		---------------------------------------------------------------------------------------------------------------------- 1200ns	
		-- beq r1, r0, 0x8
		---------------------------------------------------------------------------------------------------------------------- 1200ns	
		Instruction(31 downto 26) <= "000000";			 -- Setting the Opcode for 'beq'
		Instruction(25 downto 21) <= "00000";			 -- Setting the Rs register to R0 
		Instruction(20 downto 16) <= "00001";			 -- Setting the Rd register to R1 
		Instruction(15 downto  0) <= "0000000000001000"; --	Setting the value of Immediate to 8
		ALU_Zero 				  <= '1'; 				 -- Setting ALU_Zero equal to 0 (Supposing R1 = R0)
		wait for clk_period*5; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 1350ns
		ALU_Zero 				  <= '0'; 				 -- Setting ALU_Zero equal to 1 (Supposing R1 /= R0)
		wait for clk_period*5; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 1500ns		

------------------------------------------------------------------------------------------------------------------------------ 1500ns
	-- Testing if LoadStore type instructions run through the expected states
	    ---------------------------------------------------------------------------------------------------------------------- 1500ns	
		ALU_Zero <= '0'; 								 -- Settin ALU_Zero equal to 0
		---------------------------------------------------------------------------------------------------------------------- 1500ns	
		-- sw r1, 0x4(r0)
		---------------------------------------------------------------------------------------------------------------------- 1500ns	
		Instruction(31 downto 26) <= "011111";			 -- Setting the Opcode for 'sw'
		Instruction(25 downto 21) <= "00000";			 -- Setting the Rs register to R0
		Instruction(20 downto 16) <= "00001";			 -- Setting the Rd register to R1
		Instruction(15 downto  0) <= "0000000000000100"; --	Setting the value of Immediate to 4
		wait for clk_period*5; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 1650ns	
		ALU_Zero <= '1'; 								 -- Settin ALU_Zero equal to 1
		wait for clk_period*5;							 -- Waiting for 5 clocks (1 for each state)		
		---------------------------------------------------------------------------------------------------------------------- 1800ns

		---------------------------------------------------------------------------------------------------------------------- 1800ns	
		ALU_Zero <= '0'; 								 -- Settin ALU_Zero equal to 0
		---------------------------------------------------------------------------------------------------------------------- 1800ns	
		-- sb r1, 0x4(r0)
		---------------------------------------------------------------------------------------------------------------------- 1800ns	
		Instruction(31 downto 26) <= "000111";			 -- Setting the Opcode for 'sb'
		Instruction(25 downto 21) <= "00000";			 -- Setting the Rs register to R0
		Instruction(20 downto 16) <= "00001";			 -- Setting the Rd register to R1
		Instruction(15 downto  0) <= "0000000000000100"; --	Setting the value of Immediate to 4
		wait for clk_period*5; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 1950ns	
		ALU_Zero <= '1'; 								 -- Settin ALU_Zero equal to 1
		wait for clk_period*5;							 -- Waiting for 5 clocks (1 for each state)		
		---------------------------------------------------------------------------------------------------------------------- 2100ns
		
		---------------------------------------------------------------------------------------------------------------------- 2100ns	
		ALU_Zero <= '0'; 								 -- Settin ALU_Zero equal to 0
		---------------------------------------------------------------------------------------------------------------------- 2100ns	
		-- lw r1, 0x2(r0)
		---------------------------------------------------------------------------------------------------------------------- 2100ns	
		Instruction(31 downto 26) <= "001111";			 -- Setting the Opcode for 'lw'
		Instruction(25 downto 21) <= "00000";			 -- Setting the Rs register to R0
		Instruction(20 downto 16) <= "00001";			 -- Setting the Rd register to R1
		Instruction(15 downto  0) <= "0000000000001000"; --	Setting the value of Immediate to 8
		wait for clk_period*6; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 2800ns	
		ALU_Zero <= '1'; 								 -- Settin ALU_Zero equal to 1
		wait for clk_period*6;							 -- Waiting for 5 clocks (1 for each state)		
		---------------------------------------------------------------------------------------------------------------------- 2460ns
		
		---------------------------------------------------------------------------------------------------------------------- 2460ns	
		ALU_Zero <= '0'; 								 -- Settin ALU_Zero equal to 0
		---------------------------------------------------------------------------------------------------------------------- 2460ns	
		-- lb r1, 0x2(r0)
		---------------------------------------------------------------------------------------------------------------------- 2460ns	
		Instruction(31 downto 26) <= "000011";			 -- Setting the Opcode for 'lb'
		Instruction(25 downto 21) <= "00000";			 -- Setting the Rs register to R0
		Instruction(20 downto 16) <= "00001";			 -- Setting the Rd register to R1
		Instruction(15 downto  0) <= "0000000000001000"; --	Setting the value of Immediate to 8
		wait for clk_period*6; 							 -- Waiting for 5 clocks (1 for each state)
		---------------------------------------------------------------------------------------------------------------------- 2640ns	
		ALU_Zero <= '1'; 								 -- Settin ALU_Zero equal to 1
		wait for clk_period*6;							 -- Waiting for 5 clocks (1 for each state)		
		---------------------------------------------------------------------------------------------------------------------- 2820ns
		stop_the_clock <= true;
		wait;
   end process;

END;
