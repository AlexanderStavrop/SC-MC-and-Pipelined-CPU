LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY IFSTAGE_PIPELINE_tb IS
END IFSTAGE_PIPELINE_tb;
 
ARCHITECTURE behavior OF IFSTAGE_PIPELINE_tb IS 
 
   -- Component Declaration for the Unit Under Test (UUT)
	COMPONENT IFSTAGE_PIPELINE
		port ( PC_sel, PC_LdEn, Reset, Clk : in  std_logic;
			   PC_Immed 			       : in  std_logic_vector(31 downto 0);
			   PC, PC_4			           : out std_logic_vector(31 downto 0)
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
	signal PC 		 : std_logic_vector(31 downto 0);
	signal PC_4	     : std_logic_vector(31 downto 0);
	signal inst_dout : std_logic_vector(31 downto 0);

	-- Clock period definitions
	constant Clk_period  : time := 100 ns;
	signal stop_the_clock: boolean;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IFSTAGE_PIPELINE 
		Port map ( Clk      => Clk,
				   PC_sel   => PC_sel,
				   PC_LdEn  => PC_LdEn,
				   PC_Immed => PC_Immed,
				   PC       => PC,
				   PC_4     => PC_4,
				   Reset    => Reset
		);
	
	RAM_MODULE: RAM
		Port map ( clk        => Clk, 
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
---------------------------------------------------------------------------------------------------------------------------- 0ns
	-- Holding the reset for 200ns
	------------------------------------------------------------------------------------------------------------------------ 0ns
	Reset <= '1';										-- Setting the Reset on
	wait for Clk_period*2;								-- Waiting for 2 clock periods
	------------------------------------------------------------------------------------------------------------------------ 200ns
	Reset <= '0';										-- Setting the Reset off

---------------------------------------------------------------------------------------------------------------------------- 200ns
	-- Testing if PC_LdEn works as intented
		-------------------------------------------------------------------------------------------------------------------- 200ns
		-- Testing if PC_Immed value affects the value of PC when PC_LdEn is off.
		-------------------------------------------------------------------------------------------------------------------- 200ns
		PC_LdEn  <= '0';								-- Write enable will be off for the following tests
		Reset    <= '0';								-- Reset will be off for the following tests
		-------------------------------------------------------------------------------------------------------------------- 200ns
		PC_Immed <= "00000000000000000000000000000010"; -- Setting the PC_immed value to 2
		PC_sel   <= '0';								-- Choosing the first input of the multiplexer
		wait for Clk_period;							-- Expecting PC and inst_dout equal to 0 
		-------------------------------------------------------------------------------------------------------------------- 300ns
		PC_Immed <= "00000000000000000000000000001111"; -- Setting the PC_immed value to 15
		PC_sel   <= '1';								-- Choosing the first input of the multiplexer
		wait for Clk_period;							-- Expecting PC and inst_dout equal to 0 and 
		-------------------------------------------------------------------------------------------------------------------- 400ns	
		-- Testing negative numbers.
		-------------------------------------------------------------------------------------------------------------------- 400ns
		PC_Immed <= "11111111111111111111111111111111"; -- Setting the PC_immed value to -1
		PC_sel   <= '0';								-- Choosing the second input of the multiplexer
		wait for Clk_period;							-- Expecting PC and inst_dout equal to 0
		-------------------------------------------------------------------------------------------------------------------- 500ns
		PC_Immed <= "11111111111111111111111111110001"; -- Setting the PC_immed value to -15
		PC_sel   <= '1';								-- Choosing the second input of the multiplexer
		wait for Clk_period;							-- Expecting PC and inst_dout equal to 0
		-------------------------------------------------------------------------------------------------------------------- 600ns		
		-- Testing if PC_Immed value affects the value of PC when PC_LdEn is on and we choose the 1st input of the mux.
		-------------------------------------------------------------------------------------------------------------------- 600ns
		PC_LdEn  <= '1';								-- Write enable will be on for the following tests
		PC_sel   <= '0';								-- Choosing the first input of the multiplexer
		-------------------------------------------------------------------------------------------------------------------- 600ns
		PC_Immed <= "00000000000000000000000000000100"; -- Setting the PC_immed value to 6
		wait for Clk_period*4;							-- Expecting the value of PC to increment by 4, every clock
														-- 	and inst_dout out equal to 1 through 4
		-------------------------------------------------------------------------------------------------------------------- 1000ns
		-- Testing negative number.
		-------------------------------------------------------------------------------------------------------------------- 1000ns
		PC_Immed <= "11111111111111111111111111111100"; -- Setting the PC_immed value to -4
		wait for Clk_period;							-- Expecting the PC equal to 20 and inst_dout out equal to 6
		-------------------------------------------------------------------------------------------------------------------- 1100ns
		
--------------------------------------------------------------------------------------------------------------------------
	-- Testing if the Pc_Immed is pass correctly through the multiplexer
		-------------------------------------------------------------------------------------------------------------------- 1100ns
		PC_LdEn  <= '1';								-- Write enable will be on for the following tests
		Reset    <= '0';								-- Reset will be off for the following tests
		-------------------------------------------------------------------------------------------------------------------- 1100ns
		PC_sel   <= '1';								-- Choosing the second input of the multiplexer
		PC_Immed <= "00000000000000000000000000000100"; -- Setting the PC_immed value to 4
		wait for Clk_period;							-- Expecting the PC equal to 4 and inst_dout to 2
		-------------------------------------------------------------------------------------------------------------------- 1200ns
		PC_sel   <= '0';								-- Choosing the second input of the multiplexer
		wait for Clk_period*3;							-- Expecting the PC increment by 4 and inst_dout by 1, in every clock
		-------------------------------------------------------------------------------------------------------------------- 1500ns	
		-- Testing negative numbers.
		-------------------------------------------------------------------------------------------------------------------- 1500ns
		PC_sel   <= '1';								-- Choosing the second input of the multiplexer
		PC_Immed <= "00000000000000000000000000001000"; -- Setting the PC_immed value to 8
		wait for Clk_period;							-- Expecting the PC equal to 8 and inst_dout to 3
		-------------------------------------------------------------------------------------------------------------------- 1600ns
		PC_sel   <= '0';								-- Choosing the second input of the multiplexer
		wait for Clk_period*3;							-- Expecting the PC increment by 4 and inst_dout by 1 in every clock 
		-------------------------------------------------------------------------------------------------------------------- 1900ns
		 
--------------------------------------------------------------------------------------------------------------------------  
	-- Testing that the reset works as expected
		-------------------------------------------------------------------------------------------------------------------- 1900ns
		Reset    <= '1';								-- Reset will be on for the following tests
		-------------------------------------------------------------------------------------------------------------------- 1900ns
		PC_LdEn  <= '0';								-- Setting write enable off. 
		PC_sel   <= '0';								-- Choosing the first input of the multiplexer	
		PC_Immed <= "00000000000000000000000000000000"; -- Setting the PC_immed value to 0
		wait for Clk_period;							-- Expecting the PC equal to 0 and inst_dout 1
		-------------------------------------------------------------------------------------------------------------------- 2000ns
		PC_LdEn  <= '1';								-- Setting write enable off
		PC_sel   <= '1';								-- Choosing the first input of the multiplexer
		PC_Immed <= "00000000000000000000000000000111"; -- Setting the PC_immed value to 
		wait for Clk_period;							-- Expecting the PC equal to 0 and inst_dout 1
		-------------------------------------------------------------------------------------------------------------------- 2100ns 
		PC_LdEn  <= '1';								-- Setting write enable off 
		PC_sel   <= '1';								-- Choosing the first input of the multiplexer
		PC_Immed <= "11111111111111111111111111100001"; -- Setting the PC_immed value to -31
		wait for Clk_period;							-- Expecting the PC equal to 0 and inst_dout 1
		-------------------------------------------------------------------------------------------------------------------- 2200ns
		stop_the_clock <= true;
      wait;  
   end process; 
END;
 