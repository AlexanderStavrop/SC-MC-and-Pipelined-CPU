LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY EXSTAGE_PIPELINE_tb IS
END EXSTAGE_PIPELINE_tb;
 
architecture behavior of EXSTAGE_PIPELINE_tb is
  
    component EXSTAGE_PIPELINE
		Port ( ALU_Bin_sel 				   : in  std_logic;
			   ALU_func 				   : in  std_logic_vector(3 downto 0);
			   RF_A, RF_B, Immed, PC_4 	   : in  std_logic_vector(31 downto 0);
		       ALU_zero, ALU_cout, ALU_ovf : out std_logic;
		       ALU_out, Adder_out		   : out std_logic_vector(31 downto 0)
		);
    end component;
    

	--Inputs
	signal ALU_Bin_sel : std_logic := '0';
	signal ALU_func    : std_logic_vector(3 downto 0) := (others => '0');
	signal RF_A 	   : std_logic_vector(31 downto 0) := (others => '0');
	signal RF_B        : std_logic_vector(31 downto 0) := (others => '0');
	signal Immed 	   : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_4        : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
	signal ALU_out     : std_logic_vector(31 downto 0);
	signal Adder_out   : std_logic_vector(31 downto 0);
	signal ALU_zero    : std_logic;
	signal ALU_cout    : std_logic;
	signal ALU_ovf     : std_logic;
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
	uut: EXSTAGE_PIPELINE 
		Port map ( ALU_Bin_sel => ALU_Bin_sel,
				   ALU_func    => ALU_func,
				   RF_A 	   => RF_A,
				   RF_B 	   => RF_B,
				   Immed       => Immed,
				   PC_4        => PC_4,
				   ALU_out     => ALU_out,
				   Adder_out   => Adder_out,
				   ALU_zero    => ALU_zero,
				   ALU_cout    => ALU_cout,
				   ALU_ovf     => ALU_ovf
        );

   -- Stimulus process
   stim_proc: process
   begin		 
---------------------------------------------------------------------------------------------------------------------- 0ns
	-- Waiting for 100ns so everything sets up correctly
		wait for 100 ns;	
		-------------------------------------------------------------------------------------------------------------- 100ns

---------------------------------------------------------------------------------------------------------------------- 100ns
	-- Testing if Alu functions and Addition works as intended
		-------------------------------------------------------------------------------------------------------------- 100ns
		PC_4  		<= "00000000000000000000000000001000"; 	-- Setting PC+4 equal to 8
		Immed       <= "11111111111111111111111111111100";	-- Setting Immed equal to -4
		RF_A 	    <= "00000000000000000000000000000111";  -- Setting RF_A equal to 7 
		RF_B 	    <= "00000000000000000000000000001010";  -- Setting RF_A equal to 10 
		ALU_func    <= "0011";								-- Choosing Subtraction for ALU function
		ALU_Bin_sel <= '0';									-- Choosing RF_A as the second ALU input
		wait for 100 ns;									-- Expecting Adder out equal to 4 and ALU out equal to 15
		-------------------------------------------------------------------------------------------------------------- 200ns
		PC_4  		<= "00000000000000000000000000000100"; 	-- Setting PC+4 equal to 4
		Immed       <= "00000000000000000000000000001000";	-- Setting Immed equal to 8
		RF_A 	    <= "00000000000000000000000000000110";  -- Setting RF_A equal to 6 
		RF_B 	    <= "00000000000000000000000000000010";  -- Setting RF_A equal to 2 
		ALU_func    <= "0001";								-- Choosing Subtraction for ALU function
		ALU_Bin_sel <= '1';									-- Choosing Immed as the second ALU input
		wait for 100 ns;									-- Expecting Adder out equal to 12 and ALU out equal to -2
		-------------------------------------------------------------------------------------------------------------- 300ns
		wait;
   end process;

END;
