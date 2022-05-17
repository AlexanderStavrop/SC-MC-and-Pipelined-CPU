library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Creating the entity of Decoder5to32
entity Decoder5to32 is
	port ( DataIn : in  std_logic_vector (4 downto 0);
		   DataOut: out std_logic_vector (31 downto 0)
	);
end Decoder5to32;

architecture Behavioral of Decoder5to32 is

	-- Needed signal
	signal IN_out : std_logic_vector (31 downto 0); 							

--------------------------------------------------------------- Main Functions ---------------------------------------------------------------                                                                                        
begin
	with DataIn select 
	     IN_out <= 	"00000000000000000000000000000001" when "00000",	-- Case for DataIn code 0.
					"00000000000000000000000000000010" when "00001", 	-- Case for DataIn code 1.
					"00000000000000000000000000000100" when "00010", 	-- Case for DataIn code 2.
					"00000000000000000000000000001000" when "00011", 	-- Case for DataIn code 3.
					"00000000000000000000000000010000" when "00100", 	-- Case for DataIn code 4.
					"00000000000000000000000000100000" when "00101", 	-- Case for DataIn code 5.
					"00000000000000000000000001000000" when "00110", 	-- Case for DataIn code 6.
					"00000000000000000000000010000000" when "00111", 	-- Case for DataIn code 7.
					"00000000000000000000000100000000" when "01000", 	-- Case for DataIn code 8.
					"00000000000000000000001000000000" when "01001", 	-- Case for DataIn code 9.
					"00000000000000000000010000000000" when "01010", 	-- Case for DataIn code 10.
					"00000000000000000000100000000000" when "01011", 	-- Case for DataIn code 11.
					"00000000000000000001000000000000" when "01100", 	-- Case for DataIn code 12.
					"00000000000000000010000000000000" when "01101", 	-- Case for DataIn code 13.
					"00000000000000000100000000000000" when "01110", 	-- Case for DataIn code 14.
					"00000000000000001000000000000000" when "01111", 	-- Case for DataIn code 15.
					"00000000000000010000000000000000" when "10000", 	-- Case for DataIn code 16.
					"00000000000000100000000000000000" when "10001", 	-- Case for DataIn code 17.
					"00000000000001000000000000000000" when "10010", 	-- Case for DataIn code 18.
					"00000000000010000000000000000000" when "10011", 	-- Case for DataIn code 19.
					"00000000000100000000000000000000" when "10100", 	-- Case for DataIn code 20.
					"00000000001000000000000000000000" when "10101", 	-- Case for DataIn code 21.
					"00000000010000000000000000000000" when "10110", 	-- Case for DataIn code 22.
					"00000000100000000000000000000000" when "10111", 	-- Case for DataIn code 23.
					"00000001000000000000000000000000" when "11000", 	-- Case for DataIn code 24.
					"00000010000000000000000000000000" when "11001", 	-- Case for DataIn code 25.
					"00000100000000000000000000000000" when "11010", 	-- Case for DataIn code 26.
					"00001000000000000000000000000000" when "11011", 	-- Case for DataIn code 27.
					"00010000000000000000000000000000" when "11100", 	-- Case for DataIn code 28.
					"00100000000000000000000000000000" when "11101", 	-- Case for DataIn code 29.
					"01000000000000000000000000000000" when "11110", 	-- Case for DataIn code 30.
					"10000000000000000000000000000000" when "11111", 	-- Case for DataIn code 31.
					"00000000000000000000000000000000" when others;  	-- Case for every other DataIn.

	DataOut <= IN_out after 10ns;										-- Setting the DataOut variable accordingly.
end Behavioral;

