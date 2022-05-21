library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PROCESSOR_PIPELINE is
	port (Clk, Reset : in std_logic);
end PROCESSOR_PIPELINE;

architecture Behavioral of PROCESSOR_PIPELINE is
	------------------- COMPONENTS --------------------------------------------------------------------
	component CONTROL_PIPELINE is
		Port ( ALU_zero 				  			  : in  std_logic;
			   Instruction				  			  : in  std_logic_vector(31 downto 0);
			   -- IFSTAGE INPUTS/OUTPUTS ---------------------------------------------
			   PCSrc	                  			  : out std_logic;
			   -- DECSTAGE INPUTS ----------------------------------------------------
			   MemtoReg, RegDst, RegWrite 			  : out std_logic;
			   ImmExt_s			 		  			  : out std_logic_vector ( 1 downto 0);  
			   -- EXSTAGE INPUTS -----------------------------------------------------	
			   ALUSrc		 			  			  : out std_logic;	
			   ALU_func			 		  			  : out std_logic_vector ( 3 downto 0);
			   -- MEMSTAGE INPUTS/OUTPUTS --------------------------------------------
			   MemByteOp, Mem_Write					  : out std_logic;
		       -- REGISTER INPUTS ---------------------------------------------------
		       DEC_Reg_WrEn,EX_Reg_WrEn, Mem_Reg_WrEn : out std_logic
		);
	end component;
	
	component DATAPATH_PIPELINE is
		Port ( Clk, Rst   		 		    	 	  : in  std_logic;
			   -- IFSTAGE INPUTS/OUTPUTS ------------------------------------------
			   PCSrc   		     			 		  : in  std_logic;
		       PC_out			 		     		  : out std_logic_vector (31 downto 0);
		       -- DECSTAGE INPUTS -------------------------------------------------
		       RegDst, RegWrite, MemtoReg    		  : in  std_logic;	
		       ImmExt_s			 		     		  : in  std_logic_vector ( 1 downto 0);  
			   Instruction_IN 			     		  : in  std_logic_vector (31 downto 0);
		       Instruction_OUT			     		  : out std_logic_vector (31 downto 0);
		       ------ DEC_Reg INPUTS ----------------------------------------------
		       DEC_Reg_WrEn				     		  : in  std_logic;
		       -- EXSTAGE INPUTS --------------------------------------------------
		       ALUSrc 					     		  : in  std_logic;	
		       ALU_func			 		     		  : in  std_logic_vector ( 3 downto 0);
		       ALU_zero, ALU_cout, ALU_ovf   		  : out std_logic;
		       ------ EX_Reg INPUTS -----------------------------------------------
		       EX_Reg_WrEn				     		  : in  std_logic;	
		       -- MEMSTAGE INPUTS/OUTPUTS -----------------------------------------
		       MemByteOp, MemWrite 		  			  : in  std_logic;
		       MM_RdData 		 		     		  : in  std_logic_vector (31 downto 0);
		       MM_WrEn			 		     		  : out std_logic;
		       MM_Addr, MM_WrData 	  	     		  : out std_logic_vector (31 downto 0);			  
   		       ------ MEM_Reg INPUTS ----------------------------------------------
		       Mem_Reg_WrEn	  						  : in std_logic		  
		);
	end component;
	
	component RAM is
		 port ( clk, data_we 		  				  : in  std_logic;
				inst_addr, data_addr 				  : in  std_logic_vector(10 downto 0);
				data_din 				  			  : in  std_logic_vector(31 downto 0);
				inst_dout				  			  : out std_logic_vector(31 downto 0);
				data_dout 			  				  : out std_logic_vector(31 downto 0)
		);
	end component; 
	
	
	-- Needed signals
	-- IFSTAGE -----------------------------------------------------------------------------------------------------
	signal IN_PCSrc		    		 			     		: std_logic := '0';
	signal IN_PC_out, IF_Reg_Instr							: std_logic_vector (31 downto 0) := (others => '0');
	-- DECSTAGE ----------------------------------------------------------------------------------------------------
	signal IN_RF_MemtoReg, IN_RF_RegDst, IN_RF_RegWrite 	: std_logic := '0';
	-- EXSTAGE -----------------------------------------------------------------------------------------------------
	signal IN_ALU_ALUSrc, IN_ALU_zero				 		: std_logic := '0';
	signal IN_ImmExt_s			    				 		: std_logic_vector ( 1 downto 0) := (others => '0');
	signal IN_ALU_func 								 	    : std_logic_vector ( 3 downto 0) := (others => '0');
	-- MEMSTAGE ----------------------------------------------------------------------------------------------------
	signal IN_MemByteOp, IN_MemWrite, IN_MM_WrEn 			: std_logic := '0';
	signal IN_Instruction, IN_MM_Addr, IN_MM_WrData	 	    : std_logic_vector (31 downto 0) := (others => '0');
	-- Ram ---------------------------------------------------------------------------------------------------------
	signal IN_MM_RdData                              	    : std_logic_vector (31 downto 0) := (others => '0');
	-- REGISTERS ---------------------------------------------------------------------------------------------------
	signal IN_DEC_Reg_WrEn, IN_EX_Reg_WrEn, IN_Mem_Reg_WrEn : std_logic := '0';
-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        
begin
----------------------------------------------------- Control ------------------------------------------------------
	Control_module:CONTROL_PIPELINE
		port map ( ALU_zero     => IN_ALU_zero,
		           Instruction  => IF_Reg_Instr, 
			       PCSrc	    => IN_PCSrc, 
				   MemtoReg     => IN_RF_MemtoReg,
				   RegDst       => IN_RF_RegDst,
				   RegWrite     => IN_RF_RegWrite,
				   ImmExt_s	    => IN_ImmExt_s,  
				   ALUSrc	    => IN_ALU_ALUSrc,
			       ALU_func	    => IN_ALU_func,
				   MemByteOp    => IN_MemByteOp, 
				   Mem_Write	=> IN_MemWrite,
				   DEC_Reg_WrEn => IN_DEC_Reg_WrEn,
				   EX_Reg_WrEn  => IN_EX_Reg_WrEn,
				   Mem_Reg_WrEn => IN_Mem_Reg_WrEn
		);		

----------------------------------------------------- Datapath ------------------------------------------------------
	Datapath_module:DATAPATH_PIPELINE
		port map ( Clk 	           => Clk,
				   Rst             => Reset,
				   PCSrc           => IN_PCSrc,
				   PC_out          => IN_PC_out,
				   RegDst          => IN_RF_RegDst, 
				   RegWrite        => IN_RF_RegWrite, 
				   MemtoReg        => IN_RF_MemtoReg, 
				   ImmExt_s	       => IN_ImmExt_s,  
				   Instruction_IN  => IN_Instruction, 
				   Instruction_OUT => IF_Reg_Instr, 
				   DEC_Reg_WrEn    => IN_DEC_Reg_WrEn,
				   ALUSrc 		   => IN_ALU_ALUSrc,
				   ALU_func		   => IN_ALU_func, 
				   ALU_zero        => IN_ALU_zero, 
				   ALU_cout        => open,
				   ALU_ovf         => open,
				   EX_Reg_WrEn	   => IN_EX_Reg_WrEn,
				   MemByteOp       => IN_MemByteOp,
				   MemWrite 	   => IN_MemWrite,
				   MM_RdData 	   => IN_MM_RdData,
				   MM_WrEn		   => IN_MM_WrEn,
				   MM_Addr         => IN_MM_Addr,
				   MM_WrData 	   => IN_MM_WrData,
				   Mem_Reg_WrEn    => IN_Mem_Reg_WrEn
		);
	 
-------------------------------------------------------- Ram --------------------------------------------------------
	Ram_module:Ram
		port map ( clk       	 => Clk,
				   data_we   	 => IN_MM_WrEn,
				   inst_addr 	 => IN_PC_out(12 downto 2),
				   data_addr	 => IN_MM_Addr(10 downto 0),
				   data_din  	 => IN_MM_WrData,
				   inst_dout 	 => IN_Instruction,
				   data_dout 	 => IN_MM_RdData 
		);

end Behavioral;

