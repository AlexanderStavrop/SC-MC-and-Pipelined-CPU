LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.Mux32_pkg.all;

ENTITY Mux32_tb IS
END Mux32_tb;
 
ARCHITECTURE behavior OF Mux32_tb IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
   component Mux32
		port ( DataIn  : in  MuxMatrix32;
				 DataSel : in  std_logic;
				 DataOut : out std_logic_vector(31 downto 0)
      );
	end component;
    

   -- Input signals
   signal DataIn  : MuxMatrix32 := (others => (others => '0'));
   signal DataSel : std_logic := '0';

 	-- Output signals
   signal DataOut : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux32
		port map( DataIn  => DataIn,
					 DataSel => DataSel,
					 DataOut => DataOut
		);
  
   -- Stimulus process
   stim_proc: process
   begin		
-------------------------------------------------------------------------------------------------------------
   -- Testing if the multiplexer is working as expected
		------------------------------------------------------------------------------------------------------- 0ns
		DataIn(0) <= "00000000000000000000000000000000";   -- Setting the first input to 0
		DataIn(1) <= "00000000000000000000000000000001";	-- Setting the second input to 1
		------------------------------------------------------------------------------------------------------- 0ns
		DataSel <=  '0';												-- Selecting the first input
		wait for 100ns;												-- Expecting DataOut equal to 0 after 10ns
		------------------------------------------------------------------------------------------------------- 100ns   
		DataSel <=  '1';												-- Selecting the second input
		wait for 100ns;												-- Expecting DataOut equal to 1 after 10ns
		------------------------------------------------------------------------------------------------------- 200ns 
		DataIn(0) <= "00001010101001010101010101010110";   -- Setting the first input to 178607446
		DataIn(1) <= "00000111111011101001010000000001";	-- Setting the second input to 133075969
		------------------------------------------------------------------------------------------------------- 300ns
		DataSel <=  '0';												-- Selecting the first input
		wait for 100ns;												-- Expecting DataOut equal to 178607446 after 10ns
		------------------------------------------------------------------------------------------------------- 500ns   
		DataSel <=  '1';												-- Selecting the second input
		wait for 100ns;												-- Expecting DataOut equal to 133075969 after 10ns
		------------------------------------------------------------------------------------------------------- 500ns   
      wait;
   end process;

END;
