LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY IFSTAGE_tb IS
END IFSTAGE_tb;
 
ARCHITECTURE behavior OF IFSTAGE_tb IS 
 
   -- Component Declaration for the Unit Under Test (UUT)
	COMPONENT IFSTAGE
		port ( PC_sel, PC_LdEn, Reset, Clk : in  std_logic;
			   PC_Immed 			       : in  std_logic_vector(31 downto 0);
			   PC 				           : out std_logic_vector(31 downto 0)
		);
   END COMPONENT;
    
	 component RAM is
		port ( clk, data_we 		 	   : in  std_logic;
			   inst_addr, data_addr  	   : in  std_logic_vector(10 downto 0);
			   data_din 			 	   : in  std_logic_vector(31 downto 0);
			   inst_dout			 	   : out std_logic_vector(31 downto 0);
			   data_dout 			 	   : out std_logic_vector(31 downto 0)
		);
	end component; 

   -- Input signal
	signal Clk       : std_logic := '0';
	signal Reset     : std_logic := '0';
	signal PC_Immed  : std_logic_vector(31 downto 0) := (others => '0');
	signal data_we   : std_logic := '0';
	signal PC_sel    : std_logic := '0';
	signal PC_LdEn   : std_logic := '0';
	

 	-- Output signal
	signal PC 	     : std_logic_vector(31 downto 0);
	signal inst_dout : std_logic_vector(31 downto 0);

	-- Clock period definitions
	constant Clk_period  : time := 100 ns;
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
	
	RAM_MODULE: RAM
		PORT MAP ( clk        => Clk, 
				   data_we    => '0',
				   inst_addr  => PC (12 downto 2),
				   data_addr  => "00000000000",
				   data_din   => "00000000000000000000000000000000",
				   inst_dout  => inst_dout,
				   data_dout  => open
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
--------------------------------------------------------------------------------------------------------------------------
	-- Testing if PC_LdEn works as intented
		-------------------------------------------------------------------------------------------------------------------- 0ns
		-- Testing if PC_Immed value affects the value of PC when PC_LdEn is off.
		-------------------------------------------------------------------------------------------------------------------- 0ns
		PC_LdEn  <= '0';								-- Write enable will be off for the following tests
		Reset    <= '0';								-- Reset will be off for the following tests
		-------------------------------------------------------------------------------------------------------------------- 0ns
		PC_Immed <= "00000000000000000000000000000010"; -- Setting the PC_immed value to 2
		PC_sel   <= '0';								-- Choosing the first input of the multiplexer
		wait for Clk_period;							-- Expecting PC and inst_dout  equal to 0 
		-------------------------------------------------------------------------------------------------------------------- 100ns
		PC_Immed <= "00000000000000000000000000001111"; -- Setting the PC_immed value to 15
		PC_sel   <= '1';								-- Choosing the first input of the multiplexer
		wait for Clk_period;							-- Expecting PC and inst_dout equal to 0 and 
		-------------------------------------------------------------------------------------------------------------------- 200ns	
		-- Testing negative numbers.
		-------------------------------------------------------------------------------------------------------------------- 200ns
		PC_Immed <= "11111111111111111111111111111111"; -- Setting the PC_immed value to -1
		PC_sel   <= '0';								-- Choosing the second input of the multiplexer
		wait for Clk_period;							-- Expecting PC and inst_dout equal to 0
		-------------------------------------------------------------------------------------------------------------------- 300ns
		PC_Immed <= "11111111111111111111111111110001"; -- Setting the PC_immed value to -15
		PC_sel   <= '1';								-- Choosing the second input of the multiplexer
		wait for Clk_period;							-- Expecting PC and inst_dout equal to 0
		-------------------------------------------------------------------------------------------------------------------- 400ns		
		-- Testing if PC_Immed value affects the value of PC when PC_LdEn is on and we choose the 1st input of the mux.
		-------------------------------------------------------------------------------------------------------------------- 400ns
		PC_LdEn  <= '1';								-- Write enable will be on for the following tests
		PC_sel   <= '0';								-- Choosing the first input of the multiplexer
		-------------------------------------------------------------------------------------------------------------------- 400ns
		PC_Immed <= "00000000000000000000000000000100"; -- Setting the PC_immed value to 6
		wait for Clk_period*4;							-- Expecting the value of PC to increment by 4, every clock
														-- 	and inst_dout out equal to 1 through 4
		-------------------------------------------------------------------------------------------------------------------- 800ns
		-- Testing negative number.
		-------------------------------------------------------------------------------------------------------------------- 800ns
		PC_Immed <= "11111111111111111111111111111100"; -- Setting the PC_immed value to -4
		wait for Clk_period;							-- Expecting the PC equal to 20 and inst_dout out equal to 6
		-------------------------------------------------------------------------------------------------------------------- 900ns
		
--------------------------------------------------------------------------------------------------------------------------
	-- Testing if the Pc_Immed is pass correctly through the multiplexer
		-------------------------------------------------------------------------------------------------------------------- 900ns
		PC_LdEn  <= '1';								-- Write enable will be on for the following tests
		Reset    <= '0';								-- Reset will be off for the following tests
		-------------------------------------------------------------------------------------------------------------------- 900ns
		PC_sel   <= '1';								-- Choosing the second input of the multiplexer
		PC_Immed <= "00000000000000000000000000000100"; -- Setting the PC_immed value to 4
		wait for Clk_period;							-- Expecting the PC equal to 28 and inst_dout to 8
		-------------------------------------------------------------------------------------------------------------------- 1000ns
		PC_sel   <= '0';								-- Choosing the second input of the multiplexer
		wait for Clk_period*3;							-- Expecting the PC increment by 4 and inst_dout by 1, in every clock
		-------------------------------------------------------------------------------------------------------------------- 1300ns	
		-- Testing negative numbers.
		-------------------------------------------------------------------------------------------------------------------- 1300ns
		PC_sel   <= '1';								-- Choosing the second input of the multiplexer
		PC_Immed <= "11111111111111111111111111110000"; -- Setting the PC_immed value to -16
		wait for Clk_period;							-- Expecting the PC equal to and inst_dout to 8
		-------------------------------------------------------------------------------------------------------------------- 1400ns
		PC_sel   <= '0';								-- Choosing the second input of the multiplexer
		wait for Clk_period*3;							-- Expecting the PC increment by 4 and inst_dout by 1 in every clock 
		-------------------------------------------------------------------------------------------------------------------- 1700ns
		 
--------------------------------------------------------------------------------------------------------------------------  
	-- Testing that the reset works as expected
		-------------------------------------------------------------------------------------------------------------------- 1700ns
		Reset    <= '1';								-- Reset will be on for the following tests
		-------------------------------------------------------------------------------------------------------------------- 1700ns
		PC_LdEn  <= '0';								-- Setting write enable off. 
		PC_sel   <= '0';								-- Choosing the first input of the multiplexer	
		PC_Immed <= "00000000000000000000000000000000"; -- Setting the PC_immed value to 0
		wait for Clk_period;							-- Expecting the PC equal to 0 and inst_dout 1
		-------------------------------------------------------------------------------------------------------------------- 1800ns
		PC_LdEn  <= '1';								-- Setting write enable off
		PC_sel   <= '1';								-- Choosing the first input of the multiplexer
		PC_Immed <= "00000000000000000000000000000111"; -- Setting the PC_immed value to 
		wait for Clk_period;							-- Expecting the PC equal to 0 and inst_dout 1
		-------------------------------------------------------------------------------------------------------------------- 1900ns 
		PC_LdEn  <= '1';								-- Setting write enable off 
		PC_sel   <= '1';								-- Choosing the first input of the multiplexer
		PC_Immed <= "11111111111111111111111111100001"; -- Setting the PC_immed value to -31
		wait for Clk_period;							-- Expecting the PC equal to 0 and inst_dout 1
		-------------------------------------------------------------------------------------------------------------------- 2000ns
		Reset    <= '0';								-- Setting write enable off
		stop_the_clock <= true;
      wait;  
   end process; 
END;
 