LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY PROCESSOR_MC_tb IS
END PROCESSOR_MC_tb;
 
ARCHITECTURE behavior OF PROCESSOR_MC_tb IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
	component PROCESSOR_MC
		port( Clk, Reset : in  std_logic);
    end component;
    
	--Inputs
	signal Clk 		 	  : std_logic := '0';
	signal Reset 	 	  : std_logic := '0';

    -- Clock period definitions
	constant clk_period   : time := 30 ns; 			-- ?p??e? ap? 22 ?a? p??? 
	signal stop_the_clock : boolean;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: PROCESSOR_MC 
		PORT MAP ( Clk 		 => Clk,
				   Reset  	 => Reset
		);

	-- Clock process definitions
   clocking: process
	  begin
		 while not stop_the_clock loop
			Clk <= '0', '1' after clk_period / 2;
			wait for clk_period;
		 end loop;
		 wait; 
	end process;
 

	-- Stimulus process
	stim_proc: process
	begin		 
------------------------------------------- 0ns
	-- Holding reset for 2 clk periods
		----------------------------------- 0ns
		Reset <= '1';
		wait for clk_period*2;	
		----------------------------------- 200ns		
 
------------------------------------------- 200ns
	-- Running the processor for 22 cycles
	    ----------------------------------- 200ns		
		Reset <= '0';
		wait for clk_period*115;
		----------------------------------- 2200ns
		stop_the_clock <= true;
		wait;
   end process;

END;   

