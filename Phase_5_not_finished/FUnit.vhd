library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FUnit is
	Port ( -- DEC_Reg ----------------------------------------------
		   DEC_RS, DEC_RT	  	: in std_logic;
		   -- EX_Reg -----------------------------------------------
		   EX_RegWrite, EX_RD 	: in std_logic;
		   -- MEM_Reg ----------------------------------------------
		   MEM_RegWrite, MEM_RD : in std_logic;
		   ---------------------------------------------------------
		   ForwardA, ForwardB   : out std_logic_vector (1 downto 0)
	);
end FUnit;

architecture Behavioral of FUnit is

begin
	process (DEC_RS, DEC_RT, EX_RegWrite, EX_RD, MEM_RegWrite, MEM_RD)
		begin
			if ((EX_RegWrite = '1') and (EX_RD /= '0') and (EX_RD = DEC_RS)) then
				ForwardA <= "10";
			elsif ((MEM_RegWrite = '1') and (MEM_RD /= '0') and (MEM_RD = DEC_RS)) then
				ForwardA <= "01";	
			else
				ForwardA <= "00";
			end if;
				
		
			if ((EX_RegWrite = '1') and (EX_RD /= '0') and (EX_RD = DEC_RT)) then
				ForwardB <= "10";
			elsif ((MEM_RegWrite = '1') and (MEM_RD /= '0') and (MEM_RD = DEC_RT)) then
				ForwardB <= "01";	
			else
				ForwardB <= "00";
			end if;
	end process;
end Behavioral;

