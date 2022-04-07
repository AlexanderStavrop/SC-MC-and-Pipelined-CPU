LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY PROS_SC_tb IS
END PROS_SC_tb;
 
ARCHITECTURE behavior OF PROS_SC_tb IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
	component PROC_SC
		port( Clk, Reset, PC_LdEnbl : in  std_logic);
    end component;
    
   --Inputs
   signal Clk 		  : std_logic := '0';
   signal Reset 	  : std_logic := '0';
   signal PC_LdEnbl : std_logic := '0';

    -- Clock period definitions
   constant clk_period: time := 100 ns;
	signal stop_the_clock: boolean;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PROC_SC 
		PORT MAP ( Clk 		=> Clk,
					  Reset  	=> Reset,
					  PC_LdEnbl => PC_LdEnbl
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
		Reset <= '1';
		wait for clk_period*2;	
		Reset <= '0';
		PC_LdEnbl <= '1';
		wait for clk_period*48;
		
		stop_the_clock <= true;
      wait;
   end process;

END;  
