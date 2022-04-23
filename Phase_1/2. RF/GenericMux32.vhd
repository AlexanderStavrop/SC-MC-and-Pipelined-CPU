library IEEE;
use IEEE.STD_LOGIC_1164.all;

package GenericMux32_pkg is
	type MuxMatrix32 is array (natural range <>) of std_logic_vector(31 downto 0);
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.GenericMux32_pkg.all;

entity GenericMux32 is
    Port (  DataIn : in  MuxMatrix32;
				DataSel: in  STD_LOGIC_VECTOR (4 downto 0);
				DataOut: out STD_LOGIC_VECTOR (31 downto 0)
	 );
end GenericMux32;

architecture Behavioral of GenericMux32 is

	-- Needed signal
	signal IN_out : std_logic_vector (31 downto 0);
	
	
-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        
begin                          
	DataOut <= DataIn(To_Integer(unsigned(DataSel))) after 10ns;  --Getting the vector from index(DataSel)	
end Behavioral;