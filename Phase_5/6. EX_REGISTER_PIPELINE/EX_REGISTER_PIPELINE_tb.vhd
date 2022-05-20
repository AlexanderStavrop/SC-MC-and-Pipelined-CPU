LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY EX_REGISTER_PIPELINE_tb IS
END EX_REGISTER_PIPELINE_tb;
 
architecture behavior of EX_REGISTER_PIPELINE_tb is
  
    component EX_REGISTER_PIPELINE
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
    end component;
    

	--Inputs
	signal Clk 			: std_logic := '0';
	signal Rst 			: std_logic := '0';
	signal WE 			: std_logic := '0';
	signal WB_1_IN 		: std_logic := '0';
	signal WB_2_IN 		: std_logic := '0';
	signal M_1_IN 		: std_logic := '0';
	signal M_2_IN 		: std_logic := '0';
	signal M_3_IN 	    : std_logic := '0';
	signal AdderRes_IN  : std_logic_vector(31 downto 0) := (others => '0');
	signal ALU_Zero_IN  : std_logic := '0';
	signal ALURes_IN 	: std_logic_vector(31 downto 0) := (others => '0');
	signal RF_B_IN 		: std_logic_vector(31 downto 0) := (others => '0');
	signal RD_IN 		: std_logic_vector(4 downto 0) := (others => '0');

	--Outputs
	signal WB_1_OUT 	: std_logic;
	signal WB_2_OUT 	: std_logic;
	signal M_1_OUT 		: std_logic;
	signal M_2_OUT 		: std_logic;
	signal M_3_OUT 	    : std_logic;
	signal AdderRes_OUT : std_logic_vector(31 downto 0);
	signal ALU_Zero_OUT : std_logic;
	signal ALURes_Out   : std_logic_vector(31 downto 0);
	signal RF_B_OUT 	: std_logic_vector(31 downto 0);
	signal RD_OUT 		: std_logic_vector(4 downto 0);
	
	-- Clock period definitions
	constant Clk_period  : time := 100 ns;
	signal stop_the_clock: boolean;
 
begin
 
	uut: EX_REGISTER_PIPELINE 
		Port map ( Clk 			=> Clk,
				   Rst 			=> Rst,
				   WE 			=> WE,
				   WB_1_IN 		=> WB_1_IN,
				   WB_2_IN 		=> WB_2_IN,
				   WB_1_OUT 	=> WB_1_OUT,
				   WB_2_OUT 	=> WB_2_OUT,
				   M_1_IN 		=> M_1_IN,
				   M_2_IN 		=> M_2_IN,
				   M_3_IN 		=> M_3_IN,
			       M_1_OUT 		=> M_1_OUT,
			       M_2_OUT 		=> M_2_OUT,
				   M_3_OUT 		=> M_3_OUT,
				   AdderRes_IN  => AdderRes_IN,
			       AdderRes_OUT => AdderRes_OUT,
				   ALU_Zero_IN  => ALU_Zero_IN,
			       ALU_Zero_OUT => ALU_Zero_OUT,
				   ALURes_IN    => ALURes_IN,
				   ALURes_Out   => ALURes_Out,
				   RF_B_IN 	    => RF_B_IN,
				   RF_B_OUT 	=> RF_B_OUT,
				   RD_IN 		=> RD_IN,
				   RD_OUT 		=> RD_OUT
		);

	-- Clock process definitions
	clocking: process
		begin
			while not stop_the_clock loop
				Clk <= '0', '1' after Clk_period / 2;
				wait for Clk_period;
			end loop;
			wait;
	end process;
  

	-- Stimulus process
	stim_proc: process
	begin		
----------------------------------------------------------------------------------------------------------------------------------
	-- Holding reset for 2 Clk periods
		-------------------------------------------------------------------------------------------------------------------------- 0ns
		Rst 	 <= '1';								-- Setting the Reset on
		wait for Clk_period*2;
		-------------------------------------------------------------------------------------------------------------------------- 200ns
		Rst 	 <= '0';								-- Setting the Reset off
		
----------------------------------------------------------------------------------------------------------------------------------
	-- Checking if write enable works correctly.
		-------------------------------------------------------------------------------------------------------------------------- 200ns
		RST 	 	<= '0';								-- Reset will be set to 0 for the following tests
		WE  	 	<= '0';								-- Write enable will be set to 0 for the following tests
		-------------------------------------------------------------------------------------------------------------------------- 200ns
		WB_1_IN  	<= '1'; 								-- Setting WB_1 input equal to 1
		WB_2_IN  	<= '1'; 								-- Setting WB_2 input equal to 1
		M_1_IN   	<= '1'; 								-- Setting M_1 input equal to 1
		M_2_IN   	<= '1'; 								-- Setting M_2 input equal to 1
		M_3_IN   	<= '1'; 								-- Setting M_3 input equal to 1
		AdderRes_IN <= "00000000000000000000000000000011"; 	-- Setting adder result input equal to 3
		ALU_Zero_IN <= '1';					 				-- Setting ALUZero input equal to 1
		ALURes_IN	<= "00000000000000000000000000000111";	-- Setting ALURes input equal to 7
		RF_B_IN	 	<= "00000000000000000000000000001000";	-- Setting RF_B input equal to 8
		RD_IN   	<= "01001";								-- Setting RD input equal to 9
      	wait for Clk_period;						  		-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 300ns
		WB_1_IN  <= '0'; 									-- Setting WB_1 input equal to 0
		WB_2_IN  <= '0'; 									-- Setting WB_2 input equal to 0
		M_1_IN   <= '0'; 									-- Setting M_1 input equal to 0
		M_2_IN   <= '0'; 									-- Setting M_2 input equal to 0
		M_3_IN   <= '0'; 									-- Setting M_3 input equal to 0
		AdderRes_IN <= "00000000000000000000000000000000"; 	-- Setting adder result input equal to 0
		ALU_Zero_IN <= '0';					 				-- Setting ALUZero input equal to 0
		ALURes_IN	<= "00000000000000000000000000000000";	-- Setting ALURes input equal to 0
		RF_B_IN	 	<= "00000000000000000000000000000000";	-- Setting RF_B input equal to 0
		RD_IN   	<= "00000";								-- Setting RD input equal to 0
      	wait for Clk_period;						  	-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 400ns
		WE  		 <= '1';								-- Setting write enable equal to 1
		-------------------------------------------------------------------------------------------------------------------------- 400ns
		WB_1_IN  	<= '1'; 								-- Setting WB_1 input equal to 1
		WB_2_IN  	<= '1'; 								-- Setting WB_2 input equal to 1
		M_1_IN   	<= '1'; 								-- Setting M_1 input equal to 1
		M_2_IN   	<= '1'; 								-- Setting M_2 input equal to 1
		M_3_IN   	<= '1'; 								-- Setting M_3 input equal to 1
		AdderRes_IN <= "00000000000000000000000000000011"; 	-- Setting adder result input equal to 3
		ALU_Zero_IN <= '1';					 				-- Setting ALUZero input equal to 1
		ALURes_IN	<= "00000000000000000000000000000111";	-- Setting ALURes input equal to 7
		RF_B_IN	 	<= "00000000000000000000000000001000";	-- Setting RF_B input equal to 8
		RD_IN   	<= "01001";								-- Setting RD input equal to 9
      	wait for Clk_period;						  		-- Expecting every outputs equal to inputs
		-------------------------------------------------------------------------------------------------------------------------- 500ns
		
----------------------------------------------------------------------------------------------------------------------------------
	-- Testing if the RST works correctly.
		-------------------------------------------------------------------------------------------------------------------------- 500ns
		RST 	    <= '1';									-- Reset will be set to 1 for the following tests
		WB_1_IN  	<= '1'; 								-- Setting WB_1 input equal to 1
		WB_2_IN  	<= '1'; 								-- Setting WB_2 input equal to 1
		M_1_IN   	<= '1'; 								-- Setting M_1 input equal to 1
		M_2_IN   	<= '1'; 								-- Setting M_2 input equal to 1
		M_3_IN   	<= '1'; 								-- Setting M_3 input equal to 1
		AdderRes_IN <= "00000000000000000000000000001011"; 	-- Setting adder result input equal to 11
		ALU_Zero_IN <= '1';					 				-- Setting ALUZero input equal to 1
		ALURes_IN	<= "00000000000000000000000000001111";	-- Setting ALURes input equal to 15
		RF_B_IN	 	<= "00000000000000000000000000001001";	-- Setting RF_B input equal to 9
		RD_IN   	<= "01010";								-- Setting RD input equal to 10
      	wait for Clk_period;						  		-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 700ns
		WE  	 <= '0';									-- Setting write enable to 0
		wait for Clk_period;						  		-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 800ns
		WE  	 <= '1';									-- Setting write enable to 1
		wait for Clk_period;						  		-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 900ns
		RST 	 <= '0'; 								  	-- Setting reset to 0
		wait for Clk_period;						  		-- Expecting outputs equal to inputs
		-------------------------------------------------------------------------------------------------------------------------- 1000ns		
		stop_the_clock <= true;
	   wait;
   end process;
END;

