LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY IFSTAGE_tb IS
END IFSTAGE_tb;
 
ARCHITECTURE behavior OF IFSTAGE_tb IS 
 
   -- Component Declaration for the Unit Under Test (UUT)
	COMPONENT IFSTAGE
		port ( PC_sel, PC_LdEn, Reset, Clk : in  std_logic;
			 PC_Immed 						     : in  std_logic_vector(31 downto 0);
			 PC 				                 : out std_logic_vector(31 downto 0)
		);
   END COMPONENT;
    

   -- Input signal
   signal PC_sel   : std_logic := '0';
   signal PC_LdEn  : std_logic := '0';
   signal Reset    : std_logic := '0';
   signal Clk      : std_logic := '0';
   signal PC_Immed : std_logic_vector(31 downto 0) := (others => '0');

 	-- Output signal
   signal PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
   signal stop_the_clock: boolean;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IFSTAGE 
		PORT MAP ( Clk      => Clk,
					  PC_sel   => PC_sel,
					  PC_LdEn  => PC_LdEn,
					  PC_Immed => PC_Immed,
					  PC       => PC,
					  Reset    => Reset
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
----------------------------------------------------------------------------------------------------------------------
	-- Testing if input affects the value of PC when PC_LdEn is off.
		---------------------------------------------------------------------------------------------------------------- 0ns
		PC_LdEn  <= '0';											-- Write enable will be off for the following tests
		Reset    <= '0';											-- Reset will be off for the following tests
		---------------------------------------------------------------------------------------------------------------- 0ns
		PC_Immed <= "00000000000000000000000000000010"; -- Setting the PC_immed value to 2
		PC_sel   <= '0';											-- Choosing the first input of the multiplexer
		wait for Clk_period;										-- Expecting PC equal to 0
		---------------------------------------------------------------------------------------------------------------- 100ns
		PC_Immed <= "00000000000000000000000000001111"; -- Setting the PC_immed value to 15
		PC_sel   <= '1';											-- Choosing the first input of the multiplexer
		wait for Clk_period;										-- Expecting PC equal to 0
		---------------------------------------------------------------------------------------------------------------- 200ns	
		-- Testing negative numbers.
		---------------------------------------------------------------------------------------------------------------- 200ns
		PC_Immed <= "11111111111111111111111111111111"; -- Setting the PC_immed value to -1
		PC_sel   <= '0';											-- Choosing the second input of the multiplexer
		wait for Clk_period;										-- Expecting PC equal to 0
		---------------------------------------------------------------------------------------------------------------- 300ns
		PC_Immed <= "11111111111111111111111111110001"; -- Setting the PC_immed value to -15
		PC_sel   <= '1';											-- Choosing the second input of the multiplexer
		wait for Clk_period;										-- Expecting PC equal to 0
		---------------------------------------------------------------------------------------------------------------- 400ns		
		-- Testing if input affects the value of PC when PC_LdEn is on and we choose the first input of the multiplexer
		---------------------------------------------------------------------------------------------------------------- 400ns
		PC_LdEn  <= '1';											-- Write enable will be on for the following tests
		PC_sel   <= '0';											-- Choosing the first input of the multiplexer
		---------------------------------------------------------------------------------------------------------------- 400ns
		PC_Immed <= "00000000000000000000000000000100"; -- Setting the PC_immed value to 6
		wait for Clk_period*4;									-- Expecting the value of PC to increment by for every clock
		---------------------------------------------------------------------------------------------------------------- 800ns
		-- Testing negative number.
		---------------------------------------------------------------------------------------------------------------- 800ns
		PC_Immed <= "11111111111111111111111111111100"; -- Setting the PC_immed value to -4
		wait for Clk_period;									   -- Expecting the PC equal to 20
		---------------------------------------------------------------------------------------------------------------- 900ns
		
----------------------------------------------------------------------------------------------------------------------
	-- Testing if the Pc_Immed is pass correctly through the multiplexer
		---------------------------------------------------------------------------------------------------------------- 900ns
		PC_LdEn  <= '1';											-- Write enable will be on for the following tests
		Reset    <= '0';											-- Reset will be off for the following tests
		---------------------------------------------------------------------------------------------------------------- 900ns
		PC_sel   <= '1';											-- Choosing the second input of the multiplexer
		PC_Immed <= "00000000000000000000000000011111"; -- Setting the PC_immed value to 31
		wait for Clk_period;									   -- Expecting the PC equal to 20 + 4 + 31 = 55
		---------------------------------------------------------------------------------------------------------------- 1000ns
		PC_sel   <= '0';											-- Choosing the second input of the multiplexer
		wait for Clk_period*3;									-- Expecting the PC increment by 4 in every clock cicle (finaly=67)
		---------------------------------------------------------------------------------------------------------------- 1300ns	
		-- Testing negative numbers.
		---------------------------------------------------------------------------------------------------------------- 1300ns
		PC_sel   <= '1';											-- Choosing the second input of the multiplexer
		PC_Immed <= "11111111111111111111111111100001"; -- Setting the PC_immed value to -31
		wait for Clk_period;									   -- Expecting the PC equal to 67 + 4 - 31 = 40
		---------------------------------------------------------------------------------------------------------------- 1400ns
		PC_sel   <= '0';											-- Choosing the second input of the multiplexer
		wait for Clk_period*3;									-- Expecting the PC increment by 4 in every clock cicle (finaly=52)
		---------------------------------------------------------------------------------------------------------------- 1700ns
		 
----------------------------------------------------------------------------------------------------------------------  
	-- Testing that the reset works as expected
		---------------------------------------------------------------------------------------------------------------- 1700ns
		Reset    <= '1';											-- Reset will be on for the following tests
		---------------------------------------------------------------------------------------------------------------- 1700ns
		PC_LdEn  <= '0';											-- Setting write enable off. 
		PC_sel   <= '0';											-- Choosing the first input of the multiplexer	
		PC_Immed <= "00000000000000000000000000000000"; -- Setting the PC_immed value to 0
		wait for Clk_period;									   -- Expecting the PC equal to 0
		---------------------------------------------------------------------------------------------------------------- 1800ns
		PC_LdEn  <= '1';											-- Setting write enable off
		PC_sel   <= '1';											-- Choosing the first input of the multiplexer
		PC_Immed <= "00000000000000000000000000000111"; -- Setting the PC_immed value to 
		wait for Clk_period;									   -- Expecting the PC equal to 0
		---------------------------------------------------------------------------------------------------------------- 1900ns 
		PC_LdEn  <= '1';											-- Setting write enable off 
		PC_sel   <= '1';											-- Choosing the first input of the multiplexer
		PC_Immed <= "11111111111111111111111111100001"; -- Setting the PC_immed value to -31
		wait for Clk_period;									   -- Expecting the PC equal to 0
		---------------------------------------------------------------------------------------------------------------- 2000ns
		Reset    <= '0';											-- Setting write enable off
		stop_the_clock <= true;
      wait;  
   end process; 
END;
 