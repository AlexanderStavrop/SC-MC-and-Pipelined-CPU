LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY PROCESSOR_MC_tb IS
END PROCESSOR_MC_tb;
 
ARCHITECTURE behavior OF PROCESSOR_MC_tb IS 
 
	component PROCESSOR_MC
		port ( Clk, Reset			  : in  std_logic;
			   MM_RdData, Instruction : in  std_logic_vector (31 downto 0);
			   MM_WrEn			  	  : out std_logic;
			   PC, MM_Addr, MM_WrData : out std_logic_vector (31 downto 0)
		);
    end component;
    
	component RAM is
		 port ( Clk, data_we 		  : in  std_logic;
				inst_addr, data_addr  : in  std_logic_vector(10 downto 0);
				data_din 			  : in  std_logic_vector(31 downto 0);
				inst_dout			  : out std_logic_vector(31 downto 0);
				data_dout 			  : out std_logic_vector(31 downto 0)
		);
	end component; 
	
	-- Input/output signals --------------------------------------------------
	signal Clk 		 	  : std_logic := '0';
	signal Reset 	 	  : std_logic := '0';
	signal MM_RdData 	  : std_logic_vector (31 downto 0);
	signal Instruction    : std_logic_vector (31 downto 0);
	signal MM_WrEn		  : std_logic;
	signal MM_Addr	 	  : std_logic_vector (31 downto 0);
	signal MM_WrData 	  : std_logic_vector (31 downto 0);
	signal PC			  : std_logic_vector (31 downto 0);
	
    -- Clock period definitions
	constant clk_period   : time := 30 ns; 			 
	signal stop_the_clock : boolean;
 
BEGIN
 
	uut: PROCESSOR_MC 
		PORT MAP ( Clk 		   => Clk,
				   Reset  	   => Reset,
				   PC		   => PC,
				   Instruction => Instruction,
				   MM_RdData   => MM_RdData,
				   MM_WrEn	   => MM_WrEn,
				   MM_Addr 	   => MM_Addr,
				   MM_WrData   => MM_WrData
		);

		
	Ram_Module: RAM
		port map ( Clk         => Clk,
				   data_we     => MM_WrEn,
				   inst_addr   => PC(12 downto 2),
				   data_addr   => MM_Addr(10 downto 0),
				   data_din    => MM_WrData,
				   inst_dout   => Instruction,
				   data_dout   => MM_RdData 
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
		----------------------------------- 3,510
		stop_the_clock <= true;
		wait;
   end process;

END;   

