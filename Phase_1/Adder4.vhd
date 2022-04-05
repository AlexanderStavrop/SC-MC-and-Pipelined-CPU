library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Creating the entity of Adder4
entity Adder4 is
	Port ( DataIn 	: in  std_logic_vector(31 downto 0);
          DataOut : out std_logic_vector(31 downto 0)
	);
end Adder4;

architecture Behavioral of Adder4 is

-- Main function
begin
	DataOut <= DataIn + 4 after 10ns;		-- Adding 4 to the input value
end Behavioral;

