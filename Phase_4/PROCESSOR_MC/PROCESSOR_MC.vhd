library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PROCESSOR_MC is
	port ( Clk, Reset			  : in  std_logic;
		   MM_RdData 			  : in  std_logic_vector (31 downto 0);
		   Instruction 			  : in  std_logic_vector (31 downto 0);
		   MM_WrEn			  	  : out std_logic;
		   PC, MM_Addr, MM_WrData : out std_logic_vector (31 downto 0)
	);
end PROCESSOR_MC;

architecture Behavioral of PROCESSOR_MC is
	------------------- COMPONENTS -------------------------------------------------------------------------
	component CONTROL_MC is
		Port ( Clk, Reset											  : in  std_logic;
			   ALU_zero 									  		  : in  std_logic;
		       Instruction											  : in  std_logic_vector(31 downto 0);
		       -- IFSTAGE INPUTS/OUTPUTS -------------------------------------------------------------------
			   PC_sel, PC_LdEn, IR_WrEn  							  : out std_logic;
			   -- DECSTAGE INPUTS --------------------------------------------------------------------------
			   RF_WrData_sel, RF_B_sel, RF_WrEn, RF_A_WrEn, RF_B_WrEn : out std_logic;
			   ImmExt_s			 									  : out std_logic_vector ( 1 downto 0);  
			   -- EXSTAGE INPUTS ---------------------------------------------------------------------------	
			   ALU_Bin_sel, ALUOut_Reg_WrEn	 						  : out std_logic;	
			   ALU_func			 									  : out std_logic_vector ( 3 downto 0);
			   -- MEMSTAGE INPUTS/OUTPUTS ------------------------------------------------------------------
			   ByteOp, Mem_WrEn, Mem_Reg_WrEn  						  : out std_logic
		);
	end component;
	
	component DATAPATH_MC is
		Port ( Clk, Rst   		 									  : in  std_logic;
			   -- IFSTAGE INPUTS/OUTPUTS -------------------------------------------------------------------
			   PC_sel, PC_LdEn, IR_WrEn								  : in  std_logic;
			   PC_out												  : out std_logic_vector (31 downto 0);
			   -- DECSTAGE INPUTS --------------------------------------------------------------------------
			   RF_WrData_sel, RF_B_sel, RF_WrEn, RF_A_WrEn, RF_B_WrEn : in  std_logic;
			   ImmExt_s			 									  : in  std_logic_vector ( 1 downto 0);  
			   Instruction 											  : in  std_logic_vector (31 downto 0);
			   -- EXSTAGE INPUTS ---------------------------------------------------------------------------	
			   ALU_Bin_sel, ALUOut_Reg_WrEn						      : in  std_logic;	
			   ALU_func			 									  : in  std_logic_vector ( 3 downto 0);
			   ALU_zero, ALU_cout, ALU_ovf							  : out std_logic;
			   -- MEMSTAGE INPUTS/OUTPUTS ------------------------------------------------------------------
			   ByteOp, Mem_WrEn, Mem_Reg_WrEn						  : in  std_logic;
			   MM_RdData 		 									  : in  std_logic_vector (31 downto 0);
			   MM_WrEn			 									  : out std_logic;
			   MM_Addr, MM_WrData 	  								  : out std_logic_vector (31 downto 0)			  
		);
	end component;
	
	
	-- Needed signals
	-- IFSTAGE ---------------------------------------------------------------------------------------------------------------------
	signal IN_PC_sel, IN_PC_LdEn 		 			 			 							 : std_logic := '0';
	signal IN_PC_out								 			 							 : std_logic_vector (31 downto 0) := (others => '0');
	-- DECSTAGE --------------------------------------------------------------------------------------------------------------------
	signal IN_RF_WrData_sel, IN_RF_B_sel, IN_RF_WrEn, IN_IR_WrEn, IN_RF_A_WrEn, IN_RF_B_WrEn : std_logic := '0';
	signal IN_ImmExt_s			    				 			 							 : std_logic_vector ( 1 downto 0) := (others => '0');
	-- EXSTAGE ---------------------------------------------------------------------------------------------------------------------
	signal IN_ALU_Bin_sel, IN_ALU_zero, IN_ALUOut_Reg_WrEn 		 							 : std_logic := '0';
	signal IN_ALU_func 								 			 							 : std_logic_vector ( 3 downto 0) := (others => '0');
	-- MEMSTAGE --------------------------------------------------------------------------------------------------------------------
	signal IN_ByteOp, IN_Mem_WrEn,IN_Mem_Reg_WrEn							     			 : std_logic := '0';


-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        
begin
----------------------------------------------------- Control ------------------------------------------------------
	Control_module:CONTROL_MC
		port map ( Clk 		       => Clk,
				   Reset           => Reset,
				   ALU_zero 	   => IN_ALU_zero,
				   Instruction	   => Instruction,
				   PC_sel          => IN_PC_sel, 
				   PC_LdEn         => IN_PC_LdEn,
				   IR_WrEn         => IN_IR_WrEn,
				   RF_WrData_sel   => IN_RF_WrData_sel,
				   RF_B_sel        => IN_RF_B_sel,
				   RF_WrEn         => IN_RF_WrEn,
				   RF_A_WrEn	   => IN_RF_A_WrEn,
				   RF_B_WrEn       => IN_RF_B_WrEn,
				   ImmExt_s        => IN_ImmExt_s,
				   ALU_Bin_sel     => IN_ALU_Bin_sel,
				   ALU_func        => IN_ALU_func,
				   ALUOut_Reg_WrEn => IN_ALUOut_Reg_WrEn,
				   ByteOp          => IN_ByteOp,
				   Mem_WrEn        => IN_Mem_WrEn,
				   Mem_Reg_WrEn    => IN_Mem_Reg_WrEn
		);

----------------------------------------------------- Datapath ------------------------------------------------------
	Datapath_module:DATAPATH_MC
		port map ( Clk     		   => Clk,
				   Rst     		   => Reset,
				   PC_sel  		   => IN_PC_sel,
				   PC_LdEn 		   => IN_PC_LdEn,
				   PC_out	 	   => PC,
				   IR_WrEn         => IN_IR_WrEn,
				   RF_WrData_sel   => IN_RF_WrData_sel, 
				   RF_B_sel		   => IN_RF_B_sel,
				   RF_WrEn  	   => IN_RF_WrEn, 
				   ImmExt_s        => IN_ImmExt_s,
				   RF_A_WrEn       => IN_RF_A_WrEn,
				   RF_B_WrEn       => IN_RF_B_WrEn,
				   Instruction     => Instruction,
				   ALU_Bin_sel     => IN_ALU_Bin_sel,
				   ALU_func        => IN_ALU_func,
				   ALUOut_Reg_WrEn => IN_ALUOut_Reg_WrEn,
				   ALU_zero        => IN_ALU_zero,
				   ALU_cout        => open,
				   ALU_ovf         => open,
				   ByteOp          => IN_ByteOp, 
				   Mem_WrEn        => IN_Mem_WrEn,
				   MM_RdData       => MM_RdData,
				   MM_WrEn         => MM_WrEn,
				   MM_Addr         => MM_Addr,
				   MM_WrData       => MM_WrData,
				   Mem_Reg_WrEn    => IN_Mem_Reg_WrEn
		);


end Behavioral;

