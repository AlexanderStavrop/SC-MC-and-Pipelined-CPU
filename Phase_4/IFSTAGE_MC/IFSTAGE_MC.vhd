library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Mux3to1_32_pkg.all;
use work.Mux32_pkg.all;

entity IFSTAGE_MC is
	port ( 	PC_LdEn, IRWrite, iorD, Reset, Clk 		 : in    std_logic;
				PCSource													 : in    std_logic_vector(1 downto 0);
				ALU_out, ALU_out_Reg, PC_in, Instr_in : in    std_logic_vector(31 downto 0);
				Address, PC_out, Instr_out        				 : out std_logic_vector(31 downto 0)
	);
end IFSTAGE_MC;

architecture Behavioral of IFSTAGE_MC is
---------------------------------------------------------- COMPONENTS -------------------------------------------------------------
	component Mux3to1_32 is
		Port ( 	DataIn 	: in MuxMatrix3to1;
					DataSel  : in std_logic_vector (1 downto 0);
					DataOut : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component Register32 is
		Port ( 	CLK, RST, WE  :  in  std_logic;
					DataIn 		  	 :  in  std_logic_vector (31 downto 0);
					DataOut 	  	 :  out std_logic_vector (31 downto 0)
		);
	end component;
	
	component Mux32 is
		Port ( 	DataIn 	: in MuxMatrix32;
					DataSel  : in std_logic;
					DataOut : out std_logic_vector(31 downto 0)
		);
	end component;

	-- Needed signals
	signal IN_PC_out   			: std_logic_vector(31 downto 0) := (others => '0');
	signal IN_PCMuxIn  		: MuxMatrix3to1 := (others => (others => '0'));
	signal IN_PCMuxOut 		: std_logic_vector(31 downto 0) := (others => '0');	
	signal IN_MemMuxIn		: MuxMatrix32 := (others => (others => '0'));
	
begin
	------------------------------------------------------ Mux3to1_32 --------------------------------------------------------
	IN_PCMuxIn(0) <= ALU_out;
	IN_PCMuxIn(1) <= ALU_out_Reg;
	IN_PCMuxIn(2) <= PC_in;
	
	PC_MUX:Mux3to1_32									
		port map (	DataIn 	=> IN_PCMuxIn,
							DataSel 	=> PCSource,
							DataOut => IN_PCMuxOut
		);
	------------------------------------------------------- Register32 ---------------------------------------------------------
	PC:Register32
		port map ( CLK     	=> Clk,
							RST	    	=> Reset,
							WE 		 	=> PC_LdEn,
							DataIn  	=> IN_PCMuxOut,
							DataOut => IN_PC_out
		);	
	PC_out <= IN_PC_out;
	
	--------------------------------------------------------- Mux32 ------------------------------------------------------------
	IN_MemMuxIn(0) <= IN_PC_out;
	IN_MemMuxIn(1) <= ALU_out_Reg;
	
	ADDR_MUX:Mux32
		port map ( DataIn 	=> IN_MemMuxIn,
							DataSel  => iorD,
							DataOut => Address
		);	

	------------------------------------------------------- Register32 ---------------------------------------------------------
	INSTR_REG:Register32
		port map ( CLK     	=> Clk,
							RST	    	=> Reset,
							WE 		 	=> IRWrite,
							DataIn  	=> Instr_in,
							DataOut => Instr_out
		);	
		
end Behavioral;

