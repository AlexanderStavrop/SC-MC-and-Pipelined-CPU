LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RF_tb IS
END RF_tb;
 
ARCHITECTURE behavior OF RF_tb IS 
 
	-- Creating the component of RegisterFile
   COMPONENT RF
		PORT( Ard1, Ard2, Awr : IN  std_logic_vector(4 downto 0);
				WrEn, Clk, Rst  : IN  std_logic;
				Din 				 : IN  std_logic_vector(31 downto 0);
				Dout1, Dout2    : OUT  std_logic_vector(31 downto 0)
		);
	END COMPONENT;

   -- Input Signals
   signal Ard1,Ard2, Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal WrEn, Clk, Rst : std_logic := '0';
   signal Din 				 : std_logic_vector(31 downto 0) := (others => '0');

 	 -- Output Signals
   signal Dout1, Dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
   signal stop_the_clock: boolean;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF 
		PORT MAP ( Ard1  => Ard1,
					  Ard2  => Ard2,
                 Awr   => Awr,
					  WrEn  => WrEn,
					  Clk   => Clk,
					  Rst   => Rst,
					  Din   => Din,
					  Dout1 => Dout1,
					  Dout2 => Dout2
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
------------------------------------------------------------------------------------------------------------------------------
	-- Holding reset for 100ns
		------------------------------------------------------------------------------------------------------------------------ 0ns
		Rst <= '1';												-- Setting reset on
		wait for Clk_period*2;								-- Waiting for everything to setup correctly
		Rst <= '0';												-- Setting reset off
		------------------------------------------------------------------------------------------------------------------------ 200ns	
		
------------------------------------------------------------------------------------------------------------------------------
	-- Checking If Writing to registers works as expected.
		------------------------------------------------------------------------------------------------------------------------ 200ns	
		WrEn <= '1';											-- WriteEnable will be on for the following tests
		Din <= "11111111111111111111111111111111";	-- DataIn will be equal to -1 for the following tests
		------------------------------------------------------------------------------------------------------------------------ 200ns
		Ard1 <= "00001";										-- Mux1: Choosing the R1 register
		Ard2 <= "00101";										-- Mux2: Choosing the R5 register
		Awr <= "00001";										-- Choosing to write on the R1 register
      wait for Clk_period;									-- Expecting Dout1 equal to all 1s and Dout2 equal to 0
		------------------------------------------------------------------------------------------------------------------------ 300ns
		Ard1 <= "00001";										-- Mux1: Choosing the R1 register
		Ard2 <= "00101";										-- Mux2: Choosing the R5 register
		Awr <= "00101";										-- Choosing to write on the R5 register
      wait for Clk_period;									-- Expecting Dout1 and Dout2 equal to all 1s
		------------------------------------------------------------------------------------------------------------------------ 400ns
		wait for 25ns;											-- Waiting for 75ns to check if the Muxes work asychronously
		------------------------------------------------------------------------------------------------------------------------ 425ns
		Ard1 <= "00000";										-- Mux1: Choosing the R0 register
		Ard2 <= "00000";										-- Mux2: Choosing the R0 register
      wait for 75ns;											-- Expecting Dout1 and Dout2 equal to 0s after 10ns
		------------------------------------------------------------------------------------------------------------------------ 500ns
		-- Checking If we can change the value of R0.
		------------------------------------------------------------------------------------------------------------------------ 500ns	
		Ard1 <= "00000";										-- Mux1: Choosing the R0 register
		Ard2 <= "00110";										-- Mux2: Choosing the R6 register
		Awr <= "00000";										-- Choosing to write on the R0 register
		Din <= "10101010101010101010101010101010";	-- Setting DataIn will be equal to -1431655766
      wait for Clk_period;									-- Expecting Dout1 and Dout2 equal to all 0s
		------------------------------------------------------------------------------------------------------------------------ 600ns
	-- Checking If the data was write correctly in R1 and R5.
		------------------------------------------------------------------------------------------------------------------------ 600ns	
		WrEn <= '0';											-- WriteEnable will be on for the following tests
		Ard1 <= "00001";										-- Mux1: Choosing the R1 register
		Ard2 <= "00101";										-- Mux2: Choosing the R5 register
		Awr <= "00101";										-- Choosing to write on the R5 register
      wait for Clk_period;									-- Expecting Dout1 and Dout2 equal to all 1s
		------------------------------------------------------------------------------------------------------------------------ 700ns
		
------------------------------------------------------------------------------------------------------------------------------
	-- Showing the delay and how they could affect the outputs.
		------------------------------------------------------------------------------------------------------------------------ 700ns	
		WrEn <= '1';											-- WriteEnable will be on for the following tests
		Ard2 <= "01000";										-- Mux2: Choosing the R8 register for the following tests
		------------------------------------------------------------------------------------------------------------------------ 700ns
		Ard1 <= "00100";										-- Mux1: Choosing the R4 register 
		wait for 38ns;											-- Waiting for half period - 12 ns (total delays added)
		------------------------------------------------------------------------------------------------------------------------ 738ns
		Ard1 <= "00110";										-- Mux1: Choosing the R6 register
		Awr  <= "00110";										-- Choosing to write on the R6 register
		Din  <= "00001010110111101110101011100110";	-- Setting DataIn will be equal to 182381286
      wait for 62ns;											-- Expecting Dout1 equal to 182381286 and Dout2 equal to 0
		------------------------------------------------------------------------------------------------------------------------ 800ns
		wait for 40ns;											-- Waiting for Clk_period/2 - 10ns (accounting only for the decoder delay)
		------------------------------------------------------------------------------------------------------------------------ 840ns
		Ard2 <= "00111";										-- Mux2: Choosing the R7 register
		Awr  <= "00111";										-- Choosing to write on the R7 register
		Din  <= "11111111111111111111111111111111";	-- Setting DataIn equal to -1
      wait for 60ns;											-- Expecting Dout1 equal to -1 and Dout2 equal to 0 due to delays
		------------------------------------------------------------------------------------------------------------------------ 900ns
		wait for Clk_period;									-- Waiting for another clock period to show the result
		------------------------------------------------------------------------------------------------------------------------ 1000ns
		stop_the_clock <= true;
		wait;
	end process;
END;
