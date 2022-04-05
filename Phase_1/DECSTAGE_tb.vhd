LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DECSTAGE_tb IS
END DECSTAGE_tb;
 
ARCHITECTURE behavior OF DECSTAGE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DECSTAGE
    PORT(
         RF_WrEn       : IN  std_logic;
         RF_WrData_sel : IN  std_logic;
         RF_B_sel 	  : IN  std_logic;
         immExt 		  : IN  std_logic_vector (1 downto 0);
         Clk 			  : IN  std_logic;
         Rst 			  : IN  std_logic;
         Instr         : IN  std_logic_vector(31 downto 0);
         ALU_out   	  : IN  std_logic_vector(31 downto 0);
         MEM_out 		  : IN  std_logic_vector(31 downto 0);
         Immed   		  : OUT  std_logic_vector(31 downto 0);
         RF_A    		  : OUT  std_logic_vector(31 downto 0);
         RF_B    		  : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RF_WrEn : std_logic := '0';
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal immExt : std_logic_vector(1 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);
 
   -- Clock period definitions
   constant CLK_period : time := 100 ns;
	signal stop_the_clock: boolean;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECSTAGE PORT MAP (
          RF_WrEn => RF_WrEn,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          immExt => immExt,
          Clk => Clk,
          Rst => Rst,
          Instr => Instr,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B
        );

   -- Clock process definitions
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
		Rst <= '0'; 												-- Irrelevant 	 			
		RF_WrEn <= '1';											-- Write enable will be on for following tests.
		--------------------------------------------------------------------------------------------------------------- 0ns
		Instr <= "00000000111001111111110000000000";	   -- Setting 31-26->0s, 25-21->7, 20-16->7, 15-11->63, 10-0->0.
					 
		MEM_out <= "00000000000000000000000000000100";  -- Setting MEM_out equal to 4.
		ALU_out <= "00000000000000000000000000000101";  -- Setting ALU_out equal to 5.
		RF_WrData_sel <= '0';								   -- Choosing MEM_out for DataIn.	
		immExt <= "00";											-- Choosing sign extend to 32 bits.  	
		wait for Clk_period;										-- Expecting RF_A equal to 4 and RF_A equal to 0.
	   --------------------------------------------------------------------------------------------------------------- 100ns
		Instr(31 downto 26) <= "000000";						-- 0 irrelevant.
		Instr(25 downto 21) <= "00111";						-- Reading from register 7.
		Instr(20 downto 16) <= "01000";						-- Writing on register 8.
		Instr(15 downto 0)  <= "0100011111111111";	   -- Reading from register 8
		MEM_out <= "00000000000000000000000000000100";  -- Setting MEM_out equal to 6.
		ALU_out <= "00000000000000000000000000000111";  -- Setting ALU_out equal to 7.
		RF_WrData_sel <= '1';								   -- Choosing ALU_out for DataIn.	
		RF_B_sel <= '0';											-- Choosing the first input on the mux.
		immExt <= "01";											-- Choosing sign extend to 32 bits.  	
		wait for Clk_period;										-- Expecting RF_A equal to 4 and RF_A equal to 7.
		--------------------------------------------------------------------------------------------------------------- 200ns
		RF_WrEn <= '0';											-- Write enable will be off for following tests.
		Instr(31 downto 26) <= "000000";						-- 0 irrelevant.
		Instr(25 downto 21) <= "01000";						-- Reading from register 8.
		Instr(20 downto 16) <= "00111";						-- Writing on register 7.
		Instr(15 downto 0)  <= "0011111111111111";	   -- Reading from register 7
		MEM_out <= "00000000000000000000000000001001";  -- Setting MEM_out equal to 9.
		ALU_out <= "00000000000000000000000000001001";  -- Setting ALU_out equal to 9.
		RF_WrData_sel <= '1';								   -- Choosing ALU_out for DataIn.
		RF_B_sel <= '1';											-- Choosing the first input on the mux.
		immExt <= "10";											-- Choosing  	
		wait for Clk_period;										-- Expecting RF_A equal to 7 and RF_A equal to 4.
		--------------------------------------------------------------------------------------------------------------- 300ns
		Rst <= '1';
		RF_WrEn <= '1';											-- Write enable will be off for following tests.
		Instr(31 downto 26) <= "000000";						-- 0 irrelevant.
		Instr(25 downto 21) <= "01000";						-- Reading from register 8.
		Instr(20 downto 16) <= "00111";						-- Writing on register 7.
		Instr(15 downto 0)  <= "0011111111111111";	   -- Reading from register 7
		MEM_out <= "00000000000000000000000000001001";  -- Setting MEM_out equal to 9.
		ALU_out <= "00000000000000000000000000001001";  -- Setting ALU_out equal to 9.
		RF_WrData_sel <= '1';								   -- Choosing ALU_out for DataIn.
		RF_B_sel <= '1';											-- Choosing the first input on the mux.
		immExt <= "11";											-- Choosing  	
		wait for Clk_period;										-- Expecting RF_A equal to 7 and RF_A equal to 4.
		--------------------------------------------------------------------------------------------------------------- 400ns
		stop_the_clock <= true;
      wait; 
   end process;
END;
