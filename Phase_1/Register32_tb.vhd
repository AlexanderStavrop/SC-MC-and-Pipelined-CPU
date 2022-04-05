LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Register32_tb IS
END Register32_tb;
 
ARCHITECTURE behavior OF Register32_tb IS 
    -- Creating the component of Register32
	 COMPONENT Register32
    PORT ( CLK, RST, WE : IN  std_logic;
            DataIn      : IN  std_logic_vector(31 downto 0);
            DataOut     : OUT  std_logic_vector(31 downto 0)
     );
    END COMPONENT;
    
   -- Input Signal
   signal CLK, RST, WE : std_logic := '0';
   signal DataIn 		: std_logic_vector(31 downto 0) := (others => '0');

 	-- Output Signal
   signal DataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
	signal stop_the_clock: boolean;

 
BEGIN
	-- Declaring the Register32 port map
   uut: Register32 
		PORT MAP ( CLK => CLK,
					  RST => RST,
					  WE => WE,
					  DataIn => DataIn,
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
--------------------------------------------------------------------------------------------------------------
   -- Checking if write enable works correctly.
		-------------------------------------------------------------------------------------------------------- 0ns
		RST <= '0';												 -- Reset will be set to 0 for the following tests
		WE  <= '0';												 -- Write enable will be set to 0 for the following tests
		-------------------------------------------------------------------------------------------------------- 0ns
		DataIn <= "00000000000000000000000000000000"; -- Setting DataIn equal to 0
      wait for CLK_period;									 -- Expecting DataOut equal to 0
		-------------------------------------------------------------------------------------------------------- 100ns
		DataIn <= "11111111111111111111111111111111"; -- Setting DataIn equal to -1
      wait for CLK_period;									 -- Expecting DataOut equal to 0
		-------------------------------------------------------------------------------------------------------- 200ns
		WE  <= '1';												 -- Setting write enable equal to 1
		-------------------------------------------------------------------------------------------------------- 200ns
		DataIn <= "00000000000000000000000000000000"; -- Setting DataIn equal to 0
      wait for CLK_period;									 -- Expecting DataOut equal to 0
		-------------------------------------------------------------------------------------------------------- 300ns
		DataIn <= "11111111111111111111111111111111"; -- Setting DataIn equal to -1
      wait for CLK_period;									 -- Expecting DataOut equal to -1
		-------------------------------------------------------------------------------------------------------- 400ns
		DataIn <= "00000000000000001111000000000000"; -- Setting DataIn equal to 61440
      wait for CLK_period;									 -- Expecting DataOut equal to 61440
		-------------------------------------------------------------------------------------------------------- 500ns
		DataIn <= "00000000000000000111111111111111"; -- Setting DataIn equal to 32767
		wait for CLK_period;									 -- Expecting DataOut equal to 32767 
		-------------------------------------------------------------------------------------------------------- 600ns
	
--------------------------------------------------------------------------------------------------------------
	-- Testing if the RST works synchronously.
		-------------------------------------------------------------------------------------------------------- 600ns
		RST <= '1';												 -- Reset will be set to 1 for the following tests
		DataIn <= "00000000000000000111111111111111"; -- DataIn will be equal to 32767 for the following tests
		-------------------------------------------------------------------------------------------------------- 600ns
		WE  <= '0';												 -- Setting write enable to 0
		wait for CLK_period;									 -- Expecting DataOut equal to 0
		-------------------------------------------------------------------------------------------------------- 700ns
		WE  <= '1';												 -- Setting write enable to 1
		wait for CLK_period;									 -- Expecting DataOut equal to 0 again
		-------------------------------------------------------------------------------------------------------- 800ns
		RST <= '0'; 											 -- Setting reset to 0
		wait for CLK_period;									 -- Expecting DataOut equal to 32767
		-------------------------------------------------------------------------------------------------------- 900ns		
		stop_the_clock <= true;
	   wait;
   end process;
END;
