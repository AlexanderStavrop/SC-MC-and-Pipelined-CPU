library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Mux32_pkg.all;

entity IFSTAGE_PIPELINE is
	port ( 	PC_sel, PC_LdEn, Reset, Clk : in  std_logic;
			PC_Immed  					: in  std_logic_vector(31 downto 0);
			PC, PC_4 		            : out std_logic_vector(31 downto 0)
	);
end IFSTAGE_PIPELINE;

architecture Behavioral of IFSTAGE_PIPELINE is
	
-------------------------------------------------- COMPONENTS -------------------------------------------------------
	component Mux32 is
		Port ( DataIn 	 	: in MuxMatrix32;
			   DataSel   	: in std_logic;
			   DataOut 		: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component Adder4 is
		Port ( 	DataIn  	: in  std_logic_vector(31 downto 0);
				DataOut 	: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component Register32 is
		Port ( CLK, RST, WE : in  std_logic;
			   DataIn 		: in  std_logic_vector (31 downto 0);
			   DataOut 	  	: out std_logic_vector (31 downto 0)
	 );
	end component;
	
	-- Needed signals
	signal Adder4Out  : std_logic_vector(31 downto 0) := (others => '0');
	signal MuxIn   	  : MuxMatrix32 := (others => (others => '0'));
	signal MuxOut     : std_logic_vector(31 downto 0) := (others => '0');
	signal PcOut	  : std_logic_vector(31 downto 0) := (others => '0');


-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        	
begin
------------------------------------------------------ Mux32 -------------------------------------------------------
	MuxIn(0) <= Adder4Out;
	MuxIn(1) <= PC_Immed;
	
	MUX:Mux32
		port map ( DataIn  => MuxIn,
				   DataSel => PC_sel,
				   DataOut => MuxOut
		);
------------------------------------------------------ Adder4 ------------------------------------------------------
	ADDR4:Adder4
		port map ( DataIn  => PcOut,
				   DataOut => Adder4Out
		);	
	 PC_4 <= Adder4Out;
---------------------------------------------------- Register32 ----------------------------------------------------
	REGISTER_PC:Register32
		port map ( CLK     => Clk,
				   RST	   => Reset,
				   WE 	   => PC_LdEn,
				   DataIn  => MuxOut,
				   DataOut => PcOut
		);	
		
	PC <= PcOut;
	
end Behavioral;