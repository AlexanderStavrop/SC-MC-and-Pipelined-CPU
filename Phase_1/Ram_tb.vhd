LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;
  
ENTITY Ram_tb IS
END Ram_tb;
 
ARCHITECTURE behavior OF Ram_tb IS 
	-- Creating the component of RegisterFile
   COMPONENT Ram
		PORT ( clk, data_we 		    : IN  std_logic;
		    	 inst_addr, data_addr : IN  std_logic_vector(10 downto 0);
             data_din 				 : IN  std_logic_vector(31 downto 0);
             inst_dout, data_dout : OUT  std_logic_vector(31 downto 0)
		);
	END COMPONENT;
    

   -- Input Signals
   signal clk       : std_logic := '0';
   signal data_we   : std_logic := '0';
   signal inst_addr : std_logic_vector(10 downto 0) := (others => '0');
   signal data_addr : std_logic_vector(10 downto 0) := (others => '0');
   signal data_din  : std_logic_vector(31 downto 0) := (others => '0');

 	-- Output Signals
   signal inst_dout : std_logic_vector(31 downto 0);
   signal data_dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
   signal stop_the_clock: boolean;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ram PORT MAP ( clk => clk,
							  data_we => data_we,
							  inst_addr => inst_addr,
							  data_addr => data_addr,
							  data_din => data_din,
							  inst_dout => inst_dout,
							  data_dout => data_dout
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
	-- Testing if the initialization was sucessful and the instruction address is passed correctly to the data_dout.
		------------------------------------------------------------------------------------------------------------------------ 0ns
		data_we   <= '0';											 	-- Write enable will be off for the following tests.
		----------------------------------------------------- 0ns
		data_din  <= "00000000000000000000000000000000";   -- Setting data in to 0s.
		inst_addr <= "00000000000";							 	-- Setting the instruction address to 0.
		data_addr <= "00000000000";								-- Setting the data address to 0.
		wait for clk_period;											-- Waiting for the data and instruciton address values to be the correct.
		------------------------------------------------------------------------------------------------------------------------ 100ns
		for i in 1 to 7 loop									 		-- Looping for the addresses 1 to 7.
			inst_addr <= inst_addr + 1;		 					-- Incrementing the instruction address by 1.						
			data_addr <= data_addr + 1;							-- Incrementing the data address by 1.			
         wait for clk_period;									   -- Expecting data_out equal to data_in plus 1 and inst_out equal to inst_in plus 1
      end loop;														-- 	and the inst_out equal to inst_addr.
		------------------------------------------------------------------------------------------------------------------------ 800ns
		data_din  <= "11111111111111111111111111111111"; 	-- Setting data in to 1s to see that it has no effect.
		inst_addr <= "00000001100";							 	-- Setting the instruction address to 12.
		data_addr <= "00000001100";								-- Setting the data address to 12.
		wait for clk_period;											-- Waiting for the data and instruciton address values to be the correct.
		------------------------------------------------------------------------------------------------------------------------ 900ns
		for i in 13 to 18 loop									 	-- Looping for the addresses 13 to 18.
			inst_addr <= inst_addr + 1;		 				   -- Incrementing the instruction address by 1.								
			data_addr <= data_addr + 1;						   -- Incrementing the data address by 1.					
         wait for clk_period;										-- Expecting data_out equal to data_in plus 1 and inst_out equal to inst_in plus 1
      end loop;														-- 	and the inst_out equal to inst_addr.
		------------------------------------------------------------------------------------------------------------------------ 1500ns
		inst_addr <= "00000011010";							 	-- Setting the instruction address to 26.
		data_addr <= "00000011010";								-- Setting the data address to 26.
		wait for clk_period;											-- Waiting for the data address value to be the correct on.
		------------------------------------------------------------------------------------------------------------------------ 1600ns
		for i in 27 to 35 loop									 	-- Looping for the addresses 27 to 35.
			inst_addr <= inst_addr + '1';		 					-- Incrementing the instruction address by 1.							
			data_addr <= data_addr + '1';							-- Incrementing the data address by 1.	
         wait for clk_period;		  								-- Expecting data_out equal to data_in plus 1 until address 30 and then zeros,due to the initialization
      end loop;		 												--   and inst_out equal to inst_in plus 1 until address 30 and then zeros,due to the initialization.
		------------------------------------------------------------------------------------------------------------------------ 2500ns
		inst_addr <= "00000001001";							 	-- Setting the instruction address to 9.
		data_addr <= "00000001001";                      	-- Setting the data address to 9.
      wait for clk_period;				                     -- Expecting the data_out 10
		------------------------------------------------------------------------------------------------------------------------ 2600ns
		
------------------------------------------------------------------------------------------------------------------------------ 
	-- Testing if data_we works correctly
		------------------------------------------------------------------------------------------------------------------------ 2600ns
		inst_addr <= "00000000000";							 	-- Instruction addres will be set to 0s for the following tests.
		------------------------------------------------------------------------------------------------------------------------ 2600ns
		data_addr <= "00000000010";								-- Setting the data address to 2.
		data_din  <= "00000000000000000000011011011010"; 	-- Setting data_in to 1754.
		wait for clk_period;											-- Waiting for the data address value to be the correct on and expecting data_out equal to 3.
		------------------------------------------------------------------------------------------------------------------------ 2700ns
		data_we <= '1';											 	-- Data write enable is on.
		for i in 3 to 7 loop									 		-- Looping for the addresses 3 to 7.
			data_addr <= data_addr + 1;							-- Incrementing the data address by 1.
         data_din  <= data_din  + 2;						 	-- Incrementing the data in by 2.			
 			wait for clk_period;										-- Expecting data_out equal 1754 + i*2 after 12ns from clocks rising edge.
      end loop;
		------------------------------------------------------------------------------------------------------------------------ 3100ns
		data_addr <= "00010000100";							 	-- Choosing data_addr 132.
		data_din  <= "00000000000000000001100100100000"; 	-- Setting data_in to 6432.
      wait for clk_period;			 							 	-- Expecting Data out 6432 after 12ns from clocks rising edge.
 		------------------------------------------------------------------------------------------------------------------------ 3200ns
		for i in 133 to 136 loop									-- Looping for the addresses 133 to 136.
			data_addr <= data_addr + 1;							-- Incrementing the data address by 1.
         data_din  <= data_din  + 2;						 	-- Incrementing the data in by 2.			
 			wait for clk_period;										-- Expecting data_out equal to the previews data_in plus 2.
      end loop;
		------------------------------------------------------------------------------------------------------------------------ 3700ns
		data_we  <= '0';												-- Write enable is off.
		data_din <= "11111111111111111111111111111111"; 	-- Setting data_in to 1s.
		data_addr <= "00000000010";								-- Setting the data address to 2.
      wait for clk_period;			 							 	-- Expecting Data out equal to 3.
		------------------------------------------------------------------------------------------------------------------------ 3800ns
		for i in 3 to 7 loop									 		-- Looping for the addresses 3 to 7.
			data_addr <= data_addr + 1;							-- Incrementing the data address by 1.
 			wait for clk_period;										-- Expecting data_out equal to 1754 + i*2.
      end loop;
		------------------------------------------------------------------------------------------------------------------------ 4300ns
		data_addr <= "00010000100";								-- Setting the data address to 132.
      wait for clk_period;			 							 	-- Expecting Data out equal to 6432.
		------------------------------------------------------------------------------------------------------------------------ 4400ns
		for i in 133 to 136 loop									-- Looping for the addresses 133 to 136.
			data_addr <= data_addr + 1;							-- Incrementing the data address by 1.
 			wait for clk_period;										-- Expecting data_out equal to 6432 + i*2.
      end loop;
		------------------------------------------------------------------------------------------------------------------------ 4800ns
		stop_the_clock <= true;
		wait;
   end process;

END;
