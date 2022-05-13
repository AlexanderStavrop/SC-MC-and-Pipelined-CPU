library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ThreeBitRegister is
    Port ( Clk, Rst, WE, Din_1, Din_2, Din_3 : in  std_logic;
           Dout_1, Dout_2, Dout_3 			 : out std_logic
	);
end ThreeBitRegister;

architecture Behavioral of ThreeBitRegister is
	
	component Register1 is
		port( Clk, Rst, WE : in  std_logic;
			  DataIn       : in  std_logic;
			  DataOut      : out std_logic
		);
	end component;
	
	-- Needed signals
	signal IN_out_1, IN_out_2, IN_out_3 : std_logic := '0';

-- Main Functions                                                                                        
begin
	
	First_Bit:Register1 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		-- Common Write Enable
				   DataIn  => Din_1,	-- Value of the PC+4 from IF_reg
				   DataOut => Dout_1	-- Output of Register
		);
	
	Second_Bit:Register1 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		-- Common Write Enable
				   DataIn  => Din_2,	-- Value of the PC+4 from IF_reg
				   DataOut => Dout_2	-- Output of Register
		);
		
	Third_Bit:Register1 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		-- Common Write Enable
				   DataIn  => Din_3,	-- Value of the PC+4 from IF_reg
				   DataOut => Dout_3	-- Output of Register
		);
	
end Behavioral;

