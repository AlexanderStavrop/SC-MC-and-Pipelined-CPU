LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Hazard_Unit_tb IS
END Hazard_Unit_tb;
 
architecture behavior of Hazard_Unit_tb is
 
    component Hazard_Unit
		Port( -- DEC ---------------------------------------------
			  DEC_RS, DEC_RT                  : in  std_logic_vector(4 downto 0);
	          -- DEC_Reg -----------------------------------------
		      DEC_Reg_MemtoReg                : in  std_logic;
              DEC_Reg_RDRT           		  : in  std_logic_vector(4 downto 0);
              ----------------------------------------------------
		      PC_LdEn, IF_Reg_WrEn, HUnit_OUT : out std_logic
		);
    end component;
    

	--Inputs
	signal DEC_RS           : std_logic_vector(4 downto 0) := (others => '0');
	signal DEC_RT           : std_logic_vector(4 downto 0) := (others => '0');
	signal DEC_Reg_MemtoReg : std_logic := '0';
	signal DEC_Reg_RDRT     : std_logic_vector(4 downto 0) := (others => '0');

	--Outputs
	signal PC_LdEn 			: std_logic;
	signal IF_Reg_WrEn      : std_logic;
	signal HUnit_OUT 		: std_logic;
 
begin
 
	uut: Hazard_Unit 
		Port map ( DEC_RS 			=> DEC_RS,
				   DEC_RT 			=> DEC_RT,
				   DEC_Reg_MemtoReg => DEC_Reg_MemtoReg,
				   DEC_Reg_RDRT 	=> DEC_Reg_RDRT,
				   PC_LdEn 			=> PC_LdEn,
				   IF_Reg_WrEn 		=> IF_Reg_WrEn,
				   HUnit_OUT 		=> HUnit_OUT
        );

	stim_proc: process
	begin	
---------------------------------------------------------------------------------- 0ns
	-- Testing if hazard unit works as intended
		-------------------------------------------------------------------------- 0ns
		DEC_Reg_MemtoReg <= '0';	 -- Setting MemtoReg equal to 0
		DEC_RS 			 <= "00000"; -- Setting RS equal to 0
		DEC_RT 			 <= "00000"; -- Setting RT equal to 0
		DEC_Reg_RDRT 	 <= "00000"; -- Setting RDRT equal to 0
		wait for 100ns;	 			 -- Expecting PC_LdEn, IF_Reg_WrEn equal to 0
								     --  and HUnit_OUT equal to 1
		-------------------------------------------------------------------------- 100ns
		DEC_Reg_MemtoReg <= '1';	 -- Setting MemtoReg equal to 1
		DEC_RS 			 <= "00001"; -- Setting RS equal to 1
		DEC_RT 			 <= "00010"; -- Setting RT equal to 2
		DEC_Reg_RDRT 	 <= "00011"; -- Setting RDRT equal to 3
		wait for 100ns;	 			 -- Expecting PC_LdEn, IF_Reg_WrEn equal to 0
								     --  and HUnit_OUT equal to 1
		-------------------------------------------------------------------------- 200ns
		DEC_Reg_MemtoReg <= '1';	 -- Setting MemtoReg equal to 1
		DEC_RS 			 <= "00011"; -- Setting RS equal to 3
		DEC_RT 			 <= "00010"; -- Setting RT equal to 2
		DEC_Reg_RDRT 	 <= "00011"; -- Setting RDRT equal to 3
		wait for 100ns;	 			 -- Expecting PC_LdEn, IF_Reg_WrEn equal to 0
								     --  and HUnit_OUT equal to 1
		-------------------------------------------------------------------------- 300ns
		DEC_Reg_MemtoReg <= '1';	 -- Setting MemtoReg equal to 1
		DEC_RS 			 <= "00010"; -- Setting RS equal to 2
		DEC_RT 			 <= "00011"; -- Setting RT equal to 3
		DEC_Reg_RDRT 	 <= "00011"; -- Setting RDRT equal to 3
		wait for 100ns;	 			 -- Expecting PC_LdEn, IF_Reg_WrEn equal to 0
								     --  and HUnit_OUT equal to 1
		-------------------------------------------------------------------------- 400ns
		DEC_Reg_MemtoReg <= '0';	 -- Setting MemtoReg equal to 0
		DEC_RS 			 <= "00000"; -- Setting RS equal to 0
		DEC_RT 			 <= "00000"; -- Setting RT equal to 0
		DEC_Reg_RDRT 	 <= "00000"; -- Setting RDRT equal to 0
		wait for 100ns;	 			 -- Expecting PC_LdEn, IF_Reg_WrEn equal to 0
									--  and HUnit_OUT equal to 1
		-------------------------------------------------------------------------- 500ns

		wait;
	end process;

end;