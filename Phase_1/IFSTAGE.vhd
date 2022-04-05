library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Mux32_pkg.all;

-- Creating the entity of IFSTAGE
entity IFSTAGE is
	port ( PC_sel, PC_LdEn, Reset, Clk : in  std_logic;
			 PC_Immed 						  : in  std_logic_vector(31 downto 0);
			 PC 				              : out std_logic_vector(31 downto 0)
	);
end IFSTAGE;

architecture Behavioral of IFSTAGE is
	
	-- Creating the component of Adder32
	component Adder32 is
		Port ( Inp_A, Inp_B : in  std_logic_vector(31 downto 0);
				 DataOut      : out std_logic_vector(31 downto 0)
		);
	end component;
	
	-- Creating the component of Adder4
	component Adder4 is
		Port ( DataIn  : in  std_logic_vector(31 downto 0);
				 DataOut : out std_logic_vector(31 downto 0)
		);
	end component;
	
	-- Creating the component of Mux2To1
	component Mux32 is
		Port ( DataIn 	 : in MuxMatrix32;
				 DataSel  : in std_logic;
             DataOut  : out std_logic_vector(31 downto 0)
		);
	end component;
	
	-- Creating the component of Register32
	component Register32 is
		Port ( CLK, RST, WE : in  std_logic;
				 DataIn 		  : in  std_logic_vector (31 downto 0);
				 DataOut 	  : out std_logic_vector (31 downto 0)
	 );
	end component;
	
	-- Needed signals
	signal Adder32Out : std_logic_vector(31 downto 0);
	signal Adder4Out  : std_logic_vector(31 downto 0);
	signal AdderOut   : MuxMatrix32 := (others => (others => '0'));
	signal MuxOut     : std_logic_vector(31 downto 0);
	signal PcOut	   : std_logic_vector(31 downto 0);


-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        	
begin
----------------------------------------------------- Adder32 ------------------------------------------------------
	ADDR32:Adder32
		port map ( Inp_A => Adder4Out,
					  Inp_B => PC_Immed,
					  DataOut => Adder32Out
		);
		
------------------------------------------------------ Adder4 ------------------------------------------------------
	ADDR4:Adder4
		port map ( DataIn => PcOut,
					  DataOut => Adder4Out
		);	
		
	AdderOut(0) <= Adder4Out;
	AdderOut(1) <= Adder32Out;
	
------------------------------------------------------ Mux32 -------------------------------------------------------
	MUX:Mux32
		port map ( DataIn => AdderOut,
					  DataSel => PC_sel,
					  DataOut => MuxOut
		);	
		
---------------------------------------------------- Register32 ----------------------------------------------------
	REGISTER_PC:Register32
		port map ( CLK => Clk,
					  RST => Reset,
					  WE => PC_LdEn,
					  DataIn => MuxOut,
					  DataOut => PcOut
		);	
		
	PC <= PcOut;
	
end Behavioral;

