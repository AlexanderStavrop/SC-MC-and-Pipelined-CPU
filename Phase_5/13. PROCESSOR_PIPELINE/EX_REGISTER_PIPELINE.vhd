library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EX_REGISTER_PIPELINE is
	Port ( Clk, Rst, WE				 : in  std_logic;		
		   -- WB_Reg ---------------------------------------------------------------
		   WB_1_IN, WB_2_IN			 : in  std_logic;
		   WB_1_OUT, WB_2_OUT		 : out std_logic;
		   -- M_Reg ----------------------------------------------------------------
		   M_1_IN, M_2_IN, M_3_IN	 : in  std_logic;
		   M_1_OUT, M_2_OUT, M_3_OUT : out std_logic;
		   -- PC_4_Reg -------------------------------------------------------------
		   AdderRes_IN 				 : in  std_logic_vector (31 downto 0);
		   AdderRes_OUT  			 : out std_logic_vector (31 downto 0);
		   -- ALU_Zero_Reg ------------------------------------------------
		   ALU_Zero_IN				 : in  std_logic;
		   ALU_Zero_OUT				 : out std_logic;
		   -- ALU_Res_Reg -------------------------------------------------
		   ALURes_IN				 : in  std_logic_vector (31 downto 0);
		   ALURes_Out				 : out std_logic_vector (31 downto 0);
		   -- RF_B_Reg ----------------------------------------------------
		   RF_B_IN   				 : in  std_logic_vector (31 downto 0);
		   RF_B_OUT 				 : out std_logic_vector (31 downto 0);
		   -- RD_Reg ------------------------------------------------------
		   RD_IN 					 : in  std_logic_vector ( 4 downto 0);
		   RD_OUT					 : out std_logic_vector ( 4 downto 0)
	 );
end EX_REGISTER_PIPELINE;

architecture Behavioral of EX_REGISTER_PIPELINE is
------------------------------------- COMPONENTS ------------------------------------------
	component Register1 is
		port( Clk, Rst, WE 				 		: in  std_logic;
			  DataIn       				 		: in  std_logic;
			  DataOut      				 		: out std_logic
		);
	end component;
	
	component TwoBitRegister is
		Port( Clk, Rst, WE, Din_1, Din_2 		: in  std_logic;
			  Dout_1, Dout_2 			 		: out std_logic
		);
	end component;
	
	component ThreeBitRegister is
		Port( Clk, Rst, WE, Din_1, Din_2, Din_3 : in  std_logic;
			  Dout_1, Dout_2, Dout_3 			: out std_logic
		);
	end component;
		component Register5 is
		port( Clk, Rst, WE 				 		: in  std_logic;
			  DataIn       				 		: in  std_logic_vector ( 4 downto 0);
			  DataOut     				 		: out std_logic_vector ( 4 downto 0)
		);
	end component;
	
	component Register32 is
		port( Clk, Rst, WE 				 		: in  std_logic;
			  DataIn       				 		: in  std_logic_vector (31 downto 0);
			  DataOut     				 		: out std_logic_vector (31 downto 0)
		);
	end component;
	
begin
---------------------------------- Control Registers -------------------------------------

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
		
---------------------------------- DECSTAGE Registers -----------------------------------

	-------------------------------- Adder_Res_Reg --------------------------------------
	Adder_Res_Reg:Register32 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,				
				   DataIn  => AdderRes_IN,	
				   DataOut => AdderRes_OUT	
		);
		
	-------------------------------- ALU_Zero_Reg ---------------------------------------
	ALU_Zero_Reg:Register1 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		
				   DataIn  => ALU_Zero_IN,	
				   DataOut => ALU_Zero_OUT	
		);
		
	--------------------------------- ALU_Res_Reg ----------------------------------------
	ALU_out_Reg:Register32 
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		    	
				   DataIn  => ALURes_IN,		
				   DataOut => ALURes_OUT
		);
		
	--------------------------------- RF_B_Reg ------------------------------------------
	RF_B_Reg:Register32  	
		port map ( Clk 	   => Clk,
				   Rst 	   => Rst, 
				   WE  	   => WE,		    	
				   DataIn  => RF_B_IN,			
				   DataOut => RF_B_OUT	
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

