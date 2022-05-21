LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CONTROL_Mux_tb IS
END CONTROL_Mux_tb;
 
architecture behavior of CONTROL_Mux_tb is
  
    component CONTROL_Mux
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
    end component;
    

	--Inputs
	signal RegWrite_IN   : std_logic := '0';
	signal MemtoReg_IN   : std_logic := '0';
	signal PCSrc_IN      : std_logic := '0';
	signal MemByteOp_IN  : std_logic := '0';
	signal MemWrite_IN   : std_logic := '0';
	signal ALUSrc_IN     : std_logic := '0';
	signal ALU_func_IN   : std_logic_vector(3 downto 0) := (others => '0');
	signal RegDst_IN     : std_logic := '0';
	signal ImmExt_s_IN   : std_logic_vector(1 downto 0) := (others => '0');
	signal DataSel       : std_logic := '0';

	--Outputs
	signal RegWrite_OUT  : std_logic;
	signal MemtoReg_OUT  : std_logic;
	signal PCSrc_OUT     : std_logic;
	signal MemByteOp_OUT : std_logic;
	signal MemWrite_OUT  : std_logic;
	signal ALUSrc_OUT    : std_logic;
	signal ALU_func_OUT  : std_logic_vector(3 downto 0);
	signal RegDst_OUT    : std_logic;
	signal ImmExt_s_OUT  : std_logic_vector(1 downto 0);
   
begin
 
	uut: CONTROL_Mux 
		Port map ( RegWrite_IN   => RegWrite_IN,
				   MemtoReg_IN   => MemtoReg_IN,
				   RegWrite_OUT  => RegWrite_OUT,
				   MemtoReg_OUT  => MemtoReg_OUT,
				   PCSrc_IN 	 => PCSrc_IN,
				   MemByteOp_IN  => MemByteOp_IN,
				   MemWrite_IN   => MemWrite_IN,
				   PCSrc_OUT     => PCSrc_OUT,
				   MemByteOp_OUT => MemByteOp_OUT,
				   MemWrite_OUT  => MemWrite_OUT,
				   ALUSrc_IN     => ALUSrc_IN,
				   ALUSrc_OUT 	 => ALUSrc_OUT,
				   ALU_func_IN 	 => ALU_func_IN,
				   ALU_func_OUT  => ALU_func_OUT,
				   RegDst_IN 	 => RegDst_IN,
				   RegDst_OUT 	 => RegDst_OUT,
				   ImmExt_s_IN 	 => ImmExt_s_IN,
				   ImmExt_s_OUT  => ImmExt_s_OUT,
				   DataSel 		 => DataSel
		);

	-- Stimulus process
	stim_proc: process
	begin
---------------------------------------------------------------------------------------- 0ns
	-- Testing if the Mux works as intended
		-------------------------------------------------------------------------------- 0ns
		RegWrite_IN  <= '1';	-- Setting RegWrite equal to 1 for the following tests	
		MemtoReg_IN  <= '1';	-- Setting MemtoReg equal to 1 for the following tests	
		PCSrc_IN 	 <= '1';	-- Setting PCSrc equal to 1 for the following tests	
		MemByteOp_IN <= '1';	-- Setting MemByteOp equal to 1 for the following tests	
		MemWrite_IN  <= '1';	-- Setting MemWrite equal to 1 for the following tests	
		ALUSrc_IN	 <= '1';	-- Setting ALUSrc equal to 1 for the following tests	
		ALU_func_IN  <= "0010";	-- Setting ALU_func equal to 01 for the following tests
		RegDst_IN 	 <= '1';	-- Setting RegDst equal to 1 for the following tests	
		ImmExt_s_IN  <= "10"; 	-- Setting ImmExt_s equal to 1 for the following tests
		-------------------------------------------------------------------------------- 0ns
		Datasel <= '0'; 		-- Setting Datasel equal to 0
		wait for 100ns; 		-- Expecting outputs equal to inputs  
		-------------------------------------------------------------------------------- 100ns
		Datasel <= '1'; 		-- Setting Datasel equal to 1
		wait for 100ns; 		-- Expecting outputs equal to 0
		-------------------------------------------------------------------------------- 200ns
		RegWrite_IN  <= '1';	-- Setting RegWrite equal to 1 for the following tests	
		MemtoReg_IN  <= '1';	-- Setting MemtoReg equal to 1 for the following tests	
		PCSrc_IN 	 <= '1';	-- Setting PCSrc equal to 1 for the following tests	
		MemByteOp_IN <= '1';	-- Setting MemByteOp equal to 1 for the following tests	
		MemWrite_IN  <= '1';	-- Setting MemWrite equal to 1 for the following tests	
		ALUSrc_IN	 <= '1';	-- Setting ALUSrc equal to 1 for the following tests	
		ALU_func_IN  <= "0110";	-- Setting ALU_func equal to 01 for the following tests
		RegDst_IN 	 <= '1';	-- Setting RegDst equal to 1 for the following tests	
		ImmExt_s_IN  <= "10"; 	-- Setting ImmExt_s equal to 1 for the following tests
		-------------------------------------------------------------------------------- 300ns
		Datasel <= '0'; 		-- Setting Datasel equal to 0
		wait for 100ns; 		-- Expecting outputs equal to inputs  
		-------------------------------------------------------------------------------- 400ns
		wait;
	end process;

end;
