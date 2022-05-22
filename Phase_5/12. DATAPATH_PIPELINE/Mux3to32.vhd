library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Mux3to32_pkg is
	type MuxMatrix3to32 is array (2 downto 0) of std_logic_vector(31 downto 0);
end Mux3to32_pkg;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Mux3to32_pkg.all;


entity Mux3to32 is
	Port ( DataIn  : in  MuxMatrix3to32;
		   DataSel : in  std_logic_vector ( 1 downto 0);
		   DataOut : out std_logic_vector (31 downto 0)
	);
end Mux3to32;

architecture Behavioral of Mux3to32 is

	-- Needed signal
	signal IN_out : std_logic_vector (31 downto 0);
	
begin
	with DataSel select 
		IN_out <= DataIn(0)   when "00",   -- Case for DataSel 0.
				  DataIn(1)   when "01",   -- Case for DataSel 1.			
				  DataIn(2)   when "10",   -- Case for DataSel 2.			
				  x"00000000" when others; -- Every other case we set it to 0		
	DataOut <= IN_out after 10ns; 		   -- Setting the DataOut value accordingly with delay added.
end Behavioral;


