library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DATAPATH_MC is
	Port ( Clk, Rst   		 									  : in  std_logic;
		   -- IFSTAGE INPUTS/OUTPUTS ---------------------------------------------
		   PC_sel, PC_LdEn, IR_WrEn								  : in  std_logic;
		   PC_out												  : out std_logic_vector (31 downto 0);
		   -- DECSTAGE INPUTS ----------------------------------------------------
		   RF_WrData_sel, RF_B_sel, RF_WrEn, RegA_WrEn, RegB_WrEn : in  std_logic;
		   ImmExt_s			 									  : in  std_logic_vector ( 1 downto 0);  
		   Instruction 											  : in  std_logic_vector (31 downto 0);
		   -- EXSTAGE INPUTS -----------------------------------------------------	
		   ALU_Bin_sel, RegAlu_WrEn							      : in  std_logic;	
		   ALU_func			 									  : in  std_logic_vector ( 3 downto 0);
		   ALU_zero, ALU_cout, ALU_ovf							  : out std_logic;
		   -- MEMSTAGE INPUTS/OUTPUTS --------------------------------------------
		   ByteOp, Mem_WrEn, RegMem_WrEn						  : in  std_logic;
		   MM_RdData 		 									  : in  std_logic_vector (31 downto 0);
		   MM_WrEn			 									  : out std_logic;
		   MM_Addr, MM_WrData 	  								  : out std_logic_vector (31 downto 0)			  
	);
end DATAPATH_MC;

architecture Behavioral of DATAPATH_MC is
	
------------------- COMPONENTS --------------------------------------------------------------------
	component IFSTAGE is
		port ( Reset, Clk, PC_sel, PC_LdEn 				  : in  std_logic;
			   PC_Immed         			  			  : in  std_logic_vector(31 downto 0);
			   PC               			  			  : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component DECSTAGE is
		Port ( RF_WrEn, RF_WrData_sel, RF_B_sel, Clk, Rst : in  std_logic;
			   immExt									  : in  std_logic_vector (1 downto 0);
			   Instr, ALU_out, MEM_out 			      	  : in  std_logic_vector (31 downto 0);
			   Immed, RF_A, RF_B 						  : out std_logic_vector (31 downto 0) 
		);
	end component;

	component EXSTAGE is
		Port ( RF_A, RF_B, Immed 			  		      : in  std_logic_vector (31 downto 0);
			   ALU_Bin_sel  	    			  		  : in  std_logic;
               ALU_func 			 			  		  : in  std_logic_vector (3 downto 0);
               ALU_out 			 			  			  : out std_logic_vector (31 downto 0);
               ALU_zero, ALU_cout, ALU_ovf 				  : out std_logic
		);
	end component;

	component MEMSTAGE is
		Port ( ByteOp, Mem_WrEn					 	  	  : in  std_logic;
               ALU_MEM_Addr, MEM_DataIn, MM_RdData 	      : in  std_logic_vector (31 downto 0);
               MM_WrEn 								  	  : out std_logic;
			   MM_Addr, MM_WrData, MEM_DataOut	  	  	  : out std_logic_vector (31 downto 0)
		 );
	end component;
	
	component Register32 is
		port( CLK, RST, WE								  : in  std_logic;
			  DataIn      								  : in  std_logic_vector (31 downto 0);
			  DataOut     								  : out std_logic_vector (31 downto 0)
		);
	end component;

-- Needed signals
	-- DECSTAGE SIGNAL -------------------------------------------------------------------------------------------------
	signal busA, busA_Reg, busB, busB_Reg, IN_IMMED_OUT, instr_Reg  : std_logic_vector (31 downto 0) := (others => '0');
	-- EXSTAGE SIGNAL --------------------------------------------------------------------------------------------------	
	signal IN_ALU_out, ALU_out_Reg		  			    			: std_logic_vector (31 downto 0) := (others => '0');	
	-- MEMSTAGE SIGNAL -------------------------------------------------------------------------------------------------
	signal IN_MEM_out, MEM_out_Reg		  							: std_logic_vector (31 downto 0) := (others => '0'); 	  


-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        
begin
----------------------------------------------------- IFSTAGE ------------------------------------------------------
	IF_module:IFSTAGE
		port map ( PC_sel   	 => PC_sel, 
				   PC_LdEn  	 => PC_LdEn,
				   PC_Immed 	 => IN_IMMED_OUT,
				   Reset    	 => Rst,
				   Clk      	 => Clk,                   
				   PC       	 => PC_out                  
		);
	
	Instruction_Reg:Register32 
		port map ( CLK     	  	 => Clk,
				   RST     		 => Rst,
				   WE  	   	  	 => IR_WrEn,
				   DataIn  		 => Instruction,
				   DataOut 		 => instr_Reg
		);
----------------------------------------------------- DECSTAGE ------------------------------------------------------
	DEC_module:DECSTAGE
		port map ( RF_WrEn     	 => RF_WrEn, 
				   RF_WrData_sel => RF_WrData_sel,
				   RF_B_sel      => RF_B_sel,               
				   immExt        => ImmExt_s,
				   Instr 		 => instr_Reg, 			-- Instruction,
				   Clk           => Clk,
				   Rst           => Rst,    
				   ALU_out		 => ALU_out_Reg,			-- IN_ALU_out,
				   MEM_out 	     => MEM_out_Reg, 		-- IN_MEM_out,
				   Immed 		 => IN_IMMED_out,
				   RF_A			 => busA,
				   RF_B			 => busB					
		);
	
	RegA:Register32 
		port map ( CLK     	  	 => Clk,
				   RST     		 => Rst,
				   WE  	   	  	 => RegA_WrEn,
				   DataIn  		 => busA,
				   DataOut 		 => busA_Reg				
		);	
	
	RegB:Register32 
		port map ( CLK     	  	 => Clk,
				   RST     		 => Rst,
				   WE  	   	  	 => RegB_WrEn,
				   DataIn  		 => busB,
				   DataOut 		 => busB_Reg				
		);	
		
----------------------------------------------------- EXSTAGE ------------------------------------------------------
	EX_module:EXSTAGE
		Port map ( RF_A        	 => busA_Reg,			--busA, 
				   RF_B          => busB_Reg,    	--busB,
				   Immed		 => IN_IMMED_out,
				   ALU_Bin_sel   => ALU_Bin_sel,
				   ALU_func	     => ALU_func, 
				   ALU_out	     => IN_ALU_out,
				   ALU_zero      => ALU_zero,
				   ALU_cout	     => ALU_cout,
				   ALU_ovf       => ALU_ovf
		);
		
	
	ALUOut_Reg:Register32 
		port map ( CLK     	  	 => Clk,
				   RST     		 => Rst,
				   WE  	   	  	 => RegAlu_WrEn,
				   DataIn  		 => IN_ALU_out,
				   DataOut 		 => ALU_out_Reg				
		);
----------------------------------------------------- MEMSTAGE -----------------------------------------------------
	MEM_module:MEMSTAGE
		Port map( ByteOp       	 => ByteOp,
				  Mem_WrEn	  	 => Mem_WrEn,
				  ALU_MEM_Addr   => ALU_out_Reg, 	-- IN_ALU_out,
				  MEM_DataIn     => busB_Reg, 		-- busB,
				  MM_RdData      => MM_RdData, 
				  MM_WrEn        => MM_WrEn,
				  MM_Addr        => MM_Addr,
				  MM_WrData      => MM_WrData,
				  MEM_DataOut    => IN_MEM_out 		
		);
	
	MEMOut_Reg:Register32 
		port map ( CLK     	  	 => Clk,
				   RST     		 => Rst,
				   WE  	   	  	 => RegMem_WrEn,
				   DataIn  		 => IN_MEM_out,
				   DataOut 		 => MEM_out_Reg				
		);
	
	
end Behavioral;
