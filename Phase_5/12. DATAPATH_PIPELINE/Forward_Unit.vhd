library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Mux3to32_pkg.all;

entity Forward_Unit is
	Port ( -- DEC_Reg ---------------------------------------------------------------
		   DEC_Reg_RS, DEC_Reg_RDRT	  		 			 : in  std_logic_vector ( 4 downto 0);
		   -- EX_Reg ----------------------------------------------------------------
		   EX_Reg_RegWrite					 			 : in  std_logic;
		   EX_Reg_RD 						 			 : in  std_logic_vector ( 4 downto 0);
		   -- MEM_Reg ---------------------------------------------------------------
		   MEM_Reg_RegWrite					 		     : in  std_logic;
		   MEM_Reg_RD 						 			 : in  std_logic_vector ( 4 downto 0);
		   -- Muxes -----------------------------------------------------------------
		   DEC_Reg_RF_A, DEC_Reg_RF_B, DEC_Reg_Write_Mux : in  std_logic_vector (31 downto 0);
		   EX_Reg_ALU_out						 		 : in  std_logic_vector (31 downto 0);
		   FU_UpMux_OUT, FU_DownMux_OUT		 			 : out std_logic_vector (31 downto 0)
	);
end Forward_Unit;

architecture Behavioral of Forward_Unit is

	component Mux3to32 is
		Port ( DataIn  		  : in  MuxMatrix3to32;
			   DataSel 		  : in  std_logic_vector ( 1 downto 0);
			   DataOut 		  : out std_logic_vector (31 downto 0)
		);
	end component;

	-- Needed Signals
	signal Up_Mux             : MuxMatrix3to32 := (others => (others => '0'));
	signal Down_Mux 		  : MuxMatrix3to32 := (others => (others => '0'));
	signal ForwardA, ForwardB : std_logic_vector (1 downto 0) := (others => '0');
	
begin
	Up_Mux(0) <= DEC_Reg_RF_A;
	Up_Mux(1) <= DEC_Reg_Write_Mux;
	Up_Mux(2) <= EX_Reg_ALU_out;
	
	Mux_A:Mux3to32
		port map ( DataIn  => Up_Mux,
				   DataSel => ForwardA,                   
				   DataOut => FU_UpMux_OUT 
		);
	
	Down_Mux(0) <= DEC_Reg_RF_B;
	Down_Mux(1) <= DEC_Reg_Write_Mux;
	Down_Mux(2) <= EX_Reg_ALU_out;
	
	Mux_B:Mux3to32
		port map ( DataIn  => Down_Mux,
				   DataSel => ForwardB,                   
				   DataOut => FU_DownMux_OUT
		);	
	
	process (DEC_Reg_RS, DEC_Reg_RDRT, EX_Reg_RegWrite, EX_Reg_RD, MEM_Reg_RegWrite, MEM_Reg_RD)
		begin
			if ((EX_Reg_RegWrite = '1') and (EX_Reg_RD /= "00000") and (EX_Reg_RD = DEC_Reg_RS)) then
				ForwardA <= "10";
			elsif ((MEM_Reg_RegWrite = '1') and (MEM_Reg_RD /= "00000") and (MEM_Reg_RD = DEC_Reg_RS)) then
				ForwardA <= "01";	
			else
				ForwardA <= "00";
			end if;
				
		
			if ((EX_Reg_RegWrite = '1') and (EX_Reg_RD /= "00000") and (EX_Reg_RD = DEC_Reg_RDRT)) then
				ForwardB <= "10";
			elsif ((MEM_Reg_RegWrite = '1') and (MEM_Reg_RD /= "00000") and (MEM_Reg_RD = DEC_Reg_RDRT)) then
				ForwardB <= "01";	
			else
				ForwardB <= "00";
			end if;
	end process;
	
	
end Behavioral;

