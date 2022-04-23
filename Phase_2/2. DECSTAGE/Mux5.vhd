library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Mux5_pkg is
	type MuxMatrix5 is array (1 downto 0) of std_logic_vector(4 downto 0);
end Mux5_pkg;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Mux5_pkg.all;

entity Mux5 is
	Port ( 	DataIn 	: in MuxMatrix5;
				DataSel  : in std_logic;
				DataOut : out std_logic_vector(4 downto 0)
	);
end Mux5;

architecture Behavioral of Mux5 is

	-- Needed signal
	signal IN_out : std_logic_vector (4 downto 0);
	
begin
	with DataSel select 
		IN_out <= 	DataIn(0) 	when '0', 	 		-- Case for DataSel 0.
							DataIn(1) 	when '1',  	 		-- Case for DataSel 1.			
							"00000" 		when others;		
	DataOut <= IN_out after 10ns; 					-- Setting the DataOut value accordingly with delay added.
end Behavioral;
