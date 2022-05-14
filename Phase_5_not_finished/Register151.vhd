library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register151 is
	Port ( Clk, Rst, WE					: in  std_logic;
		   -- WB_Reg ---------------------------------------------------------------
		   WB_1_IN, WB_2_IN				: in  std_logic;
		   WB_1_OUT, WB_2_OUT		 	: out std_logic;		   
		   -- M_Reg ----------------------------------------------------------------
		   M_1_IN, M_2_IN, M_3_IN		: in  std_logic;
		   M_1_OUT, M_2_OUT, M_3_OUT	: out std_logic;
		   -- EX_Reg ---------------------------------------------------------------
		   EX_1_IN						: in  std_logic_vector(3 downto 0);	
		   EX_2_IN			 			: in  std_logic;
		   EX_1_OUT						: out std_logic_vector(3 downto 0);
		   EX_2_OUT						: out std_logic;
		   -- PC_4_Reg -------------------------------------------------------------
		   Adder_IN 					: in  std_logic_vector (31 downto 0);
		   Adder_OUT					: out std_logic_vector (31 downto 0);
		   -- RF_A_Reg -------------------------------------------------------------
		   RF_A_IN   					: in  std_logic_vector (31 downto 0);
		   RF_A_OUT						: out std_logic_vector (31 downto 0);
		   -- RF_B_Reg -------------------------------------------------------------
		   RF_B_IN   					: in  std_logic_vector (31 downto 0);
		   RF_B_OUT						: out std_logic_vector (31 downto 0);
		   -- Immed_Reg ------------------------------------------------------------
		   Immed_IN  					: in  std_logic_vector (31 downto 0);
		   Immed_OUT 					: out std_logic_vector (31 downto 0);
		   -- RS_Reg ---------------------------------------------------------------
		   RS_IN						: in  std_logic_vector ( 4 downto 0);	
		   RS_OUT						: out std_logic_vector ( 4 downto 0);
		   -- RD_Reg ---------------------------------------------------------------
		   RD_IN						: in  std_logic_vector ( 4 downto 0);	
		   RD_OUT						: out std_logic_vector ( 4 downto 0);
		   -- RT_Reg ---------------------------------------------------------------
		   RT_IN						: in  std_logic_vector ( 4 downto 0);	
		   RT_OUT						: out std_logic_vector ( 4 downto 0);
		   -- Mux_Reg --------------------------------------------------------------
		   Mux_IN						: in  std_logic_vector ( 4 downto 0);	
		   Mux_OUT 		    			: out std_logic_vector ( 4 downto 0)		   
	 );
end Register151;

architecture Behavioral of Register151 is
------------------------------------- COMPONENTS ------------------------------------------
	component TwoBitRegister is
		Port( Clk, Rst, WE, Din_1, Din_2 		: in  std_logic;
			  Dout_1, Dout_2 			 		: out std_logic
		);
	end component;
	
	component ThreeBitRegister is
		Port( Clk, Rst, WE, Din_1, Din_2, Din_3 : in  std_logic;
			  Dout_1, Dout_2, Dout_3  			: out std_logic
		);
	end component;
	
	component Register1 is
		port( CLK, RST, WE 				 		: in  std_logic;
			  DataIn       				 		: in  std_logic;
			  DataOut     				 		: out std_logic
		);
	end component;
	
	
	component Register4 is
		port( CLK, RST, WE 				 		: in  std_logic;
			  DataIn       				 		: in  std_logic_vector (3 downto 0);
			  DataOut     				 		: out std_logic_vector (3 downto 0)
		);
	end component;
	
	
	component Register5 is
		port( CLK, RST, WE 				 		: in  std_logic;
			  DataIn       				 		: in  std_logic_vector (4 downto 0);
			  DataOut     				 		: out std_logic_vector (4 downto 0)
		);
	end component;
	
	component Register32 is
		port( Clk, Rst, WE 				 		: in  std_logic;
			  DataIn       				 		: in  std_logic_vector (31 downto 0);
			  DataOut     				 		: out std_logic_vector (31 downto 0)
		);
	end component;

begin
----------------------------------- Control Registers -----------------------------------
	
	------------------------------------ WB_Reg -----------------------------------------
	WB_Reg:TwoBitRegister
		port map ( Clk 	  => Clk,
				   Rst 	  => Rst,
				   WE  	  => WE,
				   Din_1  => WB_1_IN,
				   Din_2  => WB_2_IN, 
				   Dout_1 => WB_1_OUT, 
				   Dout_2 => WB_2_OUT
		);
	
	------------------------------------ M_Reg ------------------------------------------
	M_Reg:ThreeBitRegister
		port map ( Clk 	  => Clk,
				   Rst 	  => Rst,
				   WE  	  => WE,
				   Din_1  => M_1_IN,
				   Din_2  => M_2_IN, 
				   Din_3  => M_3_IN, 
				   Dout_1 => M_1_OUT, 
				   Dout_2 => M_2_OUT,
				   Dout_3 => M_3_OUT
		);
	
	------------------------------------ EX_Reg -----------------------------------------
	EX_Reg_1:Register4 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => EX_1_IN,
				   DataOut => EX_1_OUT
		);
	
	EX_Reg_2:Register1 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => EX_2_IN,
				   DataOut => EX_2_OUT
		);

---------------------------------- DECSTAGE Registers -----------------------------------
		
	---------------------------------- PC_4_Reg -----------------------------------------
	PC_4_Reg:Register32 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => Adder_IN,	
				   DataOut => Adder_OUT	
		);
		
	---------------------------------- RF_A_Reg -----------------------------------------	
	RF_A_Reg:Register32 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => RF_A_IN,	
				   DataOut => RF_A_OUT	
		);
		
	---------------------------------- RF_A_Reg -----------------------------------------	
	RF_B_Reg:Register32  	
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => RF_B_IN,	
				   DataOut => RF_B_OUT	
		);
		
	---------------------------------- Immed_Reg ----------------------------------------	
	Immed_Reg:Register32  	
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => Immed_IN,	
				   DataOut => Immed_OUT	
		);
		
	----------------------------------- RS_Reg ------------------------------------------
	RS_Reg:Register5  	
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => RS_IN,	
				   DataOut => RS_OUT	
		);
		
	----------------------------------- RD_Reg ------------------------------------------
	RD_Reg:Register5  	
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst,  
				   WE  	   => WE,		
				   DataIn  => RD_IN,	
				   DataOut => RD_OUT	
		);
	
	----------------------------------- RT_Reg ------------------------------------------
	RT_Reg:Register5  	
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => RT_IN,	
				   DataOut => RT_OUT	
		);
		
	---------------------------------- Mux_Reg -------------------------------------------
	Mux_Reg:Register5  	
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => Mux_IN,
				   DataOut => Mux_OUT
		);

end Behavioral;

