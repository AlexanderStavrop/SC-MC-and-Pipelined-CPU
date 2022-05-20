LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Register5_tb IS
END Register5_tb;
 
architecture behavior of Register5_tb is
  
    component Register5
         Port ( CLK, RST, WE : in  std_logic;
				DataIn 		 : in  std_logic_vector (4 downto 0);
				DataOut 	 : out std_logic_vector (4 downto 0)
		);
    end component;
    

	--Inputs
	signal CLK 	   : std_logic := '0';
	signal RST 	   : std_logic := '0';
	signal WE 	   : std_logic := '0';
	signal DataIn  : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
	signal DataOut : std_logic_vector(4 downto 0);

	-- Clock period definitions
	constant CLK_period   : time := 100 ns;
	signal stop_the_clock : boolean;


begin
	-- Declaring the Register32 port map
   	uut: Register5 
		Port map ( CLK 	   => CLK,
				   RST 	   => RST,
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
		DataIn <= "00000"; 		-- Setting DataIn equal to 0
      	wait for CLK_period;	-- Expecting DataOut equal to 0
		------------------------------------------------------------------------------------------------------- 100ns
		DataIn <= "11111"; 		-- Setting DataIn equal to -1
      	wait for CLK_period;	-- Expecting DataOut equal to 0
		------------------------------------------------------------------------------------------------------- 200ns
		WE  <= '1';				-- Setting write enable equal to 1
		------------------------------------------------------------------------------------------------------- 200ns
		DataIn <= "00000"; 		-- Setting DataIn equal to 0
        wait for CLK_period;	-- Expecting DataOut equal to 0
		------------------------------------------------------------------------------------------------------- 300ns
		DataIn <= "11111"; 		-- Setting DataIn equal to -1
        wait for CLK_period;	-- Expecting DataOut equal to -1
		------------------------------------------------------------------------------------------------------- 400ns
		DataIn <= "00110"; 		-- Setting DataIn equal to 6
        wait for CLK_period;	-- Expecting DataOut equal to 6
		------------------------------------------------------------------------------------------------------- 500ns
		
---------------------------------------------------------------------------------------------------------------------
	-- Testing if the RST works correctly.
		------------------------------------------------------------------------------------------------------- 500ns
		RST <= '1';				-- Reset will be set to 1 for the following tests
		DataIn <= "00111"; 		-- DataIn will be equal to 7 for the following tests
		------------------------------------------------------------------------------------------------------- 500ns
		WE  <= '0';				-- Setting write enable to 0
		wait for CLK_period;	-- Expecting DataOut equal to 0
		------------------------------------------------------------------------------------------------------- 600ns
		WE  <= '1';				-- Setting write enable to 1
		wait for CLK_period;	-- Expecting DataOut equal to 0 again
		------------------------------------------------------------------------------------------------------- 700ns
		RST <= '0'; 			-- Setting reset to 0
		wait for CLK_period;	-- Expecting DataOut equal to 7
		------------------------------------------------------------------------------------------------------- 800ns		
		stop_the_clock <= true;
	   wait;
   end process;
END;
