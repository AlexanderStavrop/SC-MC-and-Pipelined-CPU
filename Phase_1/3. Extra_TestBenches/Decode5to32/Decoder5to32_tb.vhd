LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Decoder5to32_tb IS
END Decoder5to32_tb;
 
ARCHITECTURE behavior OF Decoder5to32_tb IS  

	-- Creating the component of Decoder5to32
    COMPONENT Decoder5to32
		 PORT( DataIn  : in  std_logic_vector(4 downto 0);
			   DataOut : out std_logic_vector(31 downto 0)
		 );
    END COMPONENT;
    
  	-- Input Signal
   	signal DataIn  : std_logic_vector(4 downto 0) := (others => '0');

  	-- Output Signal
	signal DataOut : std_logic_vector(31 downto 0);
 
BEGIN
	-- Declaring the Decoder5to32 port map
	uut: Decoder5to32 
		PORT MAP( DataIn  => DataIn,
				  DataOut => DataOut
		); 

	-- Stimulus process
	stim_proc: process
	begin
------------------------------------------------------------------------------------------------
	-- Testing some values of the decoder
		------------------------------------------------------------------------------------------ 0ns	
		DataIn <= "00000";	-- Setting the DataIn equal to 0
		wait for 100 ns;	-- Expect 1 at index 0 (uint = 1)
		------------------------------------------------------------------------------------------ 100ns	
		DataIn <= "00001";	-- Setting the DataIn equal to 1
		wait for 100 ns;	-- Expect 1 at index 1 (uint = 2)
		------------------------------------------------------------------------------------------ 200ns
		DataIn <= "00010";	-- Setting the DataIn equal to 2
		wait for 100 ns;	-- Expect 1 at index 2 (uint = 4)
		------------------------------------------------------------------------------------------ 300ns
		DataIn <= "00011";	-- Setting the DataIn equal to 3
		wait for 100 ns;	-- Expect 1 at index 3 (uint = 8)
		------------------------------------------------------------------------------------------ 400ns
		DataIn <= "00100";	-- Setting the DataIn equal to 4
		wait for 100 ns;	-- Expect 1 at index 4 (uint = 16)
		------------------------------------------------------------------------------------------ 500ns
		DataIn <= "00101";	-- Setting the DataIn equal to 5
		wait for 100 ns;	-- Expect 1 at index 5 (uint = 32)
		------------------------------------------------------------------------------------------ 600ns
		DataIn <= "01011";	-- Setting the DataIn equal to 11
		wait for 100 ns;	-- Expect 1 at index 11 (uint = 2048)
		------------------------------------------------------------------------------------------ 700ns
		DataIn <= "11111";	-- Setting the DataIn equal to 31
		wait for 100 ns;	-- Expect 1 at index 32 (uint = 2147483648)
		------------------------------------------------------------------------------------------ 800ns
		wait;
	end process;
END;
