library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Immed16to32 is
    Port ( 	instr_in   : in  std_logic_vector (15 downto 0);
				instr_sel  : in  std_logic_vector (1 downto 0);
				instr_out : out std_logic_vector (31 downto 0)
	 );
end Immed16to32;

architecture Behavioral of Immed16to32 is
	
	-- Needed signal
	signal IN_out : std_logic_vector (31 downto 0)  := (others => '0');

begin
	with instr_sel select 
		IN_out <= 	x"0000"  & instr_in 									      	 				when "00",   	-- Case for zerofill on the upper 16 bits.
							std_logic_vector(resize(signed(instr_in),32))   			when "01",   	-- Case for sign extend.
							instr_in & x"0000" 									       					when "10",   	-- Case for zerofill on the lower 16 bits.
							std_logic_vector(resize(signed(instr_in),30)) & "00" 	when "11",   	-- Case for sign extend and 2 left shifts.
							x"00000000"														 				when others; -- Case for every other Instr_sel.
	instr_out <= IN_out after 10ns;
end Behavioral;
   