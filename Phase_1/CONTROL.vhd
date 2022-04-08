library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROL is
	Port ( PC_LdEnbl, ALU_zero 				  : in 	std_logic;
			 Instruction							  : in   std_logic_vector(31 downto 0);
			 -- IFSTAGE INPUTS/OUTPUTS ---------------------------------------------
			 PC_sel, PC_LdEn  		  		     : out  std_logic;
       	 -- DECSTAGE INPUTS ----------------------------------------------------
			 RF_WrData_sel, RF_B_sel, RF_WrEn  : out  std_logic;
			 ImmExt_s			 					  : out  std_logic_vector ( 1 downto 0);  
			 -- EXSTAGE INPUTS -----------------------------------------------------	
			 ALU_Bin_sel		 					  : out  std_logic;	
			 ALU_func			 					  : out  std_logic_vector ( 3 downto 0);
			 -- MEMSTAGE INPUTS/OUTPUTS --------------------------------------------
			 ByteOp, Mem_WrEn  					  : out  std_logic
	 );
end CONTROL;

architecture Behavioral of CONTROL is
	
	-- Needed signals
	signal Opcode : std_logic_vector (5 downto 0);

------------------------------------------------------ Main Functions ------------------------------------------------------------------                                                                                    
begin
	Opcode <= Instruction(31 downto 26);
	
	---------------------------------------------------- +4/PC_Immed --------------------------------------------------------------------
	with Opcode select 
		PC_sel <= '1' 			  	when "111111",							-- Choosing PC_immed because we perform 'b' branch
					 ALU_zero 		when "000000",							-- Choosing PC_immed because we perform 'beq' branch
					 not ALU_zero 	when "000001",							-- Choosing PC_immed because we perform 'bne' branch
					 '0' 				when others;							-- Every other case we increment the PC by 4
					 
	----------------------------------------------------- PC_LdEn ------------------------------------------------------------------------
 	PC_LdEn <= PC_LdEnbl;													-- Setting PC load enable equal to PC_LbEnbl input
		
	---------------------------------------------------- ALU/MEM out ----------------------------------------------------------------------
	with Opcode select
		RF_WrData_sel <= '1' when "000011",								-- Choosing MEM_out because we perform 'lb'
							  '1' when "001111",								-- Choosing MEM_out because we perform 'lw'
							  '0' when others;								-- Every other case we choose ALU_out 
							  
	------------------------------------------------------ Rd/Rt --------------------------------------------------------------------------
	with Opcode select
		RF_B_sel <= '0' when "100000",									-- Choosing Rd as the RF_B (ALU functions)
					   '1' when others;										-- Every other case we choose Rt as the RF_B

	----------------------------------------------------- RF_WrEn ------------------------------------------------------------------------
	with Opcode select
		RF_WrEn <= '0' when "111111",										-- Setting RF write enable off because we perform 'b'
					  '0' when "000000",										-- Setting RF write enable off because we perform 'beq'
					  '0' when "000001",										-- Setting RF write enable off because we perform 'bne'
					  '0' when "000111",										-- Setting RF write enable off because we perform 'sb'
					  '0' when "011111",										-- Setting RF write enable off because we perform 'sw'
					  '1' when others;										-- Every other case we Setting RF write enable on
								
	---------------------------------------------------- ImmExt sel ----------------------------------------------------------------------
	with Opcode select
		ImmExt_s <= "00" when "110010",									-- Choosing upper zerofill because we perform 'nandi'
						"00" when "110011",									-- Choosing upper zerofill because we perform 'ori'
						"01" when "111000",                          -- Choosing sign extend because we perform 'li'
						"01" when "110000",                          -- Choosing sign extend because we perform 'addi'
						"01" when "000011",									-- Choosing upper zerofill because we perform 'lb'
						"01" when "001111",                          -- Choosing sign extend because we perform 'lw'
						"01" when "000111",									-- Choosing upper zerofill because we perform 'sb'
						"01" when "011111",                          -- Choosing sign extend because we perform 'sw'
						"10" when "111001",									-- Choosing lower zerofill because we perform 'lui'
						"11" when "111111",									-- Choosing sign extend and 2 lsl because we perform 'b'
						"11" when "000000",									-- Choosing sign extend and 2 lsl because we perform 'beq'
						"11" when "000001",									-- Choosing sign extend and 2 lsl because we perform 'bne'
						"00" when others;										-- Every other case we choose upper zerofill 
						

	--------------------------------------------------- RF_B/Immed -----------------------------------------------------------------------
	with Opcode select
		ALU_Bin_sel <= '0' when "100000",								-- Choosing RF_B as the second alu input because we perform ALU functions
					      '0' when "000000",								-- Choosing RF_B as the second alu input because we perform 'beq' branch
					      '0' when "000001",								-- Choosing RF_B as the second alu input because we perform 'bne' branch
						   '1' when others;									-- Every other case we choose Immed as the second alu input 
									 
	---------------------------------------------------- ALU_func ------------------------------------------------------------------------
	with Opcode select
		ALU_func <= Instruction(3 downto 0) when "100000",		   -- Choosing the func part of instruction as the alu function code
						"0000"						when "110000",			-- Choosing Addition as the alu function because we perform 'andi'
						"0101"						when "110010",			-- Choosing NAND as the alu function because we perform 'nandi'
						"0011"						when "110011",			-- Choosing OR as the alu function because we perform 'ori'
						"0001"						when "000000",			-- Choosing Subtract as the alu function because we perform 'beq'
						"0001"						when "000001",			-- Choosing Subtract as the alu function because we perform 'bne'
						"0000"						when others;			-- Every other case we choose Addition as the alu function 

	----------------------------------------------------- ByteOp -------------------------------------------------------------------------		    
	with Opcode select
		ByteOp <= '1' when "000011",										-- Setting Byte operation equal to 1 because we perform 'lb'
					 '1' when "000111",										-- Setting Byte operation equal to 1 because we perform 'sb'
					 '0' when others;											-- Every other case we choose lw/sw as the Byte operation
							  
	---------------------------------------------------- Mem_WrEn ------------------------------------------------------------------------	    
	with Opcode select
		Mem_WrEn <= '1' when "000111",									-- Setting Memory write enable on because we perform 'sb'
					   '1' when "011111",									-- Setting Memory write enable on because we perform 'sw'
					   '0' when others;										-- Every other case we set memory write enable off

end Behavioral;
