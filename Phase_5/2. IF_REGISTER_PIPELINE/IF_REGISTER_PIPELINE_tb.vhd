LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity IF_REGISTER_PIPELINE_tb is
end IF_REGISTER_PIPELINE_tb;
 
architecture behavior of IF_REGISTER_PIPELINE_tb is 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component IF_REGISTER_PIPELINE
		Port ( Clk, Rst, WE  	 		   : in  STD_LOGIC;
			   IF_Adder_IN, MEM_Instr_IN   : in  STD_LOGIC_VECTOR (31 downto 0);
			   IF_Adder_OUT, MEM_Instr_OUT : out STD_LOGIC_VECTOR (31 downto 0)
		 );
    end component;
    

	--Input singals
	signal Clk 			: std_logic := '0';
	signal Rst 			: std_logic := '0';
	signal WE 			: std_logic := '0';
	signal IF_Adder_IN 	: std_logic_vector(31 downto 0) := (others => '0');
	signal MEM_Instr_IN : std_logic_vector(31 downto 0) := (others => '0');

 	--Output signals
	signal IF_Adder_OUT  : std_logic_vector(31 downto 0);
	signal MEM_Instr_OUT : std_logic_vector(31 downto 0);
	
	-- Clock period definitions
	constant Clk_period  : time := 100 ns;
	signal stop_the_clock: boolean;

begin
 
	-- Instantiate the Unit Under Test (UUT)
	uut: IF_REGISTER_PIPELINE 
		port map ( Clk 			 => Clk,
				   Rst 			 => Rst,
				   WE 			 => WE,
				   IF_Adder_IN   => IF_Adder_IN,
				   MEM_Instr_IN  => MEM_Instr_IN,
				   IF_Adder_OUT  => IF_Adder_OUT,
				   MEM_Instr_OUT => MEM_Instr_OUT
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
		Rst 		<= '1';
		wait for Clk_period*2;
		-------------------------------------------------------------------------------------------------------------------------- 200ns
		Rst 		<= '0';
		
----------------------------------------------------------------------------------------------------------------------------------
	-- Checking if write enable works correctly.
		-------------------------------------------------------------------------------------------------------------------------- 200ns
		RST 		 <= '0';								-- Reset will be set to 0 for the following tests
		WE  		 <= '0';								-- Write enable will be set to 0 for the following tests
		-------------------------------------------------------------------------------------------------------------------------- 200ns
		IF_Adder_IN  <= "00000000000000000000000000000001"; -- Setting Adder result input equal to 1
		MEM_Instr_IN <= "00000000000000000000000000000010";	-- Setting memory instruction input equal to 2
      	wait for Clk_period;						  		-- Expecting Adder result and memory instruction output equal to 0 
		-------------------------------------------------------------------------------------------------------------------------- 300ns
		IF_Adder_IN  <= "00000000000000000000000000000100"; -- Setting Adder result input equal to 4
		MEM_Instr_IN <= "00000000000000000000000000001000";	-- Setting memory instruction input equal to 8
      	wait for Clk_period;						  		-- Expecting Adder result and memory instruction output equal to 0
		-------------------------------------------------------------------------------------------------------------------------- 400ns
		WE  		 <= '1';								-- Setting write enable equal to 1
		-------------------------------------------------------------------------------------------------------------------------- 400ns
		IF_Adder_IN  <= "00000000000000000000000000000001"; -- Setting Adder result input equal to 1
		MEM_Instr_IN <= "00000000000000000000000000000010";	-- Setting memory instruction input equal to 2
        wait for Clk_period;						  		-- Expecting Adder result output equal to 1 and 
															--  memory instruction output equal to 2 
		-------------------------------------------------------------------------------------------------------------------------- 500ns
		IF_Adder_IN  <= "00000000000000000000000000001000"; -- Setting Adder result input equal to 8
		MEM_Instr_IN <= "00000000000000000000000000000100";	-- Setting memory instruction input equal to 4
        wait for Clk_period;						  		-- Expecting Adder result output equal to 8 and 
															--  memory instruction output equal to 4 
		-------------------------------------------------------------------------------------------------------------------------- 600ns
		IF_Adder_IN  <= "11111111111111111111111111111111"; -- Setting Adder result input equal to -1
		MEM_Instr_IN <= "11111111111111111111111111111101";	-- Setting memory instruction input equal to -2
        wait for Clk_period;						  		-- Expecting Adder result output equal to -1 and 
															--  memory instruction output equal to -2 
		-------------------------------------------------------------------------------------------------------------------------- 700ns
		
----------------------------------------------------------------------------------------------------------------------------------
	-- Testing if the RST works correctly.
		-------------------------------------------------------------------------------------------------------------------------- 700ns
		RST <= '1';									 		-- Reset will be set to 1 for the following tests
		IF_Adder_IN  <= "00000000000000000000000000001010"; -- Setting Adder result input equal to 10 for the follwing tests
		MEM_Instr_IN <= "00000000000000000000000000000110";	-- Setting memory instruction input equal to 6 for the follwing tests
		-------------------------------------------------------------------------------------------------------------------------- 700ns
		WE  <= '0';									  		-- Setting write enable to 0
		wait for Clk_period;						  		-- Expecting Adder result and memory instruction output equal to 0 
		-------------------------------------------------------------------------------------------------------------------------- 800ns
		WE  <= '1';									  		-- Setting write enable to 1
		wait for Clk_period;						  		-- Expecting DataOut equal to 0 again
		-------------------------------------------------------------------------------------------------------------------------- 900ns
		RST <= '0'; 								  		-- Setting reset to 0
		wait for Clk_period;						  		-- Expecting Adder result output equal to 10 and 
															--  memory instruction output equal to 6 
		-------------------------------------------------------------------------------------------------------------------------- 1000ns		
		stop_the_clock <= true;
	   wait;
   end process;

END;
