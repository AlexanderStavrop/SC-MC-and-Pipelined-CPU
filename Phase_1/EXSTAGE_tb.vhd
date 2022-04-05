LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY EXSTAGE_tb IS
END EXSTAGE_tb;
 
ARCHITECTURE behavior OF EXSTAGE_tb IS 
 
 
    COMPONENT EXSTAGE
    PORT(
         RF_A : IN  std_logic_vector(31 downto 0);
         RF_B : IN  std_logic_vector(31 downto 0);
         Immed : IN  std_logic_vector(31 downto 0);
         ALU_Bin_sel : IN  std_logic;
         ALU_func : IN  std_logic_vector(3 downto 0);
         ALU_out : OUT  std_logic_vector(31 downto 0);
         ALU_zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RF_A : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_B : std_logic_vector(31 downto 0) := (others => '0');
   signal Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Bin_sel : std_logic := '0';
   signal ALU_func : std_logic_vector(3 downto 0) := (others => '0');
	signal temp 	 : std_logic:= '0';

 	--Outputs
   signal ALU_out  : std_logic_vector(31 downto 0);
   signal ALU_zero : std_logic;
  
BEGIN
  
	-- Instantiate the Unit Under Test (UUT)
   uut: EXSTAGE PORT MAP (
          RF_A => RF_A,
          RF_B => RF_B,
          Immed => Immed,
          ALU_Bin_sel => ALU_Bin_sel,
          ALU_func => ALU_func,
          ALU_out => ALU_out,
          ALU_zero => ALU_zero
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
---------------------------------------------------------------------------------------------------------------------
		RF_A  <= "00000000000000000000000000000000";  -- 16
		RF_B  <= "00000000000000000000000000001111";
		Immed <= "00000000000000000000000000000000";  -- 1
	   ALU_Bin_sel <= '0';
		ALU_func <= "0000";
		wait for 100ns;
---------------------------------------------------------------------------------------------------------------------
		RF_A  <= "00000000000000000000000000001111";  -- 10
		RF_B  <= "00000000000000000000000000000111";	 -- 7
		Immed <= "00000000000000000000000000001100";  -- 3
	   ALU_Bin_sel <= '0'; 
		ALU_func <= "0001"; 
---------------------------------------------------------------------------------------------------------------------
		wait;
   end process; 

END;
