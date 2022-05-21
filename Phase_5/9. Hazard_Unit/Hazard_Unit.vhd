library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Hazard_Unit is
	Port( -- DEC ---------------------------------------------
		  DEC_RS, DEC_RT                  : in  std_logic_vector(4 downto 0);
	      -- DEC_Reg -----------------------------------------
		  DEC_Reg_MemtoReg                : in  std_logic;
          DEC_Reg_RDRT           		  : in  std_logic_vector(4 downto 0);
          ----------------------------------------------------
		  PC_LdEn, IF_Reg_WrEn, HUnit_OUT : out std_logic
	);
end Hazard_Unit;

architecture Behavioral of Hazard_Unit is

begin

	process(DEC_Reg_MemtoReg,DEC_RS,DEC_RT,DEC_Reg_RDRT)
		begin		
			if ((DEC_Reg_MemtoReg = '1') AND ((DEC_Reg_RDRT = DEC_RS) OR (DEC_Reg_RDRT = DEC_RT))) then
				IF_Reg_WrEn <= '0';
				HUnit_OUT   <= '1';
				PC_LdEn     <= '0';
			else 
				IF_Reg_WrEn <= '1';
				HUnit_OUT   <= '0';
				PC_LdEn     <= '1';
			end if;
	end process;
	
end Behavioral;