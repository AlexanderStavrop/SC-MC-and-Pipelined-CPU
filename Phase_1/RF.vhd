library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.GenericMux32_pkg.all;

-- Creating the entity of RegisterFile
entity RF is
	Port ( Ard1, Ard2, Awr : in std_logic_vector (4 downto 0);
			 WrEn, Clk, Rst  : in std_logic;
			 Din 				  : in std_logic_vector (31 downto 0);
			 Dout1, Dout2	  : out std_logic_vector (31 downto 0)
	);
	end RF;
	
architecture Behavioral of RF is
	-- Creating the component of Decoder5to32
	component Decoder5to32 is
		port( DataIn : in std_logic_vector (4 downto 0);
				DataOut: out std_logic_vector (31 downto 0)
        );
	end component;

	-- Creating the component of Register32
	component Register32 is
		port( CLK, RST, WE : in  STD_LOGIC;
            DataIn       : in  STD_LOGIC_VECTOR (31 downto 0);
            DataOut      : out  STD_LOGIC_VECTOR (31 downto 0)
        );
	end component;
	
	-- Creating the component of GenericMux
	component GenericMux32 is
		port( DataIn  : IN MuxMatrix32(31 downto 0);
				DataSel : IN std_logic_vector(4 downto 0);
				DataOut : OUT std_logic_vector(31 downto 0)
      );
	end component;
	
	
	-- Needed signals
	signal andOut : std_logic_vector(31 downto 0);
	signal decOut : std_logic_vector(31 downto 0);
	signal regOut : MuxMatrix32(31 downto 0);
	signal R0Data : std_logic_vector(31 downto 0) := (others => '0');
	

-- Port mapping
begin
	-- Creating one decoder 5 to 32
	Dec:Decoder5to32
		port map ( DataIn  => Awr,
					  DataOut => decOut
      );
		
	-- Generating 32 Registers
	Gen_Reg : for i in 0 to 31 generate 
		-- Creating the and output
		andOut(i) <= (decOut(i) and WrEn) after 2ns; 

		-- Creating the register R0
		R0: if i=0 generate
			Reg0: Register32 
				port map( CLK     => Clk,
							 RST     => Rst,
							 WE  	   => '1',
							 DataIn  => R0Data,
							 DataOut => regOut(i)			
				);
		end generate R0;
		
		-- Creating the other 31 registers
		Rx: if i>0 generate	
			RegX: Register32 
				port map ( CLK     => Clk,
							  RST     => Rst,
							  WE  	 => andOut(i),
					        DataIn  => Din,
							  DataOut => regOut(i)				
				);
		end generate Rx;
	end generate Gen_Reg;
	--regOut(0) <= R0Data;
	
	-- Generating 2 generic multiplexers
	Gen_Mux: for i in 0 to 1 generate
		UpperMux: if i=0 generate
			Mux1: GenericMux32 
				port map ( DataIn  => regOut,
							  DataSel => Ard1,
							  DataOut => Dout1
				);
		end generate UpperMux;
		LowerMux: if i>0 generate
			Mux2: GenericMux32 
				port map ( DataIn  => regOut,
							  DataSel => Ard2,
							  DataOut => Dout2
				);
		end generate LowerMux;
	end generate Gen_Mux;
end Behavioral;

