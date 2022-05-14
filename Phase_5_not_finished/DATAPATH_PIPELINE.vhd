library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DATAPATH_PIPELINE is
	Port ( Clk, Rst   		 		     : in  std_logic;
		   -- IFSTAGE INPUTS/OUTPUTS ------------------------------------------
		   PC_LdEn, PCSrc   		     : in  std_logic;
		   PC_out			 		     : out std_logic_vector (31 downto 0);
		   ------ IF_REG INPUTS -----------------------------------------------
		   IF_Reg_WrEn		 		     : in  std_logic;									
		   -- DECSTAGE INPUTS -------------------------------------------------
		   RF_B_sel, RegWrite, MemtoReg  : in  std_logic;	
		   ImmExt_s			 		     : in  std_logic_vector ( 1 downto 0);  
		   Instruction 				     : in  std_logic_vector (31 downto 0);
		   ------ DEC_Reg INPUTS ----------------------------------------------
		   DEC_Reg_WrEn				     : in  std_logic;
		   -- EXSTAGE INPUTS --------------------------------------------------
		   ALUSrc 					     : in  std_logic;	
		   ALU_func			 		     : in  std_logic_vector ( 3 downto 0);
		   ALU_zero, ALU_cout, ALU_ovf   : out std_logic;
		   ------ EX_Reg INPUTS -----------------------------------------------
		   EX_Reg_WrEn				     : in  std_logic;	
		   -- MEMSTAGE INPUTS/OUTPUTS -----------------------------------------
		   Mem_WrEn, MemByteOp, MemWrite : in  std_logic;
		   MM_RdData 		 		     : in  std_logic_vector (31 downto 0);
		   MM_WrEn			 		     : out std_logic;
		   MM_Addr, MM_WrData 	  	     : out std_logic_vector (31 downto 0);			  
   		   ------ MEM_Reg INPUTS ----------------------------------------------
		   Mem_Reg_WrEn				     : in  std_logic
	);
end DATAPATH_PIPELINE;

architecture Behavioral of DATAPATH_PIPELINE is
	
---------------------------------------- COMPONENTS --------------------------------------------------------------------------------------------------
	component IFSTAGE_PIPELINE is
		port ( Reset, Clk, PC_sel, PC_LdEn 	    	: in  std_logic;
			   PC_Immed         			    	: in  std_logic_vector(31 downto 0);
			   PC, PC_4           			    	: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component Register64 is
		Port ( Clk, Rst, WE  	 		   	    	: in  STD_LOGIC;
			   IF_Adder_IN, MEM_Instr_IN   	    	: in  STD_LOGIC_VECTOR (31 downto 0);
			   IF_Adder_OUT, MEM_Instr_OUT 	    	: out STD_LOGIC_VECTOR (31 downto 0)
		 );
	end component;
	------------------------------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------------------------------------------------------
	component DECSTAGE_PIPELINE is
		Port ( Clk, Rst 					    	: in  std_logic;
			   RF_WrEn, RF_WrData_sel, RF_B_sel 	: in  std_logic;
			   immExt						    	: in  std_logic_vector  ( 1 downto 0);
			   Instruction, ALU_out, MEM_out    	: in  std_logic_vector  (31 downto 0);
			   RS_out, RD_out, RT_out, MuxOut   	: out std_logic_vector  ( 4 downto 0); 
			   Immed, RF_A, RF_B 			    	: out std_logic_vector  (31 downto 0) 
		);
	end component;
	
	component Register151 is 
		Port ( Clk, Rst, WE							: in  std_logic;
			   -- WB_Reg -----------------------------------------------------------------
			   WB_1_IN, WB_2_IN						: in  std_logic;
			   WB_1_OUT, WB_2_OUT		 			: out std_logic;		   
			   -- M_Reg ------------------------------------------------------------------
			   M_1_IN, M_2_IN, M_3_IN				: in  std_logic;
			   M_1_OUT, M_2_OUT, M_3_OUT			: out std_logic;
			   -- EX_Reg ---------------------------------------------------------------
			   EX_1_IN								: in  std_logic_vector(3 downto 0);
			   EX_2_IN			 					: in  std_logic;
		       EX_1_OUT								: out std_logic_vector(3 downto 0);
		       EX_2_OUT								: out std_logic;
			   -- PC_4_Reg ---------------------------------------------------------------
			   Adder_IN 							: in  std_logic_vector (31 downto 0);
		       Adder_OUT							: out std_logic_vector (31 downto 0);
			   -- RF_A_Reg ---------------------------------------------------------------
			   RF_A_IN   							: in  std_logic_vector (31 downto 0);
			   RF_A_OUT								: out std_logic_vector (31 downto 0);
			   -- RF_B_Reg ---------------------------------------------------------------
			   RF_B_IN   							: in  std_logic_vector (31 downto 0);
			   RF_B_OUT								: out std_logic_vector (31 downto 0);
			   -- Immed_Reg --------------------------------------------------------------
			   Immed_IN  							: in  std_logic_vector (31 downto 0);
		       Immed_OUT 							: out std_logic_vector (31 downto 0);
		       -- RS_Reg -----------------------------------------------------------------
		       RS_IN								: in  std_logic_vector ( 4 downto 0);	
		       RS_OUT								: out std_logic_vector ( 4 downto 0);
		       -- RD_Reg -----------------------------------------------------------------
		       RD_IN								: in  std_logic_vector ( 4 downto 0);	
		       RD_OUT								: out std_logic_vector ( 4 downto 0);
		       -- RT_Reg -----------------------------------------------------------------
		       RT_IN								: in  std_logic_vector ( 4 downto 0);	
		       RT_OUT								: out std_logic_vector ( 4 downto 0);
		       -- Mux_Reg ----------------------------------------------------------------
		       Mux_IN								: in  std_logic_vector ( 4 downto 0);	
		       Mux_OUT 		    					: out std_logic_vector ( 4 downto 0)		   
		);
	end component;
	------------------------------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------------------------------------------------------
	component EXSTAGE_PIPELINE is
		 Port ( ALU_Bin_sel 			    		: in  std_logic;
		 	    ALU_func 							: in  std_logic_vector(3 downto 0);
				RF_A, RF_B, Immed, PC_4 			: in  std_logic_vector(31 downto 0);
				ALU_zero, ALU_cout, ALU_ovf			: out std_logic;
				ALU_out, Adder_out		   			: out std_logic_vector(31 downto 0)
	 );
	end component;
	
	component Register101 is
		Port ( Clk, Rst, WE		  		 			: in  std_logic;		
			   -- WB_Reg -----------------------------------------------------------------
			   WB_1_IN, WB_2_IN	  		 			: in  std_logic;
		   	   WB_1_OUT, WB_2_OUT 		 			: out std_logic;
		   	   -- M_Reg ------------------------------------------------------------------
		   	   M_1_IN, M_2_IN, M_3_IN	 			: in  std_logic;
		       M_1_OUT, M_2_OUT, M_3_OUT 			: out std_logic;
		   	   -- PC_4_Reg ---------------------------------------------------------------
		   	   Adder_IN 		  		 			: in  std_logic_vector (31 downto 0);
		   	   Adder_OUT  		  		 			: out std_logic_vector (31 downto 0);
		   	   -- ALU_Zero_Reg -----------------------------------------------------------
		   	   ALU_Zero_IN		  		 			: in std_logic;
		   	   ALU_Zero_OUT	      		 			: out std_logic;
		   	   -- ALU_Res_Reg ------------------------------------------------------------
		   	   ALURes_IN		  		 			: in  std_logic_vector (31 downto 0);
		   	   ALURes_Out		  		 			: out std_logic_vector (31 downto 0);
		   	   -- RF_B_Reg ---------------------------------------------------------------
		   	   RF_B_IN   		  		 			: in  std_logic_vector (31 downto 0);
		   	   RF_B_OUT 		  		 			: out std_logic_vector (31 downto 0);
			   -- RD_Reg ------------------------------------------------------
			   RD_IN 					 			: in  std_logic;
			   RD_OUT					 			: out std_logic
	 );
	end component;
	-------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------------------
	component MEMSTAGE_PIPELINE is
		Port ( ByteOp, Mem_WrEn					    : in  std_logic;
               ALU_MEM_Addr, MEM_DataIn, MM_RdData  : in  std_logic_vector (31 downto 0);
               MM_WrEn 							    : out std_logic;
			   MM_Addr, MM_WrData, MEM_DataOut	    : out std_logic_vector (31 downto 0)
		 );
	end component;
	
	component Register66 is
		Port ( Clk, Rst, WE		  					: in  std_logic;
			   -- WB_Reg -----------------------------------------------------------------
		       WB_1_IN, WB_2_IN	  					: in  std_logic;
		       WB_1_OUT, WB_2_OUT 					: out std_logic;
		       -- MEM_out_Reg ------------------------------------------------------------
		       MEM_Data_IN		  					: in  std_logic_vector (31 downto 0);
		       MEM_Data_OUT		  					: out std_logic_vector (31 downto 0);
		       -- ALU_Res_Reg ------------------------------------------------------------	
		       ALURes_IN 		  					: in  std_logic_vector (31 downto 0);
		       ALURes_Out 		  					: out std_logic_vector (31 downto 0);
			   -- RD_Reg -----------------------------------------------------------------
		       RD_IN								: in  std_logic;	
		       RD_OUT								: out std_logic
	);
	end component;
	-------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------------------
	component FUnit is
		Port ( -- DEC_Reg ----------------------------------------------
			   DEC_RS, DEC_RT	  					: in std_logic;
			   -- EX_Reg -----------------------------------------------
			   EX_RegWrite, EX_RD 					: in std_logic;
		       -- MEM_Reg ----------------------------------------------
		       MEM_RegWrite, MEM_RD 				: in std_logic;
		       ---------------------------------------------------------
		       ForwardA, ForwardB   				: out std_logic_vector (1 downto 0)
		);
	end component;


-- Needed signals 
	-- IFSTAGE SIGNALS -----------------------------------------------------------------------------------------------------------
	signal IF_PC_4	 			   		 	   					   			 : std_logic_vector (31 downto 0) := (others => '0');
	------ IF_Register SIGNALS ---------------------------------------------------------------------------------------------------
	signal IF_Reg_PC_4, IF_Reg_Instr							   			 : std_logic_vector (31 downto 0) := (others => '0'); 
	-- DECSTAGE SIGNALS ----------------------------------------------------------------------------------------------------------
	signal DEC_RS, DEC_RD, DEC_RT, DEC_Mux 		 	   			   			 : std_logic_vector ( 4 downto 0) := (others => '0'); 
	signal DEC_Immed, DEC_RF_A, DEC_RF_B		   				   			 : std_logic_vector (31 downto 0) := (others => '0'); 
	------- DEC_Register SIGNALS -------------------------------------------------------------------------------------------------
	signal DEC_Reg_RS, DEC_Reg_RD, DEC_Reg_RT								 : std_logic := '0';
	signal DEC_Reg_WB_1, DEC_Reg_WB_2										 : std_logic := '0';	
    signal DEC_Reg_M_1, DEC_Reg_M_2, DEC_Reg_M_3							 : std_logic := '0';	
    signal DEC_Reg_EX_1										 			 	 : std_logic_vector ( 3 downto 0) := (others => '0'); 
	signal DEC_Reg_EX_2						 							 	 : std_logic := '0';		
	signal DEC_Reg_PC_4, DEC_Reg_Immed, DEC_Reg_RF_A, DEC_Reg_RF_B 			 : std_logic_vector (31 downto 0) := (others => '0');
	-- EXSTAGE SIGNALS -----------------------------------------------------------------------------------------------------------	
	signal EX_ALU_Zero											   			 : std_logic := '0';
	signal EX_Adder_out, EX_ALU_out								   			 : std_logic_vector (31 downto 0) := (others => '0');
	------ EX_Register SIGNALS ---------------------------------------------------------------------------------------------------
	signal EX_Reg_RD								 	 					 : std_logic := '0';
	signal EX_Reg_WB_1, EX_Reg_WB_2, EX_Reg_M_1, EX_Reg_M_2, EX_Reg_M_3		 : std_logic := '0';
	signal EX_Reg_Adder_out, EX_Reg_ALU_out, EX_Reg_RF_B 		   			 : std_logic_vector (31 downto 0) := (others => '0'); 
	-- MEMSTAGE SIGNALS ----------------------------------------------------------------------------------------------------------
	signal MEM_MEMData_out											   		 : std_logic_vector (31 downto 0) := (others => '0');
	-- MEMSTAGE SIGNALS ----------------------------------------------------------------------------------------------------------
	signal MEM_Reg_RD								 	 					 : std_logic := '0';
	signal MEM_Reg_WB_1, MEM_Reg_WB_2							   			 : std_logic := '0';
	signal MEM_Reg_MEMData_out, MEM_Reg_ALU_out                       		 : std_logic_vector (31 downto 0) := (others => '0');
	-- FORWARD UNIT SIGNALS
	
-------------------------------------------------- Main Functions -------------------------------------------------                                                                                        
begin
----------------------------------------------------- IFSTAGE -----------------------------------------------------
	IF_module:IFSTAGE_PIPELINE
		port map ( Clk      	 => Clk,
				   Reset    	 => Rst,                   
				   PC_sel   	 => EX_Reg_M_1,	  	  	 -- PCSrc from EX Register, 
				   PC_LdEn  	 => PC_LdEn,
				   PC_Immed 	 => EX_Reg_Adder_out, 	 -- Adder result from EX Register
				   PC       	 => PC_out,
				   PC_4			 =>	IF_PC_4		      	 -- PC + 4 Signal to IF Register
		);
	
	IF_Reg:Register64 
		port map ( Clk 			 => Clk,
				   Rst 			 => Rst, 
				   WE  			 => IF_Reg_WrEn,	  	 -- IF_Reg write enable from Control
				   -- PC_4_Reg -------------------------------------------------------------------------------------
				   IF_Adder_IN   => IF_PC_4,		  	 -- PC + 4 Signal from IFSTAGE 
				   IF_Adder_OUT  => IF_Reg_PC_4,	  	 -- PC + 4 to DEC Register
				   -- Mem_Instr_Reg --------------------------------------------------------------------------------
				   MEM_Instr_IN  => Instruction,	  	 -- Instruction from MEMORY
				   MEM_Instr_OUT => IF_Reg_Instr	  	 -- Instruction to DECSTAGE 
		);
		
----------------------------------------------------- DECSTAGE -----------------------------------------------------
	DEC_module:DECSTAGE_PIPELINE
		port map ( Clk           => Clk,
				   Rst           => Rst,
				   RF_WrEn     	 => Mem_Reg_WB_1,	  	 -- RegWrite signal from MEM Register
				   RF_WrData_sel => Mem_Reg_WB_2,	  	 -- RF_WrData_Sel from MEM Register
				   RF_B_sel      => RF_B_sel,      	  	 -- Erxetai kateutheian apo to control     
				   immExt        => ImmExt_s,		  	 -- Erxetai kateutheian apo to control 
				   Instruction	 => IF_Reg_Instr,	  	 -- Instruction from IF Register
				   ALU_out		 => MEM_Reg_ALU_out,  	 -- ALU out from MEM Register
				   MEM_out 	     => MEM_Reg_MEMData_out, -- MEM Data out from MEM Register
				   RS_out		 => DEC_RS,			  	 -- RS to DEC Register and ForwardUnit
				   RD_out		 => DEC_RD,			  	 -- RD to DEC Register
				   RT_out        => DEC_RT, 		  	 -- RT to DEC register
				   MuxOut        => DEC_Mux,	 	  	 -- MUX5 to DEC register
				   Immed 		 => DEC_Immed,	  	  	 -- Immed value to DEC register
				   RF_A			 => DEC_RF_A,	 	  	 -- RF_A to DEC register
				   RF_B			 => DEC_RF_B		  	 -- RF_B to DEC register	
		);
	
     	 
	DEC_Reg:Register151 							 
		Port map ( Clk 	  		 => Clk,
				   Rst 	  		 => Rst,			
				   WE  	  		 => DEC_Reg_WrEn,	  -- DEC_Reg write enable from Control
				   -- WB_Reg ---------------------------------------------------------------------------------------
				   WB_1_IN  	 => RegWrite,		  -- RegWrite signal from Control
				   WB_2_IN		 => MemtoReg,		  -- MemtoReg signal from Control
				   WB_1_OUT  	 => DEC_Reg_WB_1, 	  -- RegWrite value to EX Register
				   WB_2_OUT	     => DEC_Reg_WB_2,     -- MemtoReg value to EX Register
				   -- M_Reg ----------------------------------------------------------------------------------------				   
				   M_1_IN		 => PCSrc,	  	  	  -- PCSrc signal from Control
				   M_2_IN		 => MemByteOp,		  -- MemByteOp signal from Control
				   M_3_IN		 => MemWrite,		  -- MemWrite signal from Control
				   M_1_OUT  	 => DEC_Reg_M_1,	  -- PCSrc to EX Register
				   M_2_OUT  	 => DEC_Reg_M_2,	  -- MemByteOp value to EX Register
				   M_3_OUT  	 => DEC_Reg_M_3,	  -- MemWrite value to EX Register
				   -- EX_Reg ---------------------------------------------------------------------------------------
				   EX_1_IN		 => ALU_func,		  -- ALU_func signal from Control
				   EX_2_IN		 => ALUSrc,		  	  -- ALUSrc signal from Control
				   EX_1_OUT		 => DEC_Reg_EX_1,	  -- ALU_func to EXSTAGE
				   EX_2_OUT 	 => DEC_Reg_EX_2,	  -- ALUSrc to EXSTAGE
				   -- PC_4_Reg -------------------------------------------------------------------------------------
				   Adder_IN 	 => IF_Reg_PC_4,	  -- PC+4 from IF Register
				   Adder_OUT 	 => DEC_Reg_PC_4,	  -- PC+4 to EXSTAGE
			       -- RF_A_Reg -------------------------------------------------------------------------------------
				   RF_A_IN 		 => DEC_RF_A,	 	  -- RF_A from DECSTAGE 				  
				   RF_A_OUT		 => DEC_Reg_RF_A, 	  -- RF_A to EXSTAGE
			       -- RF_B_Reg -------------------------------------------------------------------------------------
				   RF_B_IN 		 => DEC_RF_B,	 	  -- RF_B from DECSTAGE
				   RF_B_OUT 	 => DEC_Reg_RF_B, 	  -- RF_B to EXSTAGE and EX_Reg
			       -- Immed_Reg ------------------------------------------------------------------------------------
				   Immed_IN 	 => DEC_Immed,	 	  -- Immed from DECSTAGE
				   Immed_OUT  	 => DEC_Reg_Immed, 	  -- Immed to EXSTAGE
				   -- RS_Reg ---------------------------------------------------------------------------------------
				   RS_IN		 => DEC_RS,			  -- RS from DECSTAGE	
				   RS_OUT   	 => DEC_Reg_RS,		  -- RS to Forward Unit 
				   -- RD_Reg ---------------------------------------------------------------------------------------
				   RD_IN  		 => DEC_RD,			  -- RD from DECSTAGE
				   RD_OUT   	 => DEC_Reg_RD,		  -- RD to Forward Unit and EX Register
				   -- RT_Reg ---------------------------------------------------------------------------------------
				   RT_IN  		 => DEC_RT,			  -- RT from DECSTAGE
				   RT_OUT        => DEC_Reg_RT,		  -- RT to Forward Unit 
			       -- Mux_Reg --------------------------------------------------------------------------------------
				   Mux_IN 		 => DEC_Mux,		  -- Mux from DECSTAGE
			       Mux_OUT		 => open 			  -------------------------------------------------Den Xero akoma
		);
	
	
----------------------------------------------------- EXSTAGE -----------------------------------------------------
	EX_module:EXSTAGE_PIPELINE
		Port map ( PC_4 	    => DEC_Reg_PC_4,	  -- PC+4 value from DEC Register 
				   Immed  	    => DEC_Reg_Immed,	  -- Immed value from DEC Register
				   RF_A		    => DEC_Reg_RF_A,	  -- RF_A value from DEC Register
				   RF_B 	    => DEC_Reg_RF_B,	  -- RF_B value from DEC Register
				   ALU_Bin_sel  => DEC_Reg_EX_2,	  -- ALUSrc from DEC Register		 
				   ALU_func     => DEC_Reg_EX_1, 	  -- ALU_func from DEC Register
				   Adder_out    => EX_Adder_out,	  -- Adder result to EX Register
				   ALU_out      => EX_ALU_out,		  -- ALU out to EX Register
				   ALU_zero	    => EX_ALU_Zero,		  -- ALU Zero to EX Register
				   ALU_cout	    => open,			  -- Useless
				   ALU_ovf 	    => open				  -- Useless	
		);
	
	EX_Reg:Register101
		Port map ( Clk 		    => Clk,
				   Rst 		    => Rst,
				   WE  		    => EX_Reg_WrEn,		  	 -- EX_Reg write enable from Control
				   -- WB_Reg ---------------------------------------------------------------------------------------
				   WB_1_IN 	    => DEC_Reg_WB_1, 	  	 -- RegWrite from DEC Register
				   WB_2_IN      => DEC_Reg_WB_2, 	  	 -- MemtoReg from DEC Register
				   WB_1_OUT     => EX_Reg_WB_1,		  	 -- RegWrite from EX Register
				   WB_2_OUT	    => EX_Reg_WB_2,		  	 -- MemtoReg from EX Register
				   -- M_Reg ----------------------------------------------------------------------------------------		  
				   M_1_IN  	    => DEC_Reg_M_1,		  	 -- PCSrc from DEC Register
				   M_2_IN	    => DEC_Reg_M_2,		  	 -- MemByteOp value from DEC Register
				   M_3_IN	    => DEC_Reg_M_3,		  	 -- MemWrite value from DEC Register
				   M_1_OUT      => EX_Reg_M_1,		  	 -- PCSrc to IF Register
				   M_2_OUT      => EX_Reg_M_2,        	 -- MemByteOp value to EX Register
				   M_3_OUT      => EX_Reg_M_3,        	 -- MemWrite value to EX Register
				   -- Adder_Res_Reg --------------------------------------------------------------------------------
				   Adder_IN     => EX_Adder_OUT,	  	 -- Adder result from EXSTAGE 
		           Adder_OUT    => EX_Reg_Adder_OUT,  	 -- Adder result to IFSTAGE 
				   -- ALU_Zero_Reg ---------------------------------------------------------------------------------
				   ALU_Zero_IN  => EX_ALU_Zero,		  	 -- ALU zero value from EXSTAGE
				   ALU_Zero_OUT => ALU_zero,		  	 -- Output to Control module
				   -- ALU_Res_Reg ----------------------------------------------------------------------------------
				   ALURes_IN    => EX_ALU_OUT,		  	 -- ALU_OUT from EXSTAGE
				   ALURes_Out   => EX_Reg_ALU_OUT,    	 -- ALU_OUT to MEMSTAGE
				   -- RF_B_Reg -------------------------------------------------------------------------------------
				   RF_B_IN      => DEC_Reg_RF_B,	  	 -- RF_B from DEC_Reg
				   RF_B_OUT     => EX_Reg_RF_B,		  	 -- RF_B to MEMSTAGE
				   -- RD_Reg ---------------------------------------------------------------------------------------
				   RD_IN  		=> DEC_Reg_RD,			 -- RD from DECSTAGE
				   RD_OUT   	=> EX_Reg_RD		  	 -- RD to MEM Register
		);
	  
----------------------------------------------------- MEMSTAGE -----------------------------------------------------
	MEM_module:MEMSTAGE_PIPELINE
		Port map ( ByteOp         => EX_Reg_M_2, 	  	 -- MemByteOp from EX Register
				   Mem_WrEn	  	  => EX_Reg_M_3, 	  	 -- MemWrite from EX Register
				   ALU_MEM_Addr   => EX_Reg_ALU_OUT,  	 -- ALU result from EX Register
				   MEM_DataIn     => EX_Reg_RF_B, 	  	 -- RF_B from EX Register
				   MM_RdData      => MM_RdData, 	
				   MM_WrEn        => MM_WrEn,
				   MM_Addr        => MM_Addr,
				   MM_WrData      => MM_WrData,
				   MEM_DataOut    => MEM_MEMData_out 	  -- Data out to MEM_Reg
		);
		
	MEM_Reg:Register66 
		Port map ( Clk 			 => Clk,
				   Rst 			 => Rst, 
				   WE  			 => Mem_Reg_WrEn,	  	 -- MEM_Reg write enable from Control
				   -- WB_Reg ----------------------------------------------------------------------------------------
				   WB_1_IN 	     => EX_Reg_WB_1, 	  	 -- RegWrite from EX Register
				   WB_2_IN       => EX_Reg_WB_2, 	  	 -- MemtoReg from EX Register
				   WB_1_OUT      => Mem_Reg_WB_1,	  	 -- RegWrite to DECSTAGE
				   WB_2_OUT	     => Mem_Reg_WB_2,	  	 -- MemtoReg to DECSTAGE
				   -- MEM_OUT_Reg -----------------------------------------------------------------------------------
				   MEM_Data_IN   => MEM_MEMData_out,     -- MEM data out from MEMSTAGE
				   MEM_Data_OUT  => MEM_Reg_MEMData_out, -- MEM data out to DECSTAGE
				   -- ALU_out_Reg
				   ALURes_IN	 => EX_Reg_ALU_out,   	 -- ALU out from EX Register
				   ALURes_Out    => MEM_Reg_ALU_out,     -- ALU out to DECSTAGE
				   -- RD_Reg ---------------------------------------------------------------------------------------
				   RD_IN  		 => EX_Reg_RD,			 -- RD from DECSTAGE
				   RD_OUT   	 => MEM_Reg_RD		  	 -- RD to MEM Register
		);
-------------------------------------------------------- HAZARD ------------------------------------------------------

	ForwardUnit:FUnit
		Port map ( DEC_RS 		=> DEC_Reg_RD,			 -- RS from DEC Register
				   DEC_RT 		=> DEC_Reg_RT, 			 -- RT from DEC Register 	
				   EX_RegWrite  => EX_Reg_WB_1,			 -- RegWrite from EX Register
				   EX_RD 	    => EX_Reg_RD,			 -- RD from EX Register
				   MEM_RegWrite => Mem_Reg_WB_1,         -- RegWrite from MEM Register
				   MEM_RD 		=> MEM_Reg_RD,			 -- RD from MEM Register
				   ForwardA		=> open,
				   ForwardB     => open
		);

	
end Behavioral;
