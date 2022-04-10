LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY EXSTAGE_tb IS
END EXSTAGE_tb;
 
ARCHITECTURE behavior OF EXSTAGE_tb IS 
 
	COMPONENT EXSTAGE
		Port ( RF_A, RF_B, Immed 				: in  STD_LOGIC_VECTOR (31 downto 0);
	          ALU_func 							: in  STD_LOGIC_VECTOR (3 downto 0);
             ALU_Bin_sel 						: in  STD_LOGIC;
             ALU_out 						   : out  STD_LOGIC_VECTOR (31 downto 0);
             ALU_zero, ALU_cout, ALU_ovf  : out  STD_LOGIC
		);
   END COMPONENT;
    

   -- Input signals
   signal RF_A        : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_B 		 : std_logic_vector(31 downto 0) := (others => '0');
   signal Immed 		 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Bin_sel : std_logic := '0';
   signal ALU_func    : std_logic_vector(3 downto 0) := (others => '0');

 	-- Output signals
   signal ALU_out  	 : std_logic_vector(31 downto 0);
   signal ALU_zero 	 : std_logic;
	signal ALU_cout    : std_logic;
   signal ALU_ovf     : std_logic;

  
BEGIN
  
	-- Instantiate the Unit Under Test (UUT)
   uut: EXSTAGE 
		PORT MAP ( RF_A        => RF_A,
					  RF_B        => RF_B,
					  Immed       => Immed,
                 ALU_Bin_sel => ALU_Bin_sel,
					  ALU_func    => ALU_func,
					  ALU_out     => ALU_out,
					  ALU_zero    => ALU_zero,
					  ALU_cout	  => ALU_cout,
					  ALU_ovf     => ALU_ovf
		); 
 

   -- Stimulus process
   stim_proc: process
   begin		
-----------------------------------------------------------------------------------------------------------
	-- Testing that the mux works correctly and two random operation of ALU works as intented
		----------------------------------------------------------------------------------------------------- 0ns
		RF_A  <= "00000000000000000000000000000100"; -- Setting the value of RF_A equal to 4
		RF_B  <= "00000000000000000000000000001111";	-- Setting the value of RF_B equal to 15
		Immed <= "00000000000000000000000000000010"; -- Setting the value of Immed equal to 2
	   ALU_Bin_sel <= '0';									-- Choosing the RF_B as the second ALU input
		ALU_func <= "0000";									-- Choosing the addition function of ALU
		wait for 100ns;										-- Expecting ALU_out equal to 19
		----------------------------------------------------------------------------------------------------- 100ns
		RF_A  <= "00000000000000000000000000010101"; -- Setting the value of RF_A equal to 21
		RF_B  <= "00000000000000000000000000001111";	-- Setting the value of RF_B equal to 15
		Immed <= "00000000000000000000000000000100"; -- Setting the value of Immed equal to 4
	   ALU_Bin_sel <= '1';									-- Choosing the Immed as the second ALU input
		ALU_func <= "0001";									-- Choosing the subtraction function of ALU
		wait for 100ns;										-- Expecting ALU_out equal to 17
		----------------------------------------------------------------------------------------------------- 200ns
		RF_A  <= "00000000000000000000000000010101"; -- Setting the value of RF_A equal to 21
		RF_B  <= "00000000000000000000000000010101";	-- Setting the value of RF_B equal to 21
		Immed <= "00000000000000000000000000000100"; -- Setting the value of Immed equal to 4
	   ALU_Bin_sel <= '0';									-- Choosing the Immed as the second ALU input
		ALU_func <= "0001";									-- Choosing the subtraction function of ALU
		wait for 100ns;										-- Expecting ALU_out equal to 0 and Zero out flag.
		----------------------------------------------------------------------------------------------------- 300ns
		wait;
   end process; 

END;
