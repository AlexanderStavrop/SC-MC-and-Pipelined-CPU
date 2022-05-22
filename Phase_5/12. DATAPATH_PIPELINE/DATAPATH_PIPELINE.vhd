library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DATAPATH_PIPELINE is
	Port ( Clk, Rst   		 		     : in  std_logic;
		   -- IFSTAGE INPUTS/OUTPUTS ------------------------------------------
		   PCSrc   		     			 : in  std_logic;
		   PC_out			 		     : out std_logic_vector (31 downto 0);
		   -- DECSTAGE INPUTS -------------------------------------------------
		   RegDst, RegWrite, MemtoReg    : in  std_logic;	
		   ImmExt_s			 		     : in  std_logic_vector ( 1 downto 0);  
		   Instruction_IN 			     : in  std_logic_vector (31 downto 0);
		   Instruction_OUT			     : out std_logic_vector (31 downto 0);
		   ------ DEC_Reg INPUTS ----------------------------------------------
		   DEC_Reg_WrEn				     : in  std_logic;
		   -- EXSTAGE INPUTS --------------------------------------------------
		   ALUSrc 					     : in  std_logic;	
		   ALU_func			 		     : in  std_logic_vector ( 3 downto 0);
		   ALU_zero, ALU_cout, ALU_ovf   : out std_logic;
		   ------ EX_Reg INPUTS -----------------------------------------------
		   EX_Reg_WrEn				     : in  std_logic;	
		   -- MEMSTAGE INPUTS/OUTPUTS -----------------------------------------
		   MemByteOp, MemWrite 			 : in  std_logic;
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
		port ( Reset, Clk, PC_sel, PC_LdEn 	    	  		 : in  std_logic;
			   PC_Immed         			      	  		 : in  std_logic_vector(31 downto 0);
			   PC, PC_4           			    	  		 : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component IF_REGISTER_PIPELINE is
		Port ( Clk, Rst, WE  	 		   	    	  		 : in  std_logic;
			   IF_Adder_IN, MEM_Instr_IN   	    	  		 : in  std_logic_vector (31 downto 0);
			   IF_Adder_OUT, MEM_Instr_OUT 	    	  		 : out std_logic_vector (31 downto 0)
		 );
	end component;
	------------------------------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------------------------------------------------------
	component DECSTAGE_PIPELINE is
		Port ( Clk, Rst 					          		 : in  std_logic;
			   RF_WrEn, RF_WrData_sel, RF_B_sel       		 : in  std_logic;
			   immExt						          		 : in  std_logic_vector  ( 1 downto 0);
			   RD_IN							      		 : in  std_logic_vector ( 4 downto 0);
			   Instruction, ALU_out, MEM_out          		 : in  std_logic_vector  (31 downto 0);
			   RS_out, RD_out,RT_out, Mux_RDRT_Out    		 : out std_logic_vector  ( 4 downto 0); 
			   Immed, RF_A, RF_B, Mux_WrData 	      		 : out std_logic_vector  (31 downto 0) 
		);
	end component;
	
	component DEC_REGISTER_PIPELINE is 
		Port ( Clk, Rst, WE							  		 : in  std_logic;
			   -- WB_Reg -----------------------------------------------------------------
			   WB_1_IN, WB_2_IN						  		 : in  std_logic;
			   WB_1_OUT, WB_2_OUT		 			  		 : out std_logic;		   
			   -- M_Reg ------------------------------------------------------------------
			   M_1_IN, M_2_IN, M_3_IN				  		 : in  std_logic;
			   M_1_OUT, M_2_OUT, M_3_OUT			  		 : out std_logic;
			   -- EX_Reg ---------------------------------------------------------------
			   EX_1_IN								  		 : in  std_logic_vector(3 downto 0);
			   EX_2_IN			 					  		 : in  std_logic;
		       EX_1_OUT								  		 : out std_logic_vector(3 downto 0);
		       EX_2_OUT								  		 : out std_logic;
			   -- PC_4_Reg ---------------------------------------------------------------
			   Adder_IN 							  		 : in  std_logic_vector (31 downto 0);
		       Adder_OUT							  		 : out std_logic_vector (31 downto 0);
			   -- RF_A_Reg ---------------------------------------------------------------
			   RF_A_IN   							  		 : in  std_logic_vector (31 downto 0);
			   RF_A_OUT								  	 	 : out std_logic_vector (31 downto 0);
			   -- RF_B_Reg ---------------------------------------------------------------
			   RF_B_IN   							  		 : in  std_logic_vector (31 downto 0);
			   RF_B_OUT								  		 : out std_logic_vector (31 downto 0);
			   -- Immed_Reg --------------------------------------------------------------
			   Immed_IN  							  		 : in  std_logic_vector (31 downto 0);
		       Immed_OUT 							  		 : out std_logic_vector (31 downto 0);
		       -- RS_Reg -----------------------------------------------------------------
		       RS_IN								  		 : in  std_logic_vector ( 4 downto 0);	
		       RS_OUT								  		 : out std_logic_vector ( 4 downto 0);
		       -- RD_Reg -----------------------------------------------------------------
		       RD_IN								  		 : in  std_logic_vector ( 4 downto 0);	
		       RD_OUT								  		 : out std_logic_vector ( 4 downto 0);
		       -- Mux_Reg ----------------------------------------------------------------
		       Mux_IN								  		 : in  std_logic_vector ( 4 downto 0);	
		       Mux_OUT 		    					  		 : out std_logic_vector ( 4 downto 0)		   
		);
	end component;
	------------------------------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------------------------------------------------------
	component EXSTAGE_PIPELINE is
		 Port ( ALU_Bin_sel 			    		  		 : in  std_logic;
		 	    ALU_func 							  		 : in  std_logic_vector(3 downto 0);
				RF_A, RF_B, Immed, PC_4 			  		 : in  std_logic_vector(31 downto 0);
				ALU_zero, ALU_cout, ALU_ovf			  		 : out std_logic;
				ALU_out, Adder_out		   			  		 : out std_logic_vector(31 downto 0)
	 );
	end component;
	
	component EX_REGISTER_PIPELINE is
		Port ( Clk, Rst, WE		  		 			  		 : in  std_logic;		
			   -- WB_Reg -----------------------------------------------------------------
			   WB_1_IN, WB_2_IN	  		 			  		 : in  std_logic;
		   	   WB_1_OUT, WB_2_OUT 		 			  		 : out std_logic;
		   	   -- M_Reg ------------------------------------------------------------------
		   	   M_1_IN, M_2_IN, M_3_IN	 			  		 : in  std_logic;
		       M_1_OUT, M_2_OUT, M_3_OUT 			  		 : out std_logic;
		   	   -- PC_4_Reg ---------------------------------------------------------------
		   	   AdderRes_IN 		  		 			  		 : in  std_logic_vector (31 downto 0);
		   	   AdderRes_OUT  		  		 		  		 : out std_logic_vector (31 downto 0);
		   	   -- ALU_Zero_Reg -----------------------------------------------------------
		   	   ALU_Zero_IN		  		 			  		 : in std_logic;
		   	   ALU_Zero_OUT	      		 			  		 : out std_logic;
		   	   -- ALU_Res_Reg ------------------------------------------------------------
		   	   ALURes_IN		  		 			  		 : in  std_logic_vector (31 downto 0);
		   	   ALURes_Out		  		 			  		 : out std_logic_vector (31 downto 0);
		   	   -- RF_B_Reg ---------------------------------------------------------------
		   	   RF_B_IN   		  		 			  		 : in  std_logic_vector (31 downto 0);
		   	   RF_B_OUT 		  		 		  	  		 : out std_logic_vector (31 downto 0);
			   -- RD_Reg ------------------------------------------------------
			   RD_IN 					 			  		 : in  std_logic_vector ( 4 downto 0);
			   RD_OUT					 			  		 : out std_logic_vector ( 4 downto 0)
	 );
	end component;
	-------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------------------
	component MEMSTAGE is 
		Port ( ByteOp, Mem_WrEn					      		 : in  std_logic;
               ALU_MEM_Addr, MEM_DataIn, MM_RdData    		 : in  std_logic_vector (31 downto 0);
               MM_WrEn 							      		 : out std_logic;
			   MM_Addr, MM_WrData, MEM_DataOut	      		 : out std_logic_vector (31 downto 0)
		 );
	end component;
	
	component MEM_REGISTER_PIPELINE is
		Port ( Clk, Rst, WE		  					  		 : in  std_logic;
			   -- WB_Reg -----------------------------------------------------------------
		       WB_1_IN, WB_2_IN	  					  		 : in  std_logic;
		       WB_1_OUT, WB_2_OUT 					  		 : out std_logic;
		       -- MEM_out_Reg ------------------------------------------------------------
		       MEM_Data_IN		  					  		 : in  std_logic_vector (31 downto 0);
		       MEM_Data_OUT		  					  		 : out std_logic_vector (31 downto 0);
		       -- ALU_Res_Reg ------------------------------------------------------------	
		       ALURes_IN 		  					  		 : in  std_logic_vector (31 downto 0);
		       ALURes_Out 		  					  		 : out std_logic_vector (31 downto 0);
			   -- RD_Reg -----------------------------------------------------------------
		       RD_IN								  		 : in  std_logic_vector ( 4 downto 0);	
		       RD_OUT								  		 : out std_logic_vector ( 4 downto 0)
	);
	end component;
	-------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------------------
	component Forward_Unit is
		Port ( -- DEC_Reg ---------------------------------------------------------------
			   DEC_Reg_RS, DEC_Reg_RDRT				  		 : in  std_logic_vector ( 4 downto 0);
			   -- EX_Reg ----------------------------------------------------------------
		       EX_Reg_RegWrite						  		 : in  std_logic;
		       EX_Reg_RD							  		 : in  std_logic_vector ( 4 downto 0);
			   -- MEM_Reg ---------------------------------------------------------------
		       MEM_Reg_RegWrite						  		 : in  std_logic;
		       MEM_Reg_RD							  		 : in  std_logic_vector ( 4 downto 0);
		       -- Muxes -----------------------------------------------------------------
		       DEC_Reg_RF_A, DEC_Reg_RF_B, DEC_Reg_Write_Mux : in  std_logic_vector (31 downto 0);
			   EX_Reg_ALU_out					 	  		 : in  std_logic_vector (31 downto 0);
		       FU_UpMux_OUT, FU_DownMux_OUT			  		 : out std_logic_vector (31 downto 0)
	);
	end component;
	-------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------------------
	component Hazard_Unit is
		Port( -- DEC ---------------------------------------------
		      DEC_RS, DEC_RT         				  		: in std_logic_vector(4 downto 0);
	          -- DEC_Reg -----------------------------------------
		      DEC_Reg_MemtoReg       				  		: in std_logic;
              DEC_Reg_RDRT           				  		: in std_logic_vector(4 downto 0);
              ----------------------------------------------------
			  PC_LdEn, IF_Reg_WrEn, HUnit_OUT 		  		: out STD_LOGIC
		);
	end component;
	
	component CONTROL_Mux is
		Port ( -- WB_Reg ----------------------------------------------------------
			   RegWrite_IN, MemtoReg_IN 		      		: in  std_logic;		
			   RegWrite_OUT, MemtoReg_OUT 		   	  		: out std_logic;		
			   -- M_Reg -----------------------------------------------------------
			   PCSrc_IN, MemByteOp_IN, MemWrite_IN    		: in  std_logic;
		       PCSrc_OUT, MemByteOp_OUT, MemWrite_OUT 		: out std_logic;
			   -- EX_Reg ----------------------------------------------------------
		       ALUSrc_IN    					   	  		: in  std_logic;
		       ALUSrc_OUT    					      		: out std_logic;
		       ALU_func_IN						      		: in  std_logic_vector ( 3 downto 0);
		       ALU_func_OUT						      		: out std_logic_vector ( 3 downto 0);
		       -- DEC module ------------------------------------------------------
		       RegDst_IN						      		: in  std_logic;
		       RegDst_OUT						      		: out std_logic;
		       ImmExt_s_IN						      		: in  std_logic_vector ( 1 downto 0);
		       ImmExt_s_OUT						      		: out std_logic_vector ( 1 downto 0);
		       -- Mux Input/output ------------------------------------------------
		       DataSel 						          		: in  std_logic
		);
	end component;
	
-- Needed signals 
	-- IFSTAGE SIGNALS ------------------------------------------------------------------------------------------------------
	signal IF_PC_4	 			   		 	   					   				  : std_logic_vector (31 downto 0) := (others => '0');
	------ IF_Register SIGNALS ------------------------------------------------------------------------------------------------------
	signal IF_Reg_PC_4, IF_Reg_Instr							   				  : std_logic_vector (31 downto 0) := (others => '0'); 
	-- DECSTAGE SIGNALS ---------------------------------------------------------------------------------------------------------------
	signal DEC_RS, DEC_RD,DEC_RT, DEC_RDRT 		 	   			   				  : std_logic_vector ( 4 downto 0) := (others => '0'); 
	signal DEC_Immed, DEC_RF_A, DEC_RF_B		   				   				  : std_logic_vector (31 downto 0) := (others => '0'); 
	------- DEC_Register SIGNALS ------------------------------------------------------------------------------------------------------
	signal DEC_Reg_RS, DEC_Reg_RD, DEC_Reg_RDRT									  : std_logic_vector ( 4 downto 0) := (others => '0');
	signal DEC_Reg_WB_1, DEC_Reg_WB_2											  : std_logic := '0';	
    signal DEC_Reg_M_1, DEC_Reg_M_2, DEC_Reg_M_3								  : std_logic := '0';	
    signal DEC_Reg_EX_1										 					  : std_logic_vector ( 3 downto 0) := (others => '0'); 
	signal DEC_Reg_EX_2						 									  : std_logic := '0';		
	signal DEC_Reg_PC_4, DEC_Reg_Immed, DEC_Reg_RF_A, DEC_Reg_RF_B, DEC_Write_Mux : std_logic_vector (31 downto 0) := (others => '0');
	-- EXSTAGE SIGNALS ----------------------------------------------------------------------------------------------------------------
	signal EX_ALU_Zero											   				  : std_logic := '0';
	signal EX_AdderRes_out, EX_ALU_out								   			  : std_logic_vector (31 downto 0) := (others => '0');
	------ EX_Register SIGNALS --------------------------------------------------------------------------------------------------------
	signal EX_Reg_RD								 	 						  : std_logic_vector ( 4 downto 0) := (others => '0');
	signal EX_Reg_WB_1, EX_Reg_WB_2, EX_Reg_M_1, EX_Reg_M_2, EX_Reg_M_3 		  : std_logic := '0';
	signal EX_Reg_AdderRes_out, EX_Reg_ALU_out, EX_Reg_RF_B 		   			  : std_logic_vector (31 downto 0) := (others => '0'); 
	-- MEMSTAGE SIGNALS ---------------------------------------------------------------------------------------------------------------
	signal MEM_MEMData_out											   			  : std_logic_vector (31 downto 0) := (others => '0');
	-- MEMSTAGE SIGNALS ---------------------------------------------------------------------------------------------------------------
	signal MEM_Reg_RD								 	 						  : std_logic_vector ( 4 downto 0) := (others => '0');
	signal MEM_Reg_WB_1, MEM_Reg_WB_2							   				  : std_logic := '0';
	signal MEM_Reg_MEMData_out, MEM_Reg_ALU_out                       			  : std_logic_vector (31 downto 0) := (others => '0');
	-- FORWARD UNIT SIGNALS -----------------------------------------------------------------------------------------------------------
	signal FU_UpMux, FU_DownMux													  : std_logic_vector (31 downto 0) := (others => '0');
	-- CONTROL MUX SIGNALS ------------------------------------------------------------------------------------------------------------
	signal Cntrl_RegWrite, Cntrl_MemtoReg										  : std_logic := '0';	
    signal Cntrl_PCSrc, Cntrl_MemByteOp, Cntrl_MemWrite							  : std_logic := '0';
	signal Cntrl_ALUSrc															  : std_logic := '0';
	signal Cntrl_ALU_func														  : std_logic_vector ( 3 downto 0) := (others => '0');
	signal Cntrl_RegDst															  : std_logic := '0';
	signal Cntrl_ImmExt_s								     		  			  : std_logic_vector ( 1 downto 0) := (others => '0');
	-- HAZARD UNIT SIGNALS ------------------------------------------------------------------------------------------------------------
	signal HU_IF_Reg_WrEn, HU_OUT, HU_PC_LdEn									  : std_logic := '0';											
	
	
-------------------------------------------------- Main Functions -------------------------------------------------                                                                                        
begin
----------------------------------------------------- IFSTAGE -----------------------------------------------------
	IF_module:IFSTAGE_PIPELINE
		port map ( Clk      	 => Clk,
				   Reset    	 => Rst,                   
				   PC_sel   	 => EX_Reg_M_1,	  	  	 -- PCSrc from EX Register, 
				   PC_LdEn  	 => HU_PC_LdEn,			 -- PC load enable from HazardUnit
				   PC_Immed 	 => EX_Reg_AdderRes_out, -- Adder result from EX Register
				   PC       	 => PC_out,
				   PC_4			 =>	IF_PC_4		      	 -- PC + 4 Signal to IF Register
		);
	
	IF_Reg:IF_REGISTER_PIPELINE 
		port map ( Clk 			 => Clk,
				   Rst 			 => Rst, 
				   WE  			 => HU_IF_Reg_WrEn,	  	 -- IF_Reg write enable from Hazard Unit
				   -- PC_4_Reg -------------------------------------------------------------------------------------
				   IF_Adder_IN   => IF_PC_4,		  	 -- PC + 4 Signal from IFSTAGE 
				   IF_Adder_OUT  => IF_Reg_PC_4,	  	 -- PC + 4 to DEC Register
				   -- Mem_Instr_Reg --------------------------------------------------------------------------------
				   MEM_Instr_IN  => Instruction_IN,	  	 -- Instruction from MEMORY
				   MEM_Instr_OUT => IF_Reg_Instr	  	 -- Instruction to DECSTAGE 
		);
		Instruction_OUT <= IF_Reg_Instr;
----------------------------------------------------- DECSTAGE -----------------------------------------------------
	DEC_module:DECSTAGE_PIPELINE
		port map ( Clk           => Clk,
				   Rst           => Rst,
				   RF_WrEn     	 => Mem_Reg_WB_1,	  	 -- RegWrite signal from MEM Register
				   RF_WrData_sel => Mem_Reg_WB_2,	  	 -- RF_WrData_Sel from MEM Register
				   RF_B_sel      => Cntrl_RegDst,      	 -- RegDst from Control Mux
				   RD_IN	     => MEM_Reg_RD,			 -- RD from MEM Register
				   immExt        => Cntrl_ImmExt_s,		 -- ImmExt_s from Control Mux
				   Instruction	 => IF_Reg_Instr,	  	 -- Instruction from IF Register
				   ALU_out		 => MEM_Reg_ALU_out,  	 -- ALU out from MEM Register
				   MEM_out 	     => MEM_Reg_MEMData_out, -- MEM Data out from MEM Register
				   RS_out		 => DEC_RS,			  	 -- RS to DEC Register and ForwardUnit
				   RD_out		 => DEC_RD,			  	 -- RD to DEC Register
				   RT_out		 => DEC_RT,              -- RT to Forward Unit  
				   Mux_RDRT_Out  => DEC_RDRT,	 	  	 -- RT to DEC Register
				   Immed 		 => DEC_Immed,	  	  	 -- Immed value to DEC register
				   RF_A			 => DEC_RF_A,	 	  	 -- RF_A to DEC register
				   RF_B			 => DEC_RF_B,		  	 -- RF_B to DEC register	
				   Mux_WrData    => DEC_Write_Mux		 -- Write_Mux to Forward Unit
		);
	
     	 
	DEC_Reg:DEC_REGISTER_PIPELINE 							 
		Port map ( Clk 	  		 => Clk,
				   Rst 	  		 => Rst,			
				   WE  	  		 => DEC_Reg_WrEn,	     -- DEC_Reg write enable from Control -------------------------------------------
				   -- WB_Reg ---------------------------------------------------------------------------------------
				   WB_1_IN  	 => Cntrl_RegWrite,	     -- RegWrite signal from Control Mux
				   WB_2_IN		 => Cntrl_MemtoReg,	     -- MemtoReg signal from Control Mux
				   WB_1_OUT  	 => DEC_Reg_WB_1, 	     -- RegWrite value to EX Register
				   WB_2_OUT	     => DEC_Reg_WB_2,        -- MemtoReg value to EX Register
				   -- M_Reg ----------------------------------------------------------------------------------------				   
				   M_1_IN		 => Cntrl_PCSrc,	     -- PCSrc signal from Control Mux
				   M_2_IN		 => Cntrl_MemByteOp,     -- MemByteOp signal from Control Mux
				   M_3_IN		 => Cntrl_MemWrite,	     -- MemWrite signal from Control Mux
				   M_1_OUT  	 => DEC_Reg_M_1,	     -- PCSrc to EX Register
				   M_2_OUT  	 => DEC_Reg_M_2,	     -- MemByteOp value to EX Register
				   M_3_OUT  	 => DEC_Reg_M_3,	     -- MemWrite value to EX Register
				   -- EX_Reg ---------------------------------------------------------------------------------------
				   EX_1_IN		 => Cntrl_ALU_func,		 -- ALU_func signal from Control Mux
				   EX_2_IN		 => Cntrl_ALUSrc,		 -- ALUSrc signal from Control Mux
				   EX_1_OUT		 => DEC_Reg_EX_1,	     -- ALU_func to EXSTAGE
				   EX_2_OUT 	 => DEC_Reg_EX_2,	     -- ALUSrc to EXSTAGE
				   -- PC_4_Reg -------------------------------------------------------------------------------------
				   Adder_IN 	 => IF_Reg_PC_4,	     -- PC+4 from IF Register
				   Adder_OUT 	 => DEC_Reg_PC_4,	     -- PC+4 to EXSTAGE
			       -- RF_A_Reg -------------------------------------------------------------------------------------
				   RF_A_IN 		 => DEC_RF_A,	 	     -- RF_A from DECSTAGE 				  
				   RF_A_OUT		 => DEC_Reg_RF_A, 	     -- RF_A to Forward Unit
			       -- RF_B_Reg -------------------------------------------------------------------------------------
				   RF_B_IN 		 => DEC_RF_B,	 	     -- RF_B from DECSTAGE
				   RF_B_OUT 	 => DEC_Reg_RF_B, 	     -- RF_B to Forward Unit and EX_Reg
			       -- Immed_Reg ------------------------------------------------------------------------------------
				   Immed_IN 	 => DEC_Immed,	 	     -- Immed from DECSTAGE
				   Immed_OUT  	 => DEC_Reg_Immed, 	     -- Immed to EXSTAGE
				   -- RS_Reg ---------------------------------------------------------------------------------------
				   RS_IN		 => DEC_RS,			     -- RS from DECSTAGE	
				   RS_OUT   	 => DEC_Reg_RS,		     -- RS to Forward Unit 
				   -- RD_Reg ---------------------------------------------------------------------------------------
				   RD_IN  		 => DEC_RD,			     -- RD from DECSTAGE
				   RD_OUT   	 => DEC_Reg_RD,		     -- RD to Forward Unit and EX Register
			       -- Mux_Reg --------------------------------------------------------------------------------------
				   Mux_IN 		 => DEC_RDRT,		     -- Mux from DECSTAGE
			       Mux_OUT		 => DEC_Reg_RDRT	     -- Mux to Forward Unit
		);
	
----------------------------------------------------- EXSTAGE -----------------------------------------------------
	EX_module:EXSTAGE_PIPELINE
		Port map ( PC_4 	    => DEC_Reg_PC_4,	     -- PC+4 value from DEC Register 
				   Immed  	    => DEC_Reg_Immed,	     -- Immed value from DEC Register
				   RF_A		    => FU_UpMux,	  	     -- Upper Forward Unit mux 
				   RF_B 	    => FU_DownMux,	  	     -- Down Forward Unit mux 
				   ALU_Bin_sel  => DEC_Reg_EX_2,	     -- ALUSrc from DEC Register		 
				   ALU_func     => DEC_Reg_EX_1, 	     -- ALU_func from DEC Register
				   Adder_out    => EX_AdderRes_out,	     -- Adder result to EX Register
				   ALU_out      => EX_ALU_out,		     -- ALU out to EX Register
				   ALU_zero	    => EX_ALU_Zero,		     -- ALU Zero to EX Register
				   ALU_cout	    => open,			     -- Useless
				   ALU_ovf 	    => open				     -- Useless	
		);
	
	EX_Reg:EX_REGISTER_PIPELINE
		Port map ( Clk 		    => Clk,
				   Rst 		    => Rst,
				   WE  		    => EX_Reg_WrEn,		  	 -- EX_Reg write enable from Control
				   -- WB_Reg ---------------------------------------------------------------------------------------
				   WB_1_IN 	    => DEC_Reg_WB_1, 	  	 -- RegWrite from DEC Register
				   WB_2_IN      => DEC_Reg_WB_2, 	  	 -- MemtoReg from DEC Register
				   WB_1_OUT     => EX_Reg_WB_1,		  	 -- RegWrite from MEM Register and Forward Unit
				   WB_2_OUT	    => EX_Reg_WB_2,		  	 -- MemtoReg from MEM Register
				   -- M_Reg ----------------------------------------------------------------------------------------		  
				   M_1_IN  	    => DEC_Reg_M_1,		  	 -- PCSrc from DEC Register
				   M_2_IN	    => DEC_Reg_M_2,		  	 -- MemByteOp value from DEC Register
				   M_3_IN	    => DEC_Reg_M_3,		  	 -- MemWrite value from DEC Register
				   M_1_OUT      => EX_Reg_M_1,		  	 -- PCSrc to IF Register
				   M_2_OUT      => EX_Reg_M_2,        	 -- MemByteOp value to MEM Register
				   M_3_OUT      => EX_Reg_M_3,        	 -- MemWrite value to MEM Register
				   -- Adder_Res_Reg --------------------------------------------------------------------------------
				   AdderRes_IN  => EX_AdderRes_OUT,	  	 -- Adder result from EXSTAGE 
		           AdderRes_OUT => EX_Reg_AdderRes_out,  -- Adder result to IFSTAGE 
				   -- ALU_Zero_Reg ---------------------------------------------------------------------------------
				   ALU_Zero_IN  => EX_ALU_Zero,		  	 -- ALU zero value from EXSTAGE
				   ALU_Zero_OUT => ALU_zero,		  	 -- Output to Control module
				   -- ALU_Res_Reg ----------------------------------------------------------------------------------
				   ALURes_IN    => EX_ALU_out,		  	 -- ALU_OUT from EXSTAGE
				   ALURes_Out   => EX_Reg_ALU_out,    	 -- ALU_OUT to MEMSTAGE and MEM Register and Forward Unit
				   -- RF_B_Reg -------------------------------------------------------------------------------------
				   RF_B_IN      => FU_DownMux, 			 -- Down mux from Forward Unit
				   RF_B_OUT     => EX_Reg_RF_B,		  	 -- RF_B to MEM Register
				   -- RD_Reg ---------------------------------------------------------------------------------------
				   RD_IN  		=> DEC_Reg_RD,			 -- RD from DECSTAGE
				   RD_OUT   	=> EX_Reg_RD		  	 -- RD to MEM Register and Forward Unit
		);
	  
----------------------------------------------------- MEMSTAGE -----------------------------------------------------
	MEM_module:MEMSTAGE
		Port map ( ByteOp         => EX_Reg_M_2, 	  	 -- MemByteOp from EX Register
				   Mem_WrEn	  	  => EX_Reg_M_3, 	  	 -- MemWrite from EX Register
				   ALU_MEM_Addr   => EX_Reg_ALU_OUT,  	 -- ALU result from EX Register
				   MEM_DataIn     => EX_Reg_RF_B, 		 -- RF_B from EX Register
				   MM_RdData      => MM_RdData, 	
				   MM_WrEn        => MM_WrEn,
				   MM_Addr        => MM_Addr,
				   MM_WrData      => MM_WrData,
				   MEM_DataOut    => MEM_MEMData_out 	  -- Data out to MEM_Reg
		);
		
	MEM_Reg:MEM_REGISTER_PIPELINE 
		Port map ( Clk 			 => Clk,
				   Rst 			 => Rst, 
				   WE  			 => Mem_Reg_WrEn,	  	 -- MEM_Reg write enable from Control
				   -- WB_Reg ---------------------------------------------------------------------------------------
				   WB_1_IN 	     => EX_Reg_WB_1, 	  	 -- RegWrite from EX Register
				   WB_2_IN       => EX_Reg_WB_2, 	  	 -- MemtoReg from EX Register
				   WB_1_OUT      => Mem_Reg_WB_1,	  	 -- RegWrite to DECSTAGE and Forward Unit
				   WB_2_OUT	     => Mem_Reg_WB_2,	  	 -- MemtoReg to DECSTAGE
				   -- MEM_OUT_Reg ----------------------------------------------------------------------------------
				   MEM_Data_IN   => MEM_MEMData_out,     -- MEM data out from MEMSTAGE
				   MEM_Data_OUT  => MEM_Reg_MEMData_out, -- MEM data out to DECSTAGE
				   -- ALU_out_Reg ----------------------------------------------------------------------------------
				   ALURes_IN	 => EX_Reg_ALU_out,   	 -- ALU out from EX Register
				   ALURes_Out    => MEM_Reg_ALU_out,     -- ALU out to DECSTAGE
				   -- RD_Reg ---------------------------------------------------------------------------------------
				   RD_IN  		 => EX_Reg_RD,			 -- RD from EX Register
				   RD_OUT   	 => MEM_Reg_RD		  	 -- RD to DECSTAGE and Forward Unit
		);
		
-------------------------------------------------------- HAZARD ----------------------------------------------------
	ForwardUnit:Forward_Unit
		Port map ( DEC_Reg_RS	     => DEC_Reg_RS,		 -- RS from DEC Register
				   DEC_Reg_RDRT	     => DEC_Reg_RDRT, 	 -- Mux from DEC Register 	
				   EX_Reg_RegWrite   => EX_Reg_WB_1,	 -- RegWrite from EX Register
				   EX_Reg_RD         => EX_Reg_RD,		 -- RD from EX Register
				   MEM_Reg_RegWrite  => Mem_Reg_WB_1,    -- RegWrite from MEM Register
				   MEM_Reg_RD	     => MEM_Reg_RD,		 -- RD from MEM Register
				   DEC_Reg_RF_A      => DEC_Reg_RF_A,	 -- RF_A from DEC Register
				   DEC_Reg_RF_B      => DEC_Reg_RF_B,	 -- RF_B from DEC Register 
  				   DEC_Reg_Write_Mux => DEC_Write_Mux,   -- Write Mux from DEC Register
				   EX_Reg_ALU_out    => EX_Reg_ALU_out,  -- ALU out from EX Register
				   FU_UpMux_OUT      => FU_UpMux,		 -- Up mux to EX stage
				   FU_DownMux_OUT    => FU_DownMux		 -- Down mux to EX stage
		);

	HazardUnit:Hazard_Unit
		Port map ( DEC_RS 			=> DEC_RS,			 -- RS from DECSTAGE
				   DEC_RT 			=> DEC_RT, 			 -- RT from DECSTAGE 
				   DEC_Reg_MemtoReg => DEC_Reg_WB_2,     -- MemtoReg from DEC Register
                   DEC_Reg_RDRT     => DEC_Reg_RDRT,     -- Mux from DEC Register          
				   IF_Reg_WrEn      => HU_IF_Reg_WrEn,   -- IF Register write enable
				   HUnit_OUT        => HU_OUT,			 -- HazardUnit flag to Control Mux
				   PC_LdEn          => HU_PC_LdEn        -- PC load enable to IFSTAGE 
		);
	
	Mux_Control:CONTROL_Mux
		Port map ( -- WB_Reg ---------------------------------------------------------
				   RegWrite_IN   => RegWrite,  			 -- RegWrite from Control
				   MemtoReg_IN   => MemtoReg,	         -- MemtoReg from Control
				   RegWrite_OUT  => Cntrl_RegWrite,      -- RegWrite to DEC Register 
				   MemtoReg_OUT  => Cntrl_MemtoReg,		 -- MemtoReg from DEC Register
				   -- M_Reg -----------------------------------------------------------
				   PCSrc_IN      => PCSrc,				 -- PCSrc from Control
 				   MemByteOp_IN  => MemByteOp,           -- MemByteOp from Control
				   MemWrite_IN   => MemWrite,            -- MemWrite from Control
				   PCSrc_OUT     => Cntrl_PCSrc,		 -- PCSrc to DEC Register
				   MemByteOp_OUT => Cntrl_MemByteOp,     -- MemByteOp to DEC Register 
				   MemWrite_OUT  => Cntrl_MemWrite, 	 -- MemWrite to DEC Register
				   -- EX_Reg ----------------------------------------------------------
				   ALUSrc_IN     => ALUSrc,				 -- ALUSrc from Control
		           ALU_func_IN	 => ALU_func, 			 -- ALU_func from Control
				   ALUSrc_OUT    => Cntrl_ALUSrc,		 -- ALUSrc to DEC Register
		           ALU_func_OUT	 => Cntrl_ALU_func, 	 -- ALU_func to DEC Register 
				   -- DEC module ------------------------------------------------------
				   RegDst_IN	 => RegDst,				 -- RegDst from Control
		           ImmExt_s_IN	 => ImmExt_s, 		     -- ImmExt_s from Control 
		           RegDst_OUT	 => Cntrl_RegDst, 		 -- RegDst to DEC Register 
		           ImmExt_s_OUT	 => Cntrl_ImmExt_s, 	 -- ImmExt_s DEC Register 
		           -- Mux Input/output ------------------------------------------------
		           DataSel 		 => HU_OUT				 -- HazardUnit from Hazard Unit
		);
				
end Behavioral;
