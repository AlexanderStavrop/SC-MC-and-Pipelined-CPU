library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register1 is
    Port ( CLK, RST, WE : in  std_logic;
		   DataIn 		: in  std_logic;
		   DataOut 		: out std_logic
	 );
end Register1;

architecture Behavioral of Register1 is

	-- Needed signals
	signal IN_out : std_logic := '0';

-- Main Functions                                                                                        
begin
	process (CLK, RST, WE, DataIn, IN_out)
		begin
			if (rising_edge(Clk)) then	-- Checking if we are at rising edge of clock.
				if (RST = '1') then		-- Checking if the reset button is pressed.
					IN_out <= '0';		-- Updating the output to zeros immediately.
				elsif (WE = '1') then 	-- Checking if we also have write enable pressed.
					IN_out <= DataIn;	-- Updating the Output from the corresponding variable after 10ns.
				end if;
			end if;
		DataOut <= IN_out after 10ns;	-- Setting the DataOut with the corresponding value and adding 12ns of delay.
	end process;
	
end Behavioral;
