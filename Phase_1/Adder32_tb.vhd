LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Adder32_tb IS
END Adder32_tb;
 
ARCHITECTURE behavior OF Adder32_tb IS 
 
	-- Creating the component of Adder32
	COMPONENT Adder32
		PORT ( Inp_A, Inp_B : IN  std_logic_vector(31 downto 0);
				 DataOut 	  : OUT  std_logic_vector(31 downto 0)
      );
   END COMPONENT;
    

   -- Input signals
   signal Inp_A : std_logic_vector(31 downto 0) := (others => '0');
   signal Inp_B : std_logic_vector(31 downto 0) := (others => '0');

 	-- Output signals
   signal DataOut : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: Adder32 
		PORT MAP ( Inp_A => Inp_A,
					  Inp_B => Inp_B,
					  DataOut => DataOut
      );
		  
   -- Stimulus process
   stim_proc: process
   begin		
-------------------------------------------------------------------------------------------------------
	-- Testing if the main function of addition works
		------------------------------------------------------------------------------------------------- 0ns
		-- Testing positive numbers.
		------------------------------------------------------------------------------------------------- 0ns
		Inp_A <= "00000000000000000000000000000000";  -- Setting first input equal to 0
		Inp_B <= "00000000000000000000000000000001";	 -- Setting second input equal to 1
      wait for 100 ns;										 -- Expecting Data_out equal to 1
		------------------------------------------------------------------------------------------------- 100ns
		Inp_A <= "00000000000000000000000000000100";	 -- Setting first input equal to 4
		Inp_B <= "00000000000000000000000000001000";	 -- Setting second input equal to 8
      wait for 100 ns;										 -- Expecting Data_out equal to 12
		------------------------------------------------------------------------------------------------- 200ns 
		Inp_A <= "00000000000000000000001111101000";  -- Setting first input equal to 1000
		Inp_B <= "00000000000000000000001101000100";	 -- Setting second input equal to 836
      wait for 100 ns;										 -- Expecting Data_out equal to 1836
  		------------------------------------------------------------------------------------------------- 300ns
		Inp_A <= "00000000000000000000000000001111";	 -- Setting first input equal to 15
		Inp_B <= "00000000000000000000000000000100";	 -- Setting second input equal to 4
      wait for 100 ns;										 -- Expecting Data_out equal to 19
  		------------------------------------------------------------------------------------------------- 400ns 
		-- Testing Negative numbers.
		------------------------------------------------------------------------------------------------- 400ns
		Inp_A <= "00000000000000000000000000000000";  -- Setting first input equal to 0
		Inp_B <= "11111111111111111111110000011000";	 -- Setting second input equal to -1000
      wait for 100 ns;										 -- Expecting Data_out equal to -1000
  		------------------------------------------------------------------------------------------------- 500ns 
		Inp_A <= "11111111111111111111111111011000";  -- Setting first input equal to -40
		Inp_B <= "11111111111111111111110010111100";	 -- Setting second input equal to -836
      wait for 100 ns;										 -- Expecting Data_out equal to -876
  		------------------------------------------------------------------------------------------------- 600ns
      wait;
   end process;
END;
