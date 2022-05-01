library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register32 is
    Port ( CLK, RST, WE : in  STD_LOGIC;
		   DataIn 		: in  STD_LOGIC_VECTOR (31 downto 0);
		   DataOut 		: out STD_LOGIC_VECTOR (31 downto 0)
	 );
end Register32;

architecture Behavioral of Register32 is

	-- Needed signals
	signal IN_out : std_logic_vector (31 downto 0) := (others => '0');

-- Main Functions                                                                                        
begin
	process (CLK, RST, WE, DataIn, IN_out)
		begin
			if (rising_edge(Clk)) then				-- Checking if we are at rising edge of clock.
				if (RST = '1') then					-- Checking if the reset button is pressed.
					IN_out <= (others => '0');		-- Updating the output to zeros immediately.
				elsif (WE = '1') then 				-- Checking if we also have write enable pressed.
					IN_out <= DataIn;				-- Updating the Output from the corresponding variable after 10ns.
				end if;
			end if;
		DataOut <= IN_out after 10ns;				-- Setting the DataOut with the corresponding value and adding 12ns of delay.
	end process;
	
end Behavioral;
