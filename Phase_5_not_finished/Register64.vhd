library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register64 is
    Port ( Clk, Rst, WE  	 		   : in  STD_LOGIC;
		   IF_Adder_IN, MEM_Instr_IN   : in  STD_LOGIC_VECTOR (31 downto 0);
		   IF_Adder_OUT, MEM_Instr_OUT : out STD_LOGIC_VECTOR (31 downto 0)
	 );
end Register64;

architecture Behavioral of Register64 is
	
	component Register32 is
		Port ( CLK, RST, WE : in  std_logic;
			   DataIn 		: in  std_logic_vector (31 downto 0);
			   DataOut 	  	: out std_logic_vector (31 downto 0)
	 );
	end component;
	
-- Main Functions                                                                                        
begin
	
	PC_4_Reg:Register32 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		     -- Common Write Enable
				   DataIn  => IF_Adder_IN,	 -- Result of the PC+4
				   DataOut => IF_Adder_OUT	 -- Output of Register
		);
	
	Mem_Instr_Reg:Register32 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		     -- Common Write Enable
				   DataIn  => MEM_Instr_IN,	 -- Result of the PC+4
				   DataOut => MEM_Instr_OUT	 -- Output of Register
		);
	
end Behavioral;
