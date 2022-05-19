LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DECSTAGE_PIPELINE_tb IS
END DECSTAGE_PIPELINE_tb;
 
ARCHITECTURE behavior OF DECSTAGE_PIPELINE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component DECSTAGE_PIPELINE
		Port ( Clk, Rst 							: in  std_logic;
			   RF_WrEn, RF_WrData_sel, RF_B_sel 	: in  std_logic;
			   immExt								: in  std_logic_vector ( 1 downto 0);
			   RD_IN							   	: in  std_logic_vector ( 4 downto 0);
			   Instruction, ALU_out, MEM_out 	  	: in  std_logic_vector (31 downto 0);
			   RS_out, RD_out, RT_out, Mux_RDRT_Out	: out std_logic_vector ( 4 downto 0); 
			   Immed, RF_A, RF_B, Mux_WrData		: out std_logic_vector (31 downto 0) 
		 );
    end component;
    

	--Inputs
	signal Clk 			  : std_logic := '0';
	signal Rst 			  : std_logic := '0';
	signal RF_WrEn 		  : std_logic := '0';
	signal RF_WrData_sel  : std_logic := '0';
	signal RF_B_sel 	  : std_logic := '0';
	signal immExt 		  : std_logic_vector( 1 downto 0) := (others => '0');
	signal RD_IN 		  : std_logic_vector( 4 downto 0) := (others => '0');
	signal Instruction 	  : std_logic_vector(31 downto 0) := (others => '0');
	signal ALU_out 		  : std_logic_vector(31 downto 0) := (others => '0');
	signal MEM_out 		  : std_logic_vector(31 downto 0) := (others => '0');
	
 	--Outputs
	signal RS_out 		  : std_logic_vector( 4 downto 0);
	signal RD_out 		  : std_logic_vector( 4 downto 0);
	signal RT_out 		  : std_logic_vector( 4 downto 0);
	signal Mux_RDRT_Out   : std_logic_vector( 4 downto 0);
	signal Immed 		  : std_logic_vector(31 downto 0);
	signal RF_A 		  : std_logic_vector(31 downto 0);
	signal RF_B 		  : std_logic_vector(31 downto 0);
	signal Mux_WrData 	  : std_logic_vector(31 downto 0);

	-- Clock period definitions
	constant CLK_period   : time := 100 ns;
	signal stop_the_clock : boolean;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: DECSTAGE_PIPELINE 
		Port map ( Clk 			 => Clk,
				   Rst 			 => Rst,
				   RF_WrEn 		 => RF_WrEn,
				   RF_WrData_sel => RF_WrData_sel,
				   RF_B_sel 	 => RF_B_sel,
				   immExt 	  	 => immExt,
				   RD_IN 		 => RD_IN,
				   Instruction 	 => Instruction,
				   ALU_out 		 => ALU_out,
				   MEM_out 		 => MEM_out,
				   RS_out 		 => RS_out,
				   RD_out 		 => RD_out,
				   RT_out 		 => RT_out,
				   Mux_RDRT_Out  => Mux_RDRT_Out,
				   Immed 		 => Immed,
				   RF_A 		 => RF_A,
				   RF_B 		 => RF_B,
				   Mux_WrData 	 => Mux_WrData
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
-------------------------------------------------------------------------------------------------------------------------------------
	-- Holding reset for 2 Clk periods
		----------------------------------------------------------------------------------------------------------------------------- 0ns
		Rst <= '1';										 -- Setting Reset on 
		wait for Clk_period*2;
		----------------------------------------------------------------------------------------------------------------------------- 200ns
		Rst <= '0'; 									 -- Setting Reset off	 			

-------------------------------------------------------------------------------------------------------------------------------------
	-- Testing if writing to register works as intented
		----------------------------------------------------------------------------------------------------------------------------- 200ns
		RF_WrEn <= '1';									 -- Write enable will be on for following tests.
		----------------------------------------------------------------------------------------------------------------------------- 200ns
		Instruction(31 downto 26) <= "000000";			 -- 0 irrelevant.
		Instruction(25 downto 21) <= "00111";			 -- Reading from register 7
		Instruction(20 downto 16) <= "01000";			 -- Choosing RD equal to 8
		Instruction(15 downto 0)  <= "0001011111111111"; -- Setting RT to 2 and immed to 0x17FF
		MEM_out <= "00000000000000000000000000000100";   -- Setting MEM_out equal to 4
		ALU_out <= "00000000000000000000000000000101";   -- Setting ALU_out equal to 5
		RF_WrData_sel <= '0';							 -- Choosing ALU_out for DataIn
		RF_B_sel	  <= '0';							 -- Choosing the first input on the mux
		immExt		  <= "00";							 -- Choosing zero-fill on the 16 upper bits
		RD_IN 		  <= "00111";						 -- Writing on register 7
		wait for Clk_period;							 -- Expecting RF_A  	   -> 5, RF_B       -> 0, Immed 	 -> 0x000017FF
														 --  		  RS_out 	   -> 7, RD_out     -> 8, RT_out     -> 2
														 --			  Mux_RDRT_out -> 2, Mux_WrData -> 5
        ----------------------------------------------------------------------------------------------------------------------------- 300ns
		Instruction(31 downto 26) <= "000000";			 -- 0 irrelevant.
		Instruction(25 downto 21) <= "01111";			 -- Reading from register 15
		Instruction(20 downto 16) <= "00111";			 -- Choosing RD equal to 7
		Instruction(15 downto 0)  <= "1011011111111111"; -- Setting RT to 22 and immed to 0x37FF
		MEM_out <= "00000000000000000000000000001100";   -- Setting MEM_out equal to 12
		ALU_out <= "00000000000000000000000000000111";   -- Setting ALU_out equal to 7
		RF_WrData_sel <= '0';							 -- Choosing ALU_out for DataIn
		RF_B_sel	  <= '0';							 -- Choosing the first input on the mux
		immExt		  <= "01";							 -- Choosing sign extend to 32 bits
		RD_IN 		  <= "10110";						 -- Writing on register 22
		wait for Clk_period;							 -- Expecting RF_A  	   -> 0 , RF_B       -> 7, Immed 	 -> 0xFFFFB7FF
														 --  		  RS_out 	   -> 15, RD_out     -> 7, RT_out    -> 22
														 --			  Mux_RDRT_out -> 22, Mux_WrData -> 7
        ----------------------------------------------------------------------------------------------------------------------------- 400ns
		Instruction(31 downto 26) <= "000000";			 -- 0 irrelevant.
		Instruction(25 downto 21) <= "01011";			 -- Reading from register 11
		Instruction(20 downto 16) <= "01101";			 -- Choosing RD equal to 13
		Instruction(15 downto 0)  <= "0000111111111111"; -- Setting RT to 1 and immed to 0x0FFF
		MEM_out <= "00000000000000000000000000001111";   -- Setting MEM_out equal to 15
		ALU_out <= "00000000000000000000000000000011";   -- Setting ALU_out equal to 3
		RF_WrData_sel <= '1';							 -- Choosing MEM_out for DataIn
		RF_B_sel	  <= '1';							 -- Choosing the second input on the mux
		immExt		  <= "10";							 -- Choosing zerofill on the lower 16 bits
		RD_IN 		  <= "01101";						 -- Writing on register 13
		wait for Clk_period;							 -- Expecting RF_A  	   -> 0 , RF_B       -> 15, Immed -> 0x0FFF0000
														 --  		  RS_out 	   -> 11, RD_out     -> 13, RT_out -> 1
														 --			  Mux_RDRT_out -> 13, Mux_WrData -> 15
        ----------------------------------------------------------------------------------------------------------------------------- 500ns
		Instruction(31 downto 26) <= "000000";			 -- 0 irrelevant.
		Instruction(25 downto 21) <= "11111";			 -- Reading from register 31
		Instruction(20 downto 16) <= "01110";			 -- Choosing RD equal to 14
		Instruction(15 downto 0)  <= "0000111111111111"; -- Setting RT to 1 and immed to 0x0FFF
		MEM_out <= "00000000000000000000000000010000";   -- Setting MEM_out equal to 16
		ALU_out <= "00000000000000000000000000000111";   -- Setting ALU_out equal to 7
		RF_WrData_sel <= '0';							 -- Choosing ALU_out for DataIn
		RF_B_sel	  <= '0';							 -- Choosing the first input on the mux
		immExt		  <= "11";							 -- Choosing sign extend and 2 left shifts
		RD_IN 		  <= "11111";						 -- Writing on register 13
		wait for Clk_period;							 -- Expecting RF_A  	   -> 7 , RF_B       -> 0 , Immed  -> 0x00003FFC
														 --  		  RS_out 	   -> 31, RD_out     -> 14, RT_out -> 1
														 --			  Mux_RDRT_out -> 1 , Mux_WrData -> 7
-------------------------------------------------------------------------------------------------------------------------------------
	-- Testing if Rst works as intented
		----------------------------------------------------------------------------------------------------------------------------- 400ns
		Rst <= '1'; 									-- Setting Rst on
		----------------------------------------------------------------------------------------------------------------------------- 400ns
		RF_WrEn <= '1';									-- Write enable will be on for following tests
		Instruction(31 downto 26) <= "000000";			-- 0 irrelevant
		Instruction(25 downto 21) <= "01000";			-- Reading from register 8
		Instruction(20 downto 16) <= "00111";			-- Writing on register 7
		Instruction(15 downto 0)  <= "0011111111111111";-- Setting bits 15-11 to 7 and immed to 0x3FFF
		MEM_out <= "00000000000000000000000000001001";  -- Setting MEM_out equal to 9
		ALU_out <= "00000000000000000000000000001010";  -- Setting ALU_out equal to 10
		RF_WrData_sel <= '0';							-- Choosing ALU_out for DataIn
		RF_B_sel 	  <= '1';							-- Choosing the second input on the mux
		immExt 		  <= "11";							-- Choosing sign extend and 2 left shifts
		RD_IN  		  <= "00001";						-- Writing on register 1
		wait for Clk_period;							-- Expecting RF_A  	   	  -> 0 , RF_B       -> 0 , Immed  -> 0x0000FFFC
														--  		 RS_out 	  -> 8 , RD_out     -> 7 , RT_out -> 7
														--			 Mux_RDRT_out -> 7 , Mux_WrData -> 9
		----------------------------------------------------------------------------------------------------------------------------- 500ns
		stop_the_clock <= true;
      wait; 
   end process;
END;
