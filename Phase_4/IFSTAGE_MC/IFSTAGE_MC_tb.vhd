LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
 
ENTITY IFSTAGE_MC_tb IS
END IFSTAGE_MC_tb;
 
ARCHITECTURE behavior OF IFSTAGE_MC_tb IS 
  
    component IFSTAGE_MC is
		port ( 	PC_LdEn, IRWrite, iorD, Reset, Clk 		 : in    std_logic;
					PCSource													 : in    std_logic_vector(1 downto 0);
					ALU_out, ALU_out_Reg, PC_in, Instr_in : in    std_logic_vector(31 downto 0);
					Address, PC_out, Instr_out        				 : out std_logic_vector(31 downto 0)
		);
	end component; 
    
	component RAM is
		port ( clk, data_we 		  			: in  std_logic;
				   inst_addr, data_addr 	: in  std_logic_vector(10 downto 0);
				   data_din 				  		: in  std_logic_vector(31 downto 0);
				   inst_dout				  		: out std_logic_vector(31 downto 0);
				   data_dout 			  			: out std_logic_vector(31 downto 0)
		);
	end component; 


	--Inputs
	signal Clk : std_logic := '0';
	signal Reset : std_logic := '0';
	signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
	signal ALU_out_Reg : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_in : std_logic_vector(31 downto 0) := (others => '0');
	signal iorD : std_logic := '0';
	signal IRWrite : std_logic := '0';
	signal PC_LdEn : std_logic := '0';
	signal PCSource : std_logic_vector(1 downto 0) := (others => '0');
	signal inst_dout : std_logic_vector(31 downto 0) := (others => '0');
	
 	--Outputs
   signal Address : std_logic_vector(31 downto 0);
   signal PC_out : std_logic_vector(31 downto 0);
   signal Instr_out : std_logic_vector(31 downto 0);
	
	-- Clock period definitions
	constant clk_period: time := 100 ns;
	signal stop_the_clock: boolean;
 
BEGIN	
	-- Instantiate the Unit Under Test (UUT)
	uut: IFSTAGE_MC 
		port map ( Clk 			  		 => Clk,
							Reset        		 => Reset,
							PC_LdEn   		 => PC_LdEn,
							IRWrite 	  		 => IRWrite,
							iorD 		  		 => iorD,
							PCSource 		 => PCSource,
							ALU_out   		 => ALU_out,
        					ALU_out_Reg => ALU_out_Reg,
          					PC_in 				 => PC_in,
          					Instr_in 			 => inst_dout,
          					Address 			 => Address,
          					PC_out 			 => PC_out,
          					Instr_out 		 => Instr_out
			);
			
	RAM_MODULE: RAM
		port map ( clk        		=> Clk, 
							data_we    	=> '0',
							inst_addr 	=> Address (12 downto 2),
							data_addr  => "00000000000",
							data_din 	=> x"00000000",
							inst_dout  	=> inst_dout,
							data_dout  => open
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
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
	-- Holding reset for 100ns
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0 ns
		Reset <= '1';
		wait for Clk_period;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 100 ns
	-- Testing if PC_LdEn works as inteded 
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 100 ns
		ALU_out				<= x"00000001"; 			-- Setting ALU_out equal to 1 for the following tests
		ALU_out_Reg	<= x"00000002"; 			-- Setting ALU_out_Reg equal to 1 for the following tests
		PC_in 					<= x"00000004";			-- Setting PC_in equal to 1 for the following tests
		IRWrite 				<= '1'; 							-- Setting the Instruction Registers write enable on
		iorD					<= '0';								-- Choosing the PC_out as the memory address
		Reset 					<= '0'; 							-- Setting Reset off for the following tests
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 100 ns
        PC_LdEn	<= '0';											-- Setting  PC_LdEn equal to 0
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 100 ns
        PCSource <= "00";									-- Choosing ALU_out as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 0 and instr_out equal to 1
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 200 ns
        PCSource <= "01";									-- Choosing ALU_out_Reg as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 0 and instr_out equal to 1
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 300 ns
        PCSource <= "10";									-- Choosing PC_in as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 0 and instr_out equal to 1
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 400 ns
        PCSource <= "11";									-- Choosing 0 as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 0 and instr_out equal to 1
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 500 ns
        PC_LdEn			 <= '1';								-- Setting  PC_LdEn equal to 1
		ALU_out			 <= x"00000004"; 			-- Setting ALU_out equal to 1 for the following tests
		ALU_out_Reg <= x"00000008"; 				-- Setting ALU_out_Reg equal to 1 for the following tests
		PCSource 		 <= "10";								-- Choosing PC_in as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 4 and instr_out equal to 1
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 600 ns
		for i in 1 to 3 loop							 			-- Looping for the 3 to 5
			PC_in <= PC_in + 4;								-- Incrementing the data address by 4
 			wait for clk_period;								-- Expecting address, PC_out to increment by 4 and instr_out by 1 in every cycle
		end loop;													-- Expecting address, PC_out equal to 16 and instr_out equal to 4
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 900 ns
		PCSource <= "00";									-- Choosing ALU_out as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 4 and instr_out equal to 2 in the next clock
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1000 ns
		PCSource <= "01";									-- Choosing ALU_out_Reg as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 8 and instr_out equal to 3 in the next clock
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1100 ns
		PCSource <= "11";									-- Choosing 0 as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 0 and instr_out equal to 1 in the next clock
		--------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1200 ns
		
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1200 ns
	-- Testing if IRWrite works as inteded 
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1200 ns
		IRWrite  	<= '1'; 									-- Setting the Instruction Registers write enable on 
		PCSource 	<= "10";									-- Choosing PC_in as the PC value
		wait for Clk_period*2;								-- Expecting address, PC_out equal to 16 and instr_out equal to 5
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1400 ns
		IRWrite  	<= '0'; 									-- Setting the Instruction Registers write enable off for the following tests
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1400 ns
		PCSource 	<= "00";									-- Choosing ALU_out as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 4 and instr_out 5
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1500 ns
		PCSource 	<= "01";									-- Choosing ALU_out_Reg as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 8 and instr_out 5
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1500 ns
		PCSource 	<= "11";									-- Choosing 0 as the PC value
		wait for Clk_period;									-- Expecting address, PC_out equal to 0 and instr_out 5
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1600 ns
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1600 ns
	-- Testing if the address mux works asynchronously 
		----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1600 ns	
		IRWrite  <= '1'; 											-- Setting the Instruction Registers write enable on 
		----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1700 ns	
		iorD <= '1';													-- Choosing the ALU_out_Reg as the memory address
		wait for 10 ns;											-- Expecting PC_out equal to 0, address equal to 8 and instr_out 0
		----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1710 ns
		iorD <= '0';													-- Choosing the PC_out as the memory address
		wait for 90 ns;											-- Expecting PC_out equal to 0, address equal to 0 and instr_out 1 after rising edge
		----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1800 ns
		Reset <= '1';												-- Setting reset to 1	
		wait for Clk_period;									-- Expecting address, PC_out and instr_out equal to 0 after rising edge
		---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1900 ns
		stop_the_clock <= true;		
		wait;
	end process;

END;