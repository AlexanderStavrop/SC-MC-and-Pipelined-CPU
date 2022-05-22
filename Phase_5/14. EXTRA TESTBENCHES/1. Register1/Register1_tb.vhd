LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Register1_tb IS
END Register1_tb;
 
architecture behavior of Register1_tb is
  
    component Register1
		Port ( CLK, RST, WE : in  std_logic;
			   DataIn 		: in  std_logic;
			   DataOut 		: out std_logic
		);
    end component;
    

	--Inputs
	signal CLK     		 : std_logic := '0';
	signal RST     		 : std_logic := '0';
	signal WE 	   		 : std_logic := '0';
	signal DataIn  		 : std_logic := '0';

 	--Outputs
	signal DataOut 		 : std_logic;

	-- Clock period definitions
	constant CLK_period   : time := 100 ns;
	signal stop_the_clock : boolean;

begin 
	-- Instantiate the Unit Under Test (UUT)
	uut: Register1 
		Port map ( CLK     => CLK,
				   RST     => RST,
				   WE 	   => WE,
				   DataIn  => DataIn,
				   DataOut => DataOut
        );

	clocking: process
		begin
			while not stop_the_clock loop
				Clk <= '0', '1' after CLK_period / 2;
				wait for CLK_period;
			end loop;
		wait;
	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
---------------------------------------------------------------------------------------------------------------------
   -- Checking if write enable works correctly.
		------------------------------------------------------------------------------------------------------- 0ns
		RST <= '0';				-- Reset will be set to 0 for the following tests
		WE  <= '0';				-- Write enable will be set to 0 for the following tests
		------------------------------------------------------------------------------------------------------- 0ns
		DataIn <= '1'; 			-- Setting DataIn equal to 1
      	wait for CLK_period; 	-- Expecting DataOut equal to 0
		------------------------------------------------------------------------------------------------------- 100ns
		DataIn <= '0'; 			-- Setting DataIn equal to 0
      	wait for CLK_period;	-- Expecting DataOut equal to 0
		------------------------------------------------------------------------------------------------------- 200ns
		WE  <= '1';				-- Setting write enable equal to 1
		------------------------------------------------------------------------------------------------------- 200ns
		DataIn <= '1'; 			-- Setting DataIn equal to 1
        wait for CLK_period;	-- Expecting DataOut equal to 0
		------------------------------------------------------------------------------------------------------- 300ns
		DataIn <= '0'; 		    -- Setting DataIn equal to 0
        wait for CLK_period;	-- Expecting DataOut equal to 1
		------------------------------------------------------------------------------------------------------- 400ns

	
---------------------------------------------------------------------------------------------------------------------
	-- Testing if the RST works correctly.
		------------------------------------------------------------------------------------------------------- 400ns
		RST    <= '1';			-- Reset will be set to 1 for the following tests
		DataIn <= '1'; 			-- DataIn will be equal to 1 for the following tests
		------------------------------------------------------------------------------------------------------- 400ns
		WE  <= '0';				-- Setting write enable to 0
		wait for CLK_period;	-- Expecting DataOut equal to 0
		------------------------------------------------------------------------------------------------------- 500ns
		WE  <= '1';				-- Setting write enable to 1
		wait for CLK_period;	-- Expecting DataOut equal to 0 again
		------------------------------------------------------------------------------------------------------- 600ns
		RST <= '0'; 			-- Setting reset to 0
		wait for CLK_period;	-- Expecting DataOut equal to 1
		------------------------------------------------------------------------------------------------------- 700ns		
		stop_the_clock <= true;
	   wait;
   end process;

END;
