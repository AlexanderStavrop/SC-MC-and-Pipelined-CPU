library ieee;
use ieee.std_logic_1164.ALL;

entity CONTROL_Mux is
	Port ( -- WB_Reg ----------------------------------------------------------
		   RegWrite_IN, MemtoReg_IN 		      : in  std_logic;		
		   RegWrite_OUT, MemtoReg_OUT 		   	  : out  std_logic;		
		   -- M_Reg -----------------------------------------------------------
		   PCSrc_IN, MemByteOp_IN, MemWrite_IN    : in  std_logic;
		   PCSrc_OUT, MemByteOp_OUT, MemWrite_OUT : out  std_logic;
		   -- EX_Reg ----------------------------------------------------------
		   ALUSrc_IN    					   	  : in  std_logic;
		   ALUSrc_OUT    					      : out  std_logic;
		   ALU_func_IN						      : in  std_logic_vector ( 3 downto 0);
		   ALU_func_OUT						      : out  std_logic_vector ( 3 downto 0);
		   -- DEC module ------------------------------------------------------
		   RegDst_IN						      : in  std_logic;
		   RegDst_OUT						      : out  std_logic;
		   ImmExt_s_IN						      : in  std_logic_vector ( 1 downto 0);
		   ImmExt_s_OUT						      : out  std_logic_vector ( 1 downto 0);
		   -- Mux Input/output ------------------------------------------------
		   DataSel 						          : in  std_logic
	);
end CONTROL_Mux;

architecture Behavioral of CONTROL_Mux is

	-- Needed signals
	signal IN_RegWrite, IN_MemtoReg  		   : std_logic := '0';
	signal IN_PCSrc, IN_MemByteOp, IN_MemWrite : std_logic := '0';
	signal IN_ALUSrc 			   			   : std_logic := '0';
	signal IN_RegDst 						   : std_logic := '0';
	signal IN_ImmExt_s 						   : std_logic_vector (1 downto 0) := (others => '0');
	signal IN_ALU_func						   : std_logic_vector (3 downto 0) := (others => '0');	
	
	
	
begin
	----------------------------------------------
	with DataSel select 
		IN_RegWrite <= RegWrite_IN  when '0',
					   '0'  	  	when '1',
					   '0' 		    when others;
	RegWrite_OUT <= IN_RegWrite  after 10ns;
	----------------------------------------------
	with DataSel select 
		IN_MemtoReg <= MemtoReg_IN  when '0',
					   '0'  	  	when '1',
					   '0' 		  	when others;
	MemtoReg_OUT <= IN_MemtoReg  after 10ns;				     
	----------------------------------------------
	with DataSel select 
		IN_PCSrc <= PCSrc_IN  when '0',
					'0'    	  when '1',
					'0' 	  when others;
	PCSrc_OUT <= IN_PCSrc  after 10ns;
	----------------------------------------------
	with DataSel select 
		IN_MemByteOp <= MemByteOp_IN when '0',
					    '0'  	     when '1',
					    '0' 		 when others;
	MemByteOp_OUT <= IN_MemByteOp after 10ns;
	----------------------------------------------
	with DataSel select 
		IN_MemWrite  <= MemWrite_IN  when '0',
					    '0'  	  	 when '1',
					    '0' 		 when others;
	MemWrite_OUT <= IN_MemWrite  after 10ns;
	----------------------------------------------
	with DataSel select 
		IN_ALUSrc <= ALUSrc_IN when '0',
					 '0'  	   when '1',
					 '0' 	   when others;
	ALUSrc_OUT <= IN_ALUSrc after 10ns;    					   
	----------------------------------------------
	with DataSel select 
		IN_RegDst <= RegDst_IN when '0',
					 '0'  	   when '1',
					 '0' 	   when others;
	RegDst_OUT <= IN_RegDst after 10ns;
	----------------------------------------------
	with DataSel select 
		IN_ImmExt_s <= ImmExt_s_IN when '0',
					   "00"  	   when '1',
					   "00" 	   when others;
	ImmExt_s_OUT <= IN_ImmExt_s after 10ns;
	----------------------------------------------
	with DataSel select 
		IN_ALU_func <= ALU_func_IN   when '0',
					   "0000"  	  	 when '1',
					   "0000"     	 when others;
	ALU_func_OUT <= IN_ALU_func after 10ns;
	----------------------------------------------
end Behavioral;
