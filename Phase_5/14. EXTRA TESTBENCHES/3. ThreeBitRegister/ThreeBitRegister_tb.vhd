LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ThreeBitRegister_tb IS
END ThreeBitRegister_tb;
 
architecture behavior of ThreeBitRegister_tb is
 
    component ThreeBitRegister
		Port ( Clk, Rst, WE, Din_1, Din_2, Din_3 : in  std_logic;
           Dout_1, Dout_2, Dout_3 			 : out std_logic
		);
    end component;
    

	--Inputs
	signal Clk 	  : std_logic := '0';
	signal Rst 	  : std_logic := '0';
	signal WE 	  : std_logic := '0';
	signal Din_1  : std_logic := '0';
	signal Din_2  : std_logic := '0';
	signal Din_3  : std_logic := '0';

 	--Outputs
	signal Dout_1 : std_logic;
	signal Dout_2 : std_logic;
	signal Dout_3 : std_logic;	

	-- Clock period definitions
	constant CLK_period   : time := 100 ns;
	signal stop_the_clock : boolean;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: ThreeBitRegister 
		Port map( Clk    => Clk,
				  Rst    => Rst,
				  WE     => WE,
				  Din_1  => Din_1,
				  Din_2  => Din_2,
				  Din_3  => Din_3,
				  Dout_1 => Dout_1,
				  Dout_2 => Dout_2,
				  Dout_3 => Dout_3
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
		RST   <= '0';			-- Reset will be set to 0 for the following tests
		WE    <= '0';			-- Write enable will be set to 0 for the following tests
		------------------------------------------------------------------------------------------------------- 0ns
		Din_1 <= '0'; 			-- Setting Din_1 equal to 0
		Din_2 <= '0'; 			-- Setting Din_2 equal to 0
		Din_3 <= '0'; 			-- Setting Din_3 equal to 0
      	wait for CLK_period; 	-- Expecting Dout_1 and Dout_2 and Dout_3 equal to 0
		------------------------------------------------------------------------------------------------------- 100ns
		Din_1 <= '1'; 			-- Setting Din_1 equal to 1
		Din_2 <= '1'; 			-- Setting Din_2 equal to 1
      	Din_3 <= '1'; 			-- Setting Din_3 equal to 0
      	wait for CLK_period; 	-- Expecting Dout_1 and Dout_2 and Dout_3 equal to 0
		------------------------------------------------------------------------------------------------------- 200ns
		WE    <= '1';				-- Setting write enable equal to 1
		------------------------------------------------------------------------------------------------------- 200ns
		Din_1 <= '0'; 			-- Setting Din_1 equal to 0
		Din_2 <= '1'; 			-- Setting Din_2 equal to 1
      	Din_3 <= '0'; 			-- Setting Din_3 equal to 0
      	wait for CLK_period; 	-- Expecting Dout_1 and Dout_3 equal to 0 and Dout_2 equal to 1
		------------------------------------------------------------------------------------------------------- 300ns
		Din_1 <= '1'; 			-- Setting Din_1 equal to 1
		Din_2 <= '0'; 			-- Setting Din_2 equal to 0
		Din_3 <= '1'; 			-- Setting Din_3 equal to 1
      	wait for CLK_period; 	-- Expecting Dout_1 and Dout_3 equal to 1 and Dout_2 equal to 0
		------------------------------------------------------------------------------------------------------- 400ns

	
---------------------------------------------------------------------------------------------------------------------
	-- Testing if the RST works correctly.
		------------------------------------------------------------------------------------------------------- 400ns
		RST   <= '1';			-- Reset will be set to 1 for the following tests
		Din_1 <= '1'; 			-- Setting Din_1 equal to 1 for the following tests
		Din_2 <= '1'; 			-- Setting Din_2 equal to 1 for the following tests
		Din_3 <= '1'; 			-- Setting Din_3 equal to 1 for the following tests
      	wait for CLK_period; 	-- Expecting Dout_1 and Dout_2 and Dout_3 equal to 0
		------------------------------------------------------------------------------------------------------- 500ns
		WE    <= '0';			-- Setting write enable to 0
		wait for CLK_period; 	-- Expecting Dout_1 and Dout_2 and Dout_3 equal to 0
		------------------------------------------------------------------------------------------------------- 600ns
		WE    <= '1';			-- Setting write enable to 1
		wait for CLK_period; 	-- Expecting Dout_1 and Dout_2 and Dout_3 equal to 0
		------------------------------------------------------------------------------------------------------- 700ns
		RST   <= '0'; 			-- Setting reset to 0
		wait for CLK_period; 	-- Expecting Dout_1 and Dout_2 and Dout_3 equal to 1
		------------------------------------------------------------------------------------------------------- 800ns		
		stop_the_clock <= true;
	   wait;
   end process;

end;
