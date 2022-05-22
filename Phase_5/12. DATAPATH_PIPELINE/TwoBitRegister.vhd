library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoBitRegister is
    Port ( Clk, Rst, WE, Din_1, Din_2 : in  std_logic;
           Dout_1, Dout_2 			  : out std_logic
	);
end TwoBitRegister;

architecture Behavioral of TwoBitRegister is
	component Register1 is
		port( Clk, Rst, WE : in  std_logic;
			  DataIn       : in  std_logic;
			  DataOut      : out std_logic
		);
	end component;

	-- Needed signals
	signal IN_out_1, IN_out_2 : std_logic := '0';

-- Main Functions                                                                                        
begin
	First_Bit:Register1 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => Din_1,	
				   DataOut => Dout_1	
		);
	
	Second_Bit:Register1 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => Din_2,	
				   DataOut => Dout_2	
		);
	
end Behavioral;

