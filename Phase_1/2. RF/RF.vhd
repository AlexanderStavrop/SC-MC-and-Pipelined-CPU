library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.GenericMux32_pkg.all;

entity RF is
	Port ( Ard1, Ard2, Awr : in std_logic_vector (4 downto 0);
		   WrEn, Clk, Rst  : in std_logic;
		   Din 			   : in std_logic_vector (31 downto 0);
		   Dout1, Dout2    : out std_logic_vector (31 downto 0)
	);
	end RF;
	
architecture Behavioral of RF is

---------------------------------------------------------- COMPONENTS -------------------------------------------------------------
	component Decoder5to32 is
		port( DataIn  		: in std_logic_vector (4 downto 0);
			  DataOut 		: out std_logic_vector (31 downto 0)
       );
	end component;

	component Register32 is
		port( CLK, RST, WE 	: in  std_logic;
			  DataIn       	: in  std_logic_vector (31 downto 0);
			  DataOut     	: out  std_logic_vector (31 downto 0)
		);
	end component;
	
	component GenericMux32 is
		port( DataIn  		: in MuxMatrix32(31 downto 0);
			  DataSel 		: in  std_logic_vector(4 downto 0);
			  DataOut 		: out std_logic_vector(31 downto 0)
      );
	end component;
		
	-- Needed signals
	signal andOut : std_logic_vector(31 downto 0);
	signal decOut : std_logic_vector(31 downto 0);
	signal regOut : MuxMatrix32(31 downto 0);
	signal R0Data : std_logic_vector(31 downto 0) := (others => '0');
	
begin
	---------------------------------------------------------- Decoder5to32 ----------------------------------------------------------
	Dec:Decoder5to32
		port map ( DataIn  => Awr,
				   DataOut => decOut
      	);
		
	------------------------------------------------------------ Register32 --------------------------------------------------------------
	Gen_Reg : for i in 0 to 31 generate 				-- Creating 32 Registers
		andOut(i) <= (decOut(i) and WrEn) after 2ns; 	-- Creating the and output

		R0: if i=0 generate								-- Creating the register R0
			Reg0: Register32 
				port map( CLK      => Clk,
						  RST      => Rst,
						  WE  	   => '1',
						  DataIn   => R0Data,
						  DataOut  => regOut(i)			
				);
		end generate R0;
		
		Rx: if i>0 generate								-- Creating the other 31 registers
			RegX: Register32 
				port map ( CLK     => Clk,
						   RST     => Rst,
						   WE  	   => andOut(i),
						   DataIn  => Din,
						   DataOut => regOut(i)				
				);
		end generate Rx;
	end generate Gen_Reg;
	
	------------------------------------------------------------- GenericMux ------------------------------------------------------------
	Mux1: GenericMux32 									-- Generating the upper Mux
		port map ( DataIn  => regOut,
			       DataSel => Ard1,
				   DataOut => Dout1
		);
	
	Mux2: GenericMux32 									-- Generating the lower Mux
		port map ( DataIn  => regOut,
				   DataSel => Ard2,
				   DataOut => Dout2
		);			
end Behavioral;

