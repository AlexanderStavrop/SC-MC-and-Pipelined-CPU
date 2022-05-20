LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DEC_REGISTER_PIPELINE_tb IS
END DEC_REGISTER_PIPELINE_tb;
 
architecture behavior of DEC_REGISTER_PIPELINE_tb is
  
    component DEC_REGISTER_PIPELINE
		Port ( Clk, Rst, WE				 : in  std_logic;
			   -- WB_Reg ------------------------------------------------------
			   WB_1_IN, WB_2_IN			 : in  std_logic;
		       WB_1_OUT, WB_2_OUT		 : out std_logic;		   
			   -- M_Reg -------------------------------------------------------
		       M_1_IN, M_2_IN, M_3_IN	 : in  std_logic;
		       M_1_OUT, M_2_OUT, M_3_OUT : out std_logic;
		       -- EX_Reg ------------------------------------------------------
		       EX_1_IN					 : in  std_logic_vector(3 downto 0);	
		       EX_2_IN			 	     : in  std_logic;
		       EX_1_OUT					 : out std_logic_vector(3 downto 0);
		       EX_2_OUT					 : out std_logic;
		       -- PC_4_Reg ----------------------------------------------------
		       Adder_IN 				 : in  std_logic_vector (31 downto 0);
		       Adder_OUT				 : out std_logic_vector (31 downto 0);
		       -- RF_A_Reg ----------------------------------------------------
		       RF_A_IN   				 : in  std_logic_vector (31 downto 0);
		       RF_A_OUT				     : out std_logic_vector (31 downto 0);
		       -- RF_B_Reg ----------------------------------------------------
		       RF_B_IN   				 : in  std_logic_vector (31 downto 0);
		       RF_B_OUT					 : out std_logic_vector (31 downto 0);
		       -- Immed_Reg ---------------------------------------------------
		       Immed_IN  				 : in  std_logic_vector (31 downto 0);
		       Immed_OUT 				 : out std_logic_vector (31 downto 0);
		       -- RS_Reg ------------------------------------------------------
		       RS_IN					 : in  std_logic_vector ( 4 downto 0);	
		       RS_OUT					 : out std_logic_vector ( 4 downto 0);
		       -- RD_Reg ------------------------------------------------------
		       RD_IN					 : in  std_logic_vector ( 4 downto 0);	
		       RD_OUT					 : out std_logic_vector ( 4 downto 0);
		       -- Mux_Reg -----------------------------------------------------
		       Mux_IN					 : in  std_logic_vector ( 4 downto 0);	
		       Mux_OUT 		    		 : out std_logic_vector ( 4 downto 0)		   
		);
	end component;
    

	--Inputs
    signal Clk       : std_logic := '0';
    signal Rst       : std_logic := '0';
    signal WE        : std_logic := '0';
    signal WB_1_IN   : std_logic := '0';
    signal WB_2_IN   : std_logic := '0';
    signal M_1_IN    : std_logic := '0'; 
    signal M_2_IN    : std_logic := '0';
    signal M_3_IN    : std_logic := '0';
    signal EX_1_IN   : std_logic_vector(3 downto 0) := (others => '0');
	signal EX_2_IN   : std_logic := '0';
	signal Adder_IN  : std_logic_vector(31 downto 0) := (others => '0');
    signal RF_A_IN   : std_logic_vector(31 downto 0) := (others => '0');
    signal RF_B_IN   : std_logic_vector(31 downto 0) := (others => '0');
    signal Immed_IN  : std_logic_vector(31 downto 0) := (others => '0');
    signal RS_IN     : std_logic_vector(4 downto 0) := (others => '0');
    signal RD_IN     : std_logic_vector(4 downto 0) := (others => '0');
    signal Mux_IN    : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
    signal WB_1_OUT  : std_logic;
    signal WB_2_OUT  : std_logic;
    signal M_1_OUT   : std_logic;
    signal M_2_OUT   : std_logic;
    signal M_3_OUT   : std_logic;
    signal EX_1_OUT  : std_logic_vector(3 downto 0);
    signal EX_2_OUT  : std_logic;
    signal Adder_OUT : std_logic_vector(31 downto 0);
    signal RF_A_OUT  : std_logic_vector(31 downto 0);
    signal RF_B_OUT  : std_logic_vector(31 downto 0);
    signal Immed_OUT : std_logic_vector(31 downto 0);
	signal RS_OUT    : std_logic_vector(4 downto 0);
    signal RD_OUT    : std_logic_vector(4 downto 0);
	signal Mux_OUT   : std_logic_vector(4 downto 0);
		
	-- Clock period definitions
	constant Clk_period  : time := 100 ns;
	signal stop_the_clock: boolean;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: DEC_REGISTER_PIPELINE 
		Port map ( Clk       => Clk,
				   Rst       => Rst,
				   WE        => WE,
				   WB_1_IN   => WB_1_IN,
				   WB_2_IN   => WB_2_IN,
				   WB_1_OUT  => WB_1_OUT,
				   WB_2_OUT  => WB_2_OUT,
				   M_1_IN    => M_1_IN,
				   M_2_IN    => M_2_IN,
				   M_3_IN    => M_3_IN,
				   M_1_OUT   => M_1_OUT,
				   M_2_OUT   => M_2_OUT,
				   M_3_OUT   => M_3_OUT,
				   EX_1_IN   => EX_1_IN,
				   EX_2_IN   => EX_2_IN,
				   EX_1_OUT  => EX_1_OUT,
				   EX_2_OUT  => EX_2_OUT,
				   Adder_IN  => Adder_IN,
				   Adder_OUT => Adder_OUT,
				   RF_A_IN   => RF_A_IN,
				   RF_A_OUT  => RF_A_OUT,
				   RF_B_IN   => RF_B_IN,
				   RF_B_OUT  => RF_B_OUT,
				   Immed_IN  => Immed_IN,
				   Immed_OUT => Immed_OUT,
				   RS_IN     => RS_IN,
				   RS_OUT    => RS_OUT,
				   RD_IN     => RD_IN,
				   RD_OUT    => RD_OUT,
				   Mux_IN    => Mux_IN,
				   Mux_OUT   => Mux_OUT
		);

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
		RST 	 <= '0';								-- Reset will be set to 0 for the following tests
		WE  	 <= '0';								-- Write enable will be set to 0 for the following tests
		-------------------------------------------------------------------------------------------------------------------------- 200ns
		WB_1_IN  <= '1'; 								-- Setting WB_1 input equal to 1
		WB_2_IN  <= '1'; 								-- Setting WB_2 input equal to 1
		M_1_IN   <= '1'; 								-- Setting M_1 input equal to 1
		M_2_IN   <= '1'; 								-- Setting M_2 input equal to 1
		M_3_IN   <= '1'; 								-- Setting M_3 input equal to 1
		EX_1_IN  <= "0010"; 							-- Setting EX_1 input equal to 2
		EX_2_IN  <= '1'; 								-- Setting EX_2 input equal to 1
		Adder_IN <= "00000000000000000000000000000011"; -- Setting adder result input equal to 3
		RF_A_IN  <= "00000000000000000000000000000100"; -- Setting RF_A input equal to 4
		RF_B_IN  <= "00000000000000000000000000000101"; -- Setting RF_B input equal to 5
		Immed_IN <= "00000000000000000000000000000110"; -- Setting Immed input equal to 6
		RS_IN	 <= "00111";							-- Setting RS input equal to 7
		RD_IN	 <= "01000";							-- Setting RD input equal to 8
		Mux_IN   <= "01001";							-- Setting Mux result equal to 9
      	wait for Clk_period;						  	-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 300ns
		WB_1_IN  <= '0'; 								-- Setting WB_1 input equal to 0
		WB_2_IN  <= '0'; 								-- Setting WB_2 input equal to 0
		M_1_IN   <= '0'; 								-- Setting M_1 input equal to 0
		M_2_IN   <= '0'; 								-- Setting M_2 input equal to 0
		M_3_IN   <= '0'; 								-- Setting M_3 input equal to 0
		EX_1_IN  <= "0000"; 							-- Setting EX_1 input equal to 0
		EX_2_IN  <= '0'; 								-- Setting EX_2 input equal to 0
		Adder_IN <= "00000000000000000000000000000000"; -- Setting adder result input equal to 0
		RF_A_IN  <= "00000000000000000000000000000000"; -- Setting RF_A input equal to 0
		RF_B_IN  <= "00000000000000000000000000000000"; -- Setting RF_B input equal to 0
		Immed_IN <= "00000000000000000000000000000000"; -- Setting Immed input equal to 0
		RS_IN	 <= "00000";							-- Setting RS input equal to 0
		RD_IN	 <= "00000";							-- Setting RD input equal to 0
		Mux_IN   <= "00000";							-- Setting Mux result equal to 0
      	wait for Clk_period;						  	-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 400ns
		WE  		 <= '1';								-- Setting write enable equal to 1
		-------------------------------------------------------------------------------------------------------------------------- 400ns
		WB_1_IN  <= '1'; 								-- Setting WB_1 input equal to 1
		WB_2_IN  <= '1'; 								-- Setting WB_2 input equal to 1
		M_1_IN   <= '1'; 								-- Setting M_1 input equal to 1
		M_2_IN   <= '1'; 								-- Setting M_2 input equal to 1
		M_3_IN   <= '1'; 								-- Setting M_3 input equal to 1
		EX_1_IN  <= "0010"; 							-- Setting EX_1 input equal to 2
		EX_2_IN  <= '1'; 								-- Setting EX_2 input equal to 1
		Adder_IN <= "00000000000000000000000000000011"; -- Setting adder result input equal to 3
		RF_A_IN  <= "00000000000000000000000000000100"; -- Setting RF_A input equal to 4
		RF_B_IN  <= "00000000000000000000000000000101"; -- Setting RF_B input equal to 5
		Immed_IN <= "00000000000000000000000000000110"; -- Setting Immed input equal to 6
		RS_IN	 <= "00111";							-- Setting RS input equal to 7
		RD_IN	 <= "01000";							-- Setting RD input equal to 8
		Mux_IN   <= "01001";							-- Setting Mux result equal to 9
      	wait for Clk_period;						  	-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 500ns
		WB_1_IN  <= '1'; 								-- Setting WB_1 input equal to 1
		WB_2_IN  <= '1'; 								-- Setting WB_2 input equal to 1
		M_1_IN   <= '1'; 								-- Setting M_1 input equal to 1
		M_2_IN   <= '1'; 								-- Setting M_2 input equal to 1
		M_3_IN   <= '1'; 								-- Setting M_3 input equal to 1
		EX_1_IN  <= "0010"; 							-- Setting EX_1 input equal to 2
		EX_2_IN  <= '1'; 								-- Setting EX_2 input equal to 1
		Adder_IN <= "00000000000000000000000000000111"; -- Setting adder result input equal to 7
		RF_A_IN  <= "00000000000000000000000000000101"; -- Setting RF_A input equal to 5
		RF_B_IN  <= "00000000000000000000000000000001"; -- Setting RF_B input equal to 1
		Immed_IN <= "00000000000000000000000000000110"; -- Setting Immed input equal to 6
		RS_IN	 <= "00011";							-- Setting RS input equal to 3
		RD_IN	 <= "01010";							-- Setting RD input equal to 10
		Mux_IN   <= "10001";							-- Setting Mux result equal to 17
      	wait for Clk_period;						  	-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 600ns
		
----------------------------------------------------------------------------------------------------------------------------------
	-- Testing if the RST works correctly.
		-------------------------------------------------------------------------------------------------------------------------- 600ns
		RST 	 <= '1';								-- Reset will be set to 1 for the following tests
		WB_1_IN  <= '1'; 								-- Setting WB_1 input equal to 1
		WB_2_IN  <= '1'; 								-- Setting WB_2 input equal to 1
		M_1_IN   <= '1'; 								-- Setting M_1 input equal to 1
		M_2_IN   <= '1'; 								-- Setting M_2 input equal to 1
		M_3_IN   <= '1'; 								-- Setting M_3 input equal to 1
		EX_1_IN  <= "0010"; 							-- Setting EX_1 input equal to 2
		EX_2_IN  <= '1'; 								-- Setting EX_2 input equal to 1
		Adder_IN <= "00000000000000000000000000000011"; -- Setting adder result input equal to 3
		RF_A_IN  <= "00000000000000000000000000000100"; -- Setting RF_A input equal to 4
		RF_B_IN  <= "00000000000000000000000000000101"; -- Setting RF_B input equal to 5
		Immed_IN <= "00000000000000000000000000000110"; -- Setting Immed input equal to 6
		RS_IN	 <= "00111";							-- Setting RS input equal to 7
		RD_IN	 <= "01000";							-- Setting RD input equal to 8
		Mux_IN   <= "01001";							-- Setting Mux result equal to 9
      	wait for Clk_period;						  	-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 700ns
		WE  	 <= '0';									  	-- Setting write enable to 0
		wait for Clk_period;						  	-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 800ns
		WE  	 <= '1';									  	-- Setting write enable to 1
		wait for Clk_period;						  	-- Expecting every output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 900ns
		RST 	 <= '0'; 								  	-- Setting reset to 0
		wait for Clk_period;						  	-- Expecting outputs equal to inputs
		-------------------------------------------------------------------------------------------------------------------------- 1000ns		
		stop_the_clock <= true;
	   wait;
   end process;
END;
