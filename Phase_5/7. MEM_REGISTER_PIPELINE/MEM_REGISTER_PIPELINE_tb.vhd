LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MEM_REGISTER_PIPELINE_tb IS
END MEM_REGISTER_PIPELINE_tb;
 
architecture behavior of MEM_REGISTER_PIPELINE_tb is
  
    component MEM_REGISTER_PIPELINE
		Port ( Clk, Rst, WE		  : in  std_logic;
			   -- WB_Reg -----------------------------------------------
			   WB_1_IN, WB_2_IN	  : in  std_logic;
		       WB_1_OUT, WB_2_OUT : out std_logic;
		       -- MEM_out_Reg ------------------------------------------
		       MEM_Data_IN		  : in  std_logic_vector (31 downto 0);
		       MEM_Data_OUT		  : out std_logic_vector (31 downto 0);
		       -- ALU_Res_Reg ------------------------------------------	
		       ALURes_IN 		  : in  std_logic_vector (31 downto 0);
		       ALURes_Out 		  : out std_logic_vector (31 downto 0);
		       -- RD_Reg ------------------------------------------------------
		       RD_IN 			  : in  std_logic_vector ( 4 downto 0);
	 	       RD_OUT			  : out std_logic_vector ( 4 downto 0)
		);
    end component;
    

	--Inputs
	signal Clk 		    : std_logic := '0';
	signal Rst 		    : std_logic := '0';
	signal WE 		    : std_logic := '0';
	signal WB_1_IN 	    : std_logic := '0';
	signal WB_2_IN      : std_logic := '0';
	signal MEM_Data_IN  : std_logic_vector(31 downto 0) := (others => '0');
	signal ALURes_IN    : std_logic_vector(31 downto 0) := (others => '0');
	signal RD_IN 	    : std_logic_vector( 4 downto 0) := (others => '0');

	--Outputs
	signal WB_1_OUT     : std_logic;
	signal WB_2_OUT     : std_logic;
	signal MEM_Data_OUT : std_logic_vector(31 downto 0);
	signal ALURes_Out 	: std_logic_vector(31 downto 0);
	signal RD_OUT 		: std_logic_vector( 4 downto 0);

	-- Clock period definitions
	constant Clk_period  : time := 100 ns;
	signal stop_the_clock: boolean;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: MEM_REGISTER_PIPELINE 
		Port map ( Clk 			=> Clk,
				   Rst 			=> Rst,
				   WE 			=> WE,
				   WB_1_IN 		=> WB_1_IN,
				   WB_2_IN 		=> WB_2_IN,
				   WB_1_OUT     => WB_1_OUT,
				   WB_2_OUT 	=> WB_2_OUT,
				   MEM_Data_IN  => MEM_Data_IN,
				   MEM_Data_OUT => MEM_Data_OUT,
				   ALURes_IN 	=> ALURes_IN,
				   ALURes_Out 	=> ALURes_Out,
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
		MEM_Data_IN <= "00000000000000000000000000000011"; 	-- Setting adder result input equal to 3
		ALURes_IN	<= "00000000000000000000000000000111";	-- Setting ALURes input equal to 7
		RD_IN   	<= "01001";								-- Setting RD input equal to 9
      	wait for Clk_period;						  		-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 300ns
		WB_1_IN  	<= '0'; 								-- Setting WB_1 input equal to 0
		WB_2_IN  	<= '0'; 								-- Setting WB_2 input equal to 0
		MEM_Data_IN <= "00000000000000000000000000000000"; 	-- Setting adder result input equal to 0
		ALURes_IN	<= "00000000000000000000000000000000";	-- Setting ALURes input equal to 0
		RD_IN   	<= "00000";								-- Setting RD input equal to 0 
      	wait for Clk_period;						  		-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 400ns
		WE  		 <= '1';								-- Setting write enable equal to 1
		-------------------------------------------------------------------------------------------------------------------------- 400ns
		WB_1_IN  	<= '1'; 								-- Setting WB_1 input equal to 1
		WB_2_IN  	<= '1'; 								-- Setting WB_2 input equal to 1
		MEM_Data_IN <= "00000000000000000000000000000011"; 	-- Setting adder result input equal to 3
		ALURes_IN	<= "00000000000000000000000000000111";	-- Setting ALURes input equal to 7
		RD_IN   	<= "01001";								-- Setting RD input equal to 9
      	wait for Clk_period;						  		-- Expecting every outputs equal to inputs
		-------------------------------------------------------------------------------------------------------------------------- 500ns
		
----------------------------------------------------------------------------------------------------------------------------------
	-- Testing if the RST works correctly.
		-------------------------------------------------------------------------------------------------------------------------- 500ns
		RST 	    <= '1';									-- Reset will be set to 1 for the following tests
		WB_1_IN  	<= '1'; 								-- Setting WB_1 input equal to 1
		WB_2_IN  	<= '1'; 								-- Setting WB_2 input equal to 1
		MEM_Data_IN <= "00000000000000000000000000000011"; 	-- Setting adder result input equal to 3
		ALURes_IN	<= "00000000000000000000000000000111";	-- Setting ALURes input equal to 7
		RD_IN   	<= "01001";								-- Setting RD input equal to 9
      	wait for Clk_period;						  		-- Expecting every outputs equal to inputs
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

