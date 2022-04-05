library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
-- use ieee.std_logic_signed.all;

-- Creating the entity of Adder32
entity Adder32 is
	Port ( Inp_A, Inp_B : in  std_logic_vector(31 downto 0);
		    DataOut      : out std_logic_vector(31 downto 0)
	);
end Adder32;

architecture Behavioral of Adder32 is
	
-- Main function
begin
	 DataOut <= signed(Inp_A) + signed(Inp_B) after 10ns;
end Behavioral;

 