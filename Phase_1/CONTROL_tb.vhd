LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CONTROL_tb IS
END CONTROL_tb;
 
ARCHITECTURE behavior OF CONTROL_tb IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
   COMPONENT CONTROL
		Port ( ALU_zero 								  : in 	std_logic;
			    Instruction							  : in   std_logic_vector(5 downto 0);
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
    END COMPONENT;
    

   --Inputs
   signal ALU_zero : std_logic := '0';
   signal Instruction : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal PC_sel : std_logic;
   signal PC_LdEn : std_logic;
   signal RF_WrData_sel : std_logic;
   signal RF_B_sel : std_logic;
   signal RF_WrEn : std_logic;
   signal ImmExt_s : std_logic_vector(1 downto 0);
   signal ALU_Bin_sel : std_logic;
   signal ALU_func : std_logic_vector(3 downto 0);
   signal ByteOp : std_logic;
   signal Mem_WrEn : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL 
		PORT MAP ( ALU_zero => ALU_zero,
					  Instruction => Instruction,
					  PC_sel => PC_sel,
					  PC_LdEn => PC_LdEn,
					  RF_WrData_sel => RF_WrData_sel,
					  RF_B_sel => RF_B_sel,
					  RF_WrEn => RF_WrEn,
					  ImmExt_s => ImmExt_s,
					  ALU_Bin_sel => ALU_Bin_sel,
					  ALU_func => ALU_func,
					  ByteOp => ByteOp,
					  Mem_WrEn => Mem_WrEn
		);
 

   -- Stimulus process
   stim_proc: process
   begin		
------------------------------------------------------------------------------------------------
	-- Testing opcodes and funcs codes
		------------------------------------------------------------------------------------------
		Instruction(31 downto 26) <= "100000";	-- Opcode will be the same for the following tests
		Instruction(26 downto  6) <= x"00000";	-- Irrelevant
		------------------------------------------------------------------------------------------
		Instruction( 5 downto  0) <= "110000";	-- Func (Addition)
      wait for 100 ns;								-- Expecting PC_sel        -> 0 
															--           RF_WrData_sel -> 0
															-- 			 RF_B_sel      ->	0
															--           RF_WrEn			->	1
															--           ImmExt_s	   -> 00
															--           ALU_Bin_sel   -> 0
															--           ALU_func      -> 0000
															--           ByteOp        -> 0
															--           Mem_WrEn      -> 0
		------------------------------------------------------------------------------------------
		Instruction(5 downto  0) <= "110001";	-- Func (Subtraction)
		 wait for 100 ns;								-- Expecting PC_sel        -> 0
															--           RF_WrData_sel -> 0
															-- 			 RF_B_sel      ->	0
															--           RF_WrEn			->	1
															--           ImmExt_s	   -> 00
															--           ALU_Bin_sel   -> 0
															--           ALU_func      -> 0000
															--           ByteOp        -> 0
															--           Mem_WrEn      -> 0
		------------------------------------------------------------------------------------------		
      Instruction( 5 downto  0) <= "110000";	-- Func (Subtraction)
		 wait for 100 ns;								-- Expecting PC_sel        -> 0 
															--           RF_WrData_sel -> 0
															-- 			 RF_B_sel      ->	0
															--           RF_WrEn			->	1
															--           ImmExt_s	   -> 00
															--           ALU_Bin_sel   -> 0
															--           ALU_func      -> 0000
															--           ByteOp        -> 0
															--           Mem_WrEn      -> 0
		------------------------------------------------------------------------------------------
      wait for 100 ns;	
		------------------------------------------------------------------------------------------
      wait for 100 ns;	
		------------------------------------------------------------------------------------------      
		wait for 100 ns;
		------------------------------------------------------------------------------------------		
      wait for 100 ns;
		------------------------------------------------------------------------------------------		
      wait for 100 ns;
		------------------------------------------------------------------------------------------
		



      wait;
   end process;

END;
