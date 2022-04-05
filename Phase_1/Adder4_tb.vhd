LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Adder4_tb IS
END Adder4_tb;
 
ARCHITECTURE behavior OF Adder4_tb IS 
 
	-- Creating the component of Adder4
	component Adder4
		port( DataIn  : IN  std_logic_vector(31 downto 0);
				DataOut : OUT std_logic_vector(31 downto 0)
      );
    end component;
    

   -- Input signal
   signal DataIn : std_logic_vector(31 downto 0) := (others => '0');

 	-- Output signla
   signal DataOut : std_logic_vector(31 downto 0);
 
BEGIN
 
   uut: Adder4 
		PORT MAP ( DataIn => DataIn,
					  DataOut => DataOut
      );

  
   -- Stimulus process
   stim_proc: process
   begin	
----------------------------------------------------------------------------------------------------------	
   -- Testing if the main function of addition works
		---------------------------------------------------------------------------------------------------- 0ns
		DataIn <= "00000000000000000000000000000000"; -- Setting first input equal to 0.
      wait for 100 ns;										 -- Expecting DataOut equal to 4.
		---------------------------------------------------------------------------------------------------- 100ns
		DataIn <= "00000000000000000000000000000100"; -- Setting first input equal to 4.
      wait for 100 ns;										 -- Expecting DataOut equal to 8.
		---------------------------------------------------------------------------------------------------- 200ns
		DataIn <= "11111111111111111111111111111111"; -- Setting first input equal to 1s.
      wait for 100 ns;										 -- Expecting DataOut equal to be 3 due to overflow.
		---------------------------------------------------------------------------------------------------- 300ns
		DataIn <= "00000000000001001001101000001111"; -- Setting first input equal to 301583.
      wait for 100 ns;										 -- Expecting DataOut equal to 301587.
  		---------------------------------------------------------------------------------------------------- 400ns
		DataIn <= "00000000000000000000000000001111"; -- Setting first input equal to 15.
      wait for 100 ns;										 -- Expecting DataOut equal to 19.
  		---------------------------------------------------------------------------------------------------- 500ns
      wait;
   end process;

END;
