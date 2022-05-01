LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CONTROL_tb IS
END CONTROL_tb;
 
ARCHITECTURE behavior OF CONTROL_tb IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
   COMPONENT CONTROL
		Port ( PC_LdEnbl, ALU_zero 				 : in 	std_logic;			    
			   Instruction						 : in   std_logic_vector(31 downto 0);
			   -- IFSTAGE INPUTS/OUTPUTS ---------------------------------------------
			   PC_sel, PC_LdEn  		  		 : out  std_logic;
			   -- DECSTAGE INPUTS ----------------------------------------------------
			   RF_WrData_sel, RF_B_sel, RF_WrEn  : out  std_logic;
			   ImmExt_s			 				 : out  std_logic_vector ( 1 downto 0);  
			   -- EXSTAGE INPUTS -----------------------------------------------------	
			   ALU_Bin_sel		 				 : out  std_logic;	
			   ALU_func			 				 : out  std_logic_vector ( 3 downto 0);
			   -- MEMSTAGE INPUTS/OUTPUTS --------------------------------------------
			   ByteOp, Mem_WrEn  				 : out  std_logic
		);
    END COMPONENT;
    

   --Inputs
	signal PC_LdEnbl     : std_logic := '0';	
	signal ALU_zero 	 : std_logic := '0';
	signal Instruction   : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
	signal PC_sel 		 : std_logic;
	signal PC_LdEn 		 : std_logic;
	signal RF_WrData_sel : std_logic;
	signal RF_B_sel 	 : std_logic;
	signal RF_WrEn 	 	 : std_logic;
	signal ImmExt_s 	 : std_logic_vector(1 downto 0);
	signal ALU_Bin_sel   : std_logic;
	signal ALU_func 	 : std_logic_vector(3 downto 0);
	signal ByteOp 		 : std_logic;
	signal Mem_WrEn 	 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL 
		PORT MAP ( PC_LdEnbl   	 => PC_LdEnbl,
				   ALU_zero 	 => ALU_zero,
				   Instruction   => Instruction,
				   PC_sel      	 => PC_sel,
				   PC_LdEn       => PC_LdEn,
				   RF_WrData_sel => RF_WrData_sel,
				   RF_B_sel 	 => RF_B_sel,
				   RF_WrEn 		 => RF_WrEn,
				   ImmExt_s 	 => ImmExt_s,
				   ALU_Bin_sel 	 => ALU_Bin_sel,
				   ALU_func 	 => ALU_func,
				   ByteOp 		 => ByteOp,
				   Mem_WrEn 	 => Mem_WrEn
		);
 

   -- Stimulus process
   stim_proc: process
   begin		
------------------------------------------------------------------------------------------------
	PC_LdEnbl <= '1'; 							-- PC_LdEnbl will be on for the following tests
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
	-- Testing opcode and for 'b' branch
		------------------------------------------------------------------------------------------ 1700ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 1														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 0    ImmExt_s -> 11	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 1700ns
		Instruction(31 downto 26) <= "111111";	-- Opcode (b)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 1800ns


------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'beq' branch
		------------------------------------------------------------------------------------------ 1800ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> ALU_zero												-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 0    RF_WrEn -> 0    ImmExt_s -> 11	-- DECstage
		-- ALU_Bin_sel   -> 0    ALU_func -> 0001 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 1800ns
		Instruction(31 downto 26) <= "000000";	-- Opcode (beq)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Rs != Rt
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 1900ns		
		ALU_zero <= '1'; 						-- Rs == Rt
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 2000ns


------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'bne' branch
		------------------------------------------------------------------------------------------ 2000ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> not ALU zero											-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 0    RF_WrEn -> 0    ImmExt_s -> 11	-- DECstage
		-- ALU_Bin_sel   -> 0    ALU_func -> 0001 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 2000ns
		Instruction(31 downto 26) <= "000001";	-- Opcode (bne)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Rs != Rt
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 2100ns		
		ALU_zero <= '1'; 						-- Rs == Rt
		wait for 100 ns;								
		------------------------------------------------------------------------------------------ 2200ns


------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'lb' branch
		------------------------------------------------------------------------------------------ 2200ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0														-- IFstage
		-- RF_WrData_sel -> 1    RF_B_sel -> 1    RF_WrEn -> 1    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 1    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 2200ns
		Instruction(31 downto 26) <= "000011";	-- Opcode (lb)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 2300ns

		
------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'sb' branch
		------------------------------------------------------------------------------------------ 2300ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 0    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 1    Mem_WrEn -> 1										-- MEMstage
		------------------------------------------------------------------------------------------ 2300ns
		Instruction(31 downto 26) <= "000111";	-- Opcode (sb)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 2400ns
		
------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'lw' branch
		------------------------------------------------------------------------------------------ 2400ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0														-- IFstage
		-- RF_WrData_sel -> 1    RF_B_sel -> 1    RF_WrEn -> 1    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 0										-- MEMstage
		------------------------------------------------------------------------------------------ 2400ns
		Instruction(31 downto 26) <= "001111";	-- Opcode (lw)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 2500ns		
		
		
------------------------------------------------------------------------------------------------
	-- Testing opcode and for 'sw' branch
		------------------------------------------------------------------------------------------ 2500ns
		-- For the following tests we expect the outputs equal to
		-- PC_sel        -> 0														-- IFstage
		-- RF_WrData_sel -> 0    RF_B_sel -> 1    RF_WrEn -> 0    ImmExt_s -> 01	-- DECstage
		-- ALU_Bin_sel   -> 1    ALU_func -> 0000 									-- EXstage
		-- ByteOp  		 -> 0    Mem_WrEn -> 1										-- MEMstage
		------------------------------------------------------------------------------------------ 2500ns
		Instruction(31 downto 26) <= "011111";	-- Opcode (sw)
		Instruction(25 downto  6) <= x"00000";	-- Irrelevant again
		Instruction( 5 downto  0) <= "000000";	-- Irrelevant
		ALU_zero <= '0'; 						-- Irrelevant
		wait for 100 ns;
		------------------------------------------------------------------------------------------ 2600ns			
		wait;
   end process;
	
END;