LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CONTROL_PIPELINE_tb IS
END CONTROL_PIPELINE_tb;
 
architecture behavior of CONTROL_PIPELINE_tb is 
  
    component CONTROL_PIPELINE
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
    end component;
    

	--Inputs
	signal ALU_zero     : std_logic := '0';
	signal Instruction  : std_logic_vector(31 downto 0) := (others => '0');

	--Outputs
	signal PCSrc 		: std_logic;
	signal MemtoReg 	: std_logic;
	signal RegDst 		: std_logic;
	signal RegWrite 	: std_logic;
	signal ImmExt_s 	: std_logic_vector(1 downto 0);
	signal ALUSrc 		: std_logic;
	signal ALU_func 	: std_logic_vector(3 downto 0);
	signal MemByteOp 	: std_logic;
	signal Mem_Write 	: std_logic;
	signal DEC_Reg_WrEn : std_logic;
	signal EX_Reg_WrEn  : std_logic;
	signal Mem_Reg_WrEn : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: CONTROL_PIPELINE 
		Port map ( ALU_zero     => ALU_zero,
				   Instruction  => Instruction,
				   PCSrc 		=> PCSrc,
				   MemtoReg 	=> MemtoReg,
				   RegDst 		=> RegDst,
				   RegWrite 	=> RegWrite,
				   ImmExt_s 	=> ImmExt_s,
				   ALUSrc 		=> ALUSrc,
				   ALU_func 	=> ALU_func,
				   MemByteOp 	=> MemByteOp,
				   Mem_Write  	=> Mem_Write,
				   DEC_Reg_WrEn => DEC_Reg_WrEn,
				   EX_Reg_WrEn  => EX_Reg_WrEn,
				   Mem_Reg_WrEn => Mem_Reg_WrEn
        );


   -- Stimulus process
   stim_proc: process
   begin		
------------------------------------------------------------------------------------------------
	-- Testing opcodes and funcs codes
		------------------------------------------------------------------------------------------ 0ns
		Instruction(31 downto 26) <= "100000";	-- Opcode will be the same for the following tests
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		------------------------------------------------------------------------------------------ 0ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0  														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 0    RF_WrEn -> 1    ImmExt_s -> 00	-- DECstage
		-- ALU_Bin_sel   -> 0    ALU_func -> Different every time					-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 0ns
		Instruction( 5 downto  0) <= "110000";  -- Func (Addition)
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 100ns
		Instruction( 5 downto  0) <= "110001";	-- Func (Subtraction)
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 200ns		
		Instruction( 5 downto  0) <= "110010";	-- Func (And)
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 300ns 
		Instruction( 5 downto  0) <= "110011";	-- Func (or)
		wait for 100 ns;	
		------------------------------------------------------------------------------------------ 400ns
		Instruction( 5 downto  0) <= "110100";	-- Func (not)
		wait for 100 ns;	
		------------------------------------------------------------------------------------------ 500ns      
		Instruction( 5 downto  0) <= "110101";	-- Func (nand)
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 600ns
		Instruction( 5 downto  0) <= "110110";	-- Func (nor)		
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 700ns
		Instruction( 5 downto  0) <= "111000";	-- Func (sra)
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 800ns
		Instruction( 5 downto  0) <= "111001";	-- Func (srl)
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 900ns
		Instruction( 5 downto  0) <= "111010";	-- Func (sll)
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 1000ns
		Instruction( 5 downto  0) <= "111100";	-- Func (rol)
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 1100ns
		Instruction( 5 downto  0) <= "111101";	-- Func (ror)
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 1200ns
		

------------------------------------------------------------------------------------------------
	-- Testing opcode and for li
		------------------------------------------------------------------------------------------ 1200ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0  														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 1    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 1200ns
		Instruction(31 downto 26) <= "111000";	-- Opcode (li)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 1300ns
		

------------------------------------------------------------------------------------------------
	-- Testing opcode and for lui
		------------------------------------------------------------------------------------------ 1300ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0  														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 1    ImmExt_s -> 10	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 1300ns
		Instruction(31 downto 26) <= "111001";	-- Opcode (lui)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 1400ns


------------------------------------------------------------------------------------------------
	-- Testing opcode and for addi
		------------------------------------------------------------------------------------------ 1400ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0  														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 1    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 1400ns
		Instruction(31 downto 26) <= "110000";	-- Opcode (addi)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 1500ns


------------------------------------------------------------------------------------------------
	-- Testing opcode and for nandi
		------------------------------------------------------------------------------------------ 1500ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0  														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 1    ImmExt_s -> 00	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0101 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 1500ns
		Instruction(31 downto 26) <= "110010";	-- Opcode (nandi)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 1600ns


------------------------------------------------------------------------------------------------
	-- Testing opcode and for ori
		------------------------------------------------------------------------------------------ 1600ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0  													    -- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 1    ImmExt_s -> 00	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0011 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 1600ns
		Instruction(31 downto 26) <= "110011";	-- Opcode (ori)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 1700ns
		

------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'lb' branch
		------------------------------------------------------------------------------------------ 1700ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0														-- IFstage
		-- RF_WrData_sel -> 1    RF_B_sel -> 1    RF_WrEn -> 1    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 1    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 1700ns
		Instruction(31 downto 26) <= "000011";	-- Opcode (lb)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 1800ns

		
--------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'sb' branch
		------------------------------------------------------------------------------------------ 1800ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 0    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 1    Mem_WrEn -> 1										-- MEMstage
		------------------------------------------------------------------------------------------ 1800ns
		Instruction(31 downto 26) <= "000111";	-- Opcode (sb)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 1900ns
		
		
------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'lw' branch
		------------------------------------------------------------------------------------------ 1900ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0														-- IFstage
		-- RF_WrData_sel -> 1    RF_B_sel -> 1    RF_WrEn -> 1    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 1900ns
		Instruction(31 downto 26) <= "001111";	-- Opcode (lw)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 2000ns		
		
		
--------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'sw' branch
		------------------------------------------------------------------------------------------ 2000ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 0    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 1										-- MEMstage
		------------------------------------------------------------------------------------------ 2000ns
		Instruction(31 downto 26) <= "011111";	-- Opcode (sw)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 2100ns			
		wait;
   end process;
  
END;