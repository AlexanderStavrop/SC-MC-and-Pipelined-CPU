library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEM_REGISTER_PIPELINE is
	Port ( Clk, Rst, WE		  : in  std_logic;
		   -- WB_Reg -----------------------------------------------
		   WB_1_IN, WB_2_IN	  : in  std_logic;
		   WB_1_OUT, WB_2_OUT : out std_logic;
		   -- MEM_out_Reg ------------------------------------------
		   MEM_Data_IN		  : in  std_logic_vector (31 downto 0);
		   MEM_Data_OUT		  : out std_logic_vector (31 downto 0);
		   -- ALU_Res_Reg ------------------------------------------	
		   ALURes_IN 		  : in  std_logic_vector (31 downto 0);
		   ALURes_Out 		  : out std_logic_vector (31 downto 0);
		    -- RD_Reg ------------------------------------------------------
		   RD_IN 			  : in  std_logic_vector ( 4 downto 0);
		   RD_OUT			  : out std_logic_vector ( 4 downto 0)
	);
end MEM_REGISTER_PIPELINE;

architecture Behavioral of MEM_REGISTER_PIPELINE is

	component Register1 is
		port( Clk, Rst, WE 				 : in  std_logic;
			  DataIn       				 : in  std_logic;
			  DataOut      				 : out std_logic
		);
	end component;
	
	component TwoBitRegister is
		Port( Clk, Rst, WE, Din_1, Din_2 : in  std_logic;
			  Dout_1, Dout_2 			 : out std_logic
		);
	end component;
	
	component Register5 is
		port( Clk, Rst, WE 				 : in  std_logic;
			  DataIn       				 : in  std_logic_vector ( 4 downto 0);
			  DataOut     				 : out std_logic_vector ( 4 downto 0)
		);
	end component;
	
	component Register32 is
		port( Clk, Rst, WE 				 : in  std_logic;
			  DataIn       				 : in  std_logic_vector (31 downto 0);
			  DataOut     				 : out std_logic_vector (31 downto 0)
		);
	end component;
	
begin
---------------------------------- Control Registers -------------------------------------

	------------------------------------ WB_Reg ------------------------------------------
	WB_Reg:TwoBitRegister
		port map ( Clk 	  => Clk,
				   Rst 	  => Rst,
				   WE  	  => WE,
				   Din_1  => WB_1_IN,
				   Din_2  => WB_2_IN, 
				   Dout_1 => WB_1_out, 
				   Dout_2 => WB_2_out
		);

----------------------------------- Memory Registers -------------------------------------

	--------------------------------- MEM_out_Reg ----------------------------------------	
	MEM_out_Reg:Register32 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		    	
				   DataIn  => MEM_Data_IN,		
				   DataOut => MEM_Data_OUT	
		);

	--------------------------------- ALU_out_Reg ----------------------------------------	
	ALU_out_Reg:Register32 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		    	
				   DataIn  => ALURes_IN,		
				   DataOut => ALURes_Out
		);
	
	---------------------------------- RD_Reg -------------------------------------------
	RD_Reg:Register5  	
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst,  
				   WE  	   => WE,		
				   DataIn  => RD_IN,	
				   DataOut => RD_OUT	
		);
		
end Behavioral;

