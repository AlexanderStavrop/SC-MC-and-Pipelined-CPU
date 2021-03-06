library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Creating the entity of ALU
entity ALU is
	Port ( A, B			   : in std_logic_vector  (31 downto 0);
		   Op 			   : in std_logic_vector  (3 downto 0);
		   Dout 	       : out std_logic_vector (31 downto 0);
		   Zero, Cout, Ovf : out std_logic
	 );
end ALU;

architecture Behavioral of ALU is

	-- Needed signals
	signal IN_out  		   : std_logic_vector (31 downto 0) := (others => '0');
	signal IN_cout         : std_logic_vector (32 downto 0) := (others => '0');
	signal IN_zero, IN_ovf : std_logic := '0';
	
-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        
begin	
	with Op select
		IN_out <= 	signed(A) + signed(B) 	when "0000",									-- (0) Addition Mode
					signed(A) - signed(B) 	when "0001",   									-- (1) Subtraction Mode
					A and B               	when "0010",									-- (2) Logic And Mode
					A or B                	when "0011", 									-- (3) Logic Or Mode
					not A                 	when "0100", 									-- (4) Logic Not Mode
					A nand B              	when "0101",   									-- (5) Logic Nand Mode
					A NOR B                	when "0110",   									-- (6) Logic NOR Mode
					A(31) & A(31 downto 1) 	when "1000", 									-- (8) Arithmetic Right Shift Mode
					'0' & A(31 downto 1)	when "1001", 									-- (9) Logic Right Shift Mode
					A(30 downto 0) & '0'	when "1010",   									-- (10)Logic Left Shift  Mode
					A(30 downto 0) & A(31) 	when "1100",  									-- (12)Left Rotare Mode
					A(0) &  A(31 downto 1) 	when "1101", 									-- (13)Right Rotare Mode
					(others => '0') 		when others;									-- Every other opcode Mode
									 
	-- Creating the Zero flag
	IN_zero <= '1' when IN_out = x"00000000" else '0'; 										-- Calculating the value of zero
	Zero    <= IN_zero after 10ns;															-- Setting the output accordingly
	
	-- Creating the Overflow flag
	IN_ovf  <= 	(A(31) xor IN_out(31)) when (((A(31) xor B(31)) = '0') and Op = "0000") else -- Calculating the value of overflow for addition
				(A(31) xor IN_out(31)) when (((A(31) xor B(31)) = '1') and Op = "0001") else -- Calculating the value of overflow for subtraction
				'0';																		 -- Every other case the value is zero
	ovf    	<= IN_ovf after 10ns;															 -- Setting the output accordingly
	
	-- Creating the Carry out flag
	with Op select 
		IN_cout <= ('0' & A) + ('0' & B) when "0000",										-- Performing the addition with 33 bit long vectors
				   (others => '0')  	 when others;										-- Every other case we set the value to zero
	Cout <= IN_cout(32) after 10ns;															-- Setting the output from the 32nd bit of the vector
	
	-- Updating the Output from the corresponding variable after 10ns
	Dout <= IN_out after 10ns;                                             					-- Setting the output accordingly           
	
end Behavioral;