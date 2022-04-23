library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Mux32_pkg is
	type MuxMatrix32 is array (1 downto 0) of std_logic_vector(31 downto 0);
end Mux32_pkg;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Mux32_pkg.all;

entity Mux32 is
	Port ( 	DataIn 	: in MuxMatrix32;
				DataSel  : in std_logic;
				DataOut : out std_logic_vector(31 downto 0)
	);
end Mux32;

architecture Behavioral of Mux32 is

	-- Needed signal
	signal IN_out : std_logic_vector (31 downto 0) := (others => '0');
	
begin
	with DataSel select 
		IN_out <= 	DataIn(0) 			when '0', 	 		-- Case for DataSel 0.
							DataIn(1) 			when '1',  	 		-- Case for DataSel 1.			
							x"00000000" 	when others;		-- Every other case we set it to zeros	
	DataOut <= IN_out after 10ns; 						  	-- Setting the DataOut value accordingly with delay added.
	
end Behavioral;
