LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mux32_pkg.all;

ENTITY GenericMux32_tb IS
END GenericMux32_tb;
 
ARCHITECTURE behavior OF GenericMux32_tb IS
	-- Creating the component of GenericMux
	COMPONENT GenericMux32
		PORT ( DataIn  : IN MuxMatrix32;
				 DataSel : IN std_logic_vector(4 downto 0);
             DataOut : OUT std_logic_vector(31 downto 0)
      );
	END COMPONENT;
    
   -- Inputs Signal
   signal DataIn  : MuxMatrix32(3 downto 0) := (others => (others => '0'));
   signal DataSel : std_logic_vector(4 downto 0) := (others => '0');

 	-- Outputs Signal
   signal DataOut : std_logic_vector(31 downto 0);
   
BEGIN
	-- Declaring the Register32 port map
	uut: GenericMux32 
		PORT MAP ( DataIn => DataIn,
					  DataSel => DataSel,
					  DataOut => DataOut
		);

	-- Stimulus process
	stim_proc: process
	begin	
---------------------------------------------------------------------------------------------------------
	-- Testing if all the codes work for a 5 by 32 mux
	   --------------------------------------------------------------------------------------------------- 0ns
		DataIn(0) <= "00000000000000000000000000000000";  -- Setting the first  input equal to 0
		DataIn(1) <= "00000000000000000000000000000001";  -- Setting the second input equal to 1	
		DataIn(2) <= "00000000000000000000000000000010";  -- Setting the third  input equal to 2
		DataIn(3) <= "00000000000000000000000000000011";  -- Setting the forth  input equal to 3
		--------------------------------------------------------------------------------------------------- 0ns
		DataSel <= "00000";										  -- Selecting the first input
		wait for 100 ns;											  -- Expecting 0
		--------------------------------------------------------------------------------------------------- 100ns		
		DataSel <= "00001";										  -- Selecting the second input
		wait for 100 ns;											  -- Expecting 1
		--------------------------------------------------------------------------------------------------- 200ns		
		DataSel <= "00010";										  -- Selecting the third input
		wait for 100 ns;											  -- Expecting 2
		--------------------------------------------------------------------------------------------------- 300ns
		DataSel <= "00011";										  -- Selecting the forth input
		wait for 100 ns;											  -- Expecting 3
		--------------------------------------------------------------------------------------------------- 400ns

---------------------------------------------------------------------------------------------------------
	-- Testing some random values
		--------------------------------------------------------------------------------------------------- 400ns
		DataIn(0) <= "00000000001111110001100001000000";  -- Setting the first  input equal to 4134976
		DataIn(1) <= "11111111111111111111111111111111";  -- Setting the second input equal to -1	
		DataIn(2) <= "10101010101010101010101010101010";  -- Setting the third  input equal to -1431655766
		DataIn(3) <= "00100101101110001110010110101010";  -- Setting the forth  input equal to 632874410
		--------------------------------------------------------------------------------------------------- 400ns
		DataSel <= "00000";										  -- Selecting the first input
		wait for 100 ns;											  -- Expecting 4134976
		--------------------------------------------------------------------------------------------------- 500ns		
		DataSel <= "00001";										  -- Selecting the second input
		wait for 100 ns;											  -- Expecting -1
		--------------------------------------------------------------------------------------------------- 600ns		
		DataSel <= "00010";										  -- Selecting the third input
		wait for 100 ns;											  -- Expecting -1431655766
		--------------------------------------------------------------------------------------------------- 700ns
		DataSel <= "00011";										  -- Selecting the forth input
		wait for 100 ns;											  -- Expecting 632874410
		--------------------------------------------------------------------------------------------------- 800ns
		wait; 
	end process;
END;
