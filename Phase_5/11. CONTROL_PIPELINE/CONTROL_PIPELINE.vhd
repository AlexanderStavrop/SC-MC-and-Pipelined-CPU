library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROL_PIPELINE is
	Port ( ALU_zero 				  			  : in  std_logic;
		   Instruction				  			  : in  std_logic_vector(31 downto 0);
		   -- IFSTAGE INPUTS/OUTPUTS ---------------------------------------------
		   PCSrc	                  			  : out std_logic;
		   -- DECSTAGE INPUTS ----------------------------------------------------
		   MemtoReg, RegDst, RegWrite 			  : out std_logic;
		   ImmExt_s			 		  			  : out std_logic_vector ( 1 downto 0);  
		   -- EXSTAGE INPUTS -----------------------------------------------------	
		   ALUSrc		 			  			  : out std_logic;	
		   ALU_func			 		  			  : out std_logic_vector ( 3 downto 0);
		   -- MEMSTAGE INPUTS/OUTPUTS --------------------------------------------
		   MemByteOp, Mem_Write			    	  : out std_logic;
		   -- REGISTER INPUTS ---------------------------------------------------
		   DEC_Reg_WrEn,EX_Reg_WrEn, Mem_Reg_WrEn : out std_logic
	 );
end CONTROL_PIPELINE;

	architecture Behavioral of CONTROL_PIPELINE is
	
	-- Needed signals
	signal Opcode : std_logic_vector (5 downto 0);

------------------------------------------------------ Main Functions ------------------------------------------------------------------                                                                                    
begin
	Opcode <= Instruction(31 downto 26);
	
	---------------------------------------------------- +4/PC_Immed --------------------------------------------------------------------
	PCSrc <= '0'; 
					
	---------------------------------------------------- ALU/MEM out ----------------------------------------------------------------------
	with Opcode select
		MemtoReg <= '1' when "000011",						-- Choosing MEM_out because we perform 'lb'
					'1' when "001111",						-- Choosing MEM_out because we perform 'lw'
					'0' when others;						-- Every other case we choose ALU_out 
							  
	------------------------------------------------------ Rd/Rt --------------------------------------------------------------------------
	with Opcode select
		RegDst <= '0' when "100000",						-- Choosing Rd as the RF_B (ALU functions)
				  '1' when others;							-- Every other case we choose Rt as the RF_B

	----------------------------------------------------- RF_WrEn ------------------------------------------------------------------------
	with Opcode select
		RegWrite <= '0' when "000111",						-- Setting RF write enable off because we perform 'sb'
					'0' when "011111",						-- Setting RF write enable off because we perform 'sw'
					'1' when others;						-- Every other case we Setting RF write enable on
								
	---------------------------------------------------- ImmExt sel ----------------------------------------------------------------------
	with Opcode select
		ImmExt_s <= "00" when "110010",						-- Choosing upper zerofill because we perform 'nandi'
					"00" when "110011",						-- Choosing upper zerofill because we perform 'ori'
					"01" when "111000",                     -- Choosing sign extend because we perform 'li'
					"01" when "110000",                     -- Choosing sign extend because we perform 'addi'
					"01" when "000011",						-- Choosing sign extend because we perform 'lb'
					"01" when "001111",                     -- Choosing sign extend because we perform 'lw'
					"01" when "000111",						-- Choosing sign extend because we perform 'sb'
					"01" when "011111",                     -- Choosing sign extend because we perform 'sw'
					"10" when "111001",						-- Choosing lower zerofill because we perform 'lui'
					"00" when others;						-- Every other case we choose upper zerofill 
						

	--------------------------------------------------- RF_B/Immed -----------------------------------------------------------------------
	with Opcode select
		ALUSrc <= '0' when "100000",						-- Choosing RF_B as the second alu input because we perform ALU functions
				  '1' when others;							-- Every other case we choose Immed as the second alu input 
									 
	---------------------------------------------------- ALU_func ------------------------------------------------------------------------
	with Opcode select
		ALU_func <= Instruction(3 downto 0) when "100000",	-- Choosing the func part of instruction as the alu function code
					"0000"					when "110000",	-- Choosing Addition as the alu function because we perform 'andi'
					"0101"					when "110010",	-- Choosing NAND as the alu function because we perform 'nandi'
					"0011"					when "110011",	-- Choosing OR as the alu function because we perform 'ori'
					"0000"					when others;	-- Every other case we choose Addition as the alu function 

	----------------------------------------------------- ByteOp -------------------------------------------------------------------------		    
	with Opcode select
		MemByteOp <= '1' when "000011",						-- Setting Byte operation equal to 1 because we perform 'lb'
				     '1' when "000111",						-- Setting Byte operation equal to 1 because we perform 'sb'
				     '0' when others;						-- Every other case we choose lw/sw as the Byte operation
							  
	---------------------------------------------------- Mem_WrEn ------------------------------------------------------------------------	    
	with Opcode select
		Mem_Write <= '1' when "000111",						-- Setting Memory write enable on because we perform 'sb'
					 '1' when "011111",						-- Setting Memory write enable on because we perform 'sw'
					 '0' when others;						-- Every other case we set memory write enable off

	-------------------------------------------------------------------------------------------------------------------------------------
	DEC_Reg_WrEn <= '1';
	EX_Reg_WrEn  <= '1';
	Mem_Reg_WrEn <= '1';
	
end Behavioral;
