--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:34:37 04/05/2022
-- Design Name:   
-- Module Name:   C:/Users/Alex/Desktop/Phase_1/Part_2_2/DATAPATH3_tb.vhd
-- Project Name:  Part_2_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATAPATH
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DATAPATH3_tb IS
END DATAPATH3_tb;
 
ARCHITECTURE behavior OF DATAPATH3_tb IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
   COMPONENT DATAPATH
		PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         PC_sel : IN  std_logic;
         PC_LdEn : IN  std_logic;
         PC_out : OUT  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         RF_WrEn : IN  std_logic;
         ImmExt_s : IN  std_logic_vector(1 downto 0);
         Instruction : IN  std_logic_vector(31 downto 0);
         ALU_Bin_sel : IN  std_logic;
         ALU_func : IN  std_logic_vector(3 downto 0);
         ALU_zero : OUT  std_logic;
         ALU_cout : OUT  std_logic;
         ALU_ovf : OUT  std_logic;
         ByteOp : IN  std_logic;
         Mem_WrEn : IN  std_logic;
         MM_RdData : IN  std_logic_vector(31 downto 0);
         MM_WrEn : OUT  std_logic;
         MM_Addr : OUT  std_logic_vector(31 downto 0);
         MM_WrData : OUT  std_logic_vector(31 downto 0)
        );
   END COMPONENT;
    
	component RAM is
		 port ( clk, data_we 		  : in  std_logic;
				  inst_addr, data_addr : in  std_logic_vector(10 downto 0);
				  data_din 				  : in  std_logic_vector(31 downto 0);
				  inst_dout				  : out std_logic_vector(31 downto 0);
			     data_dout 			  : out std_logic_vector(31 downto 0)
	);
	end component; 
	
   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal PC_sel : std_logic := '0';
   signal PC_LdEn : std_logic := '0';
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal RF_WrEn : std_logic := '0';
   signal ImmExt_s : std_logic_vector(1 downto 0) := (others => '0');
   signal Instruction : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Bin_sel : std_logic := '0';
   signal ALU_func : std_logic_vector(3 downto 0) := (others => '0');
   signal ByteOp : std_logic := '0';
   signal Mem_WrEn : std_logic := '0';
   signal MM_RdData : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PC_out : std_logic_vector(31 downto 0);
   signal ALU_zero : std_logic;
   signal ALU_cout : std_logic;
   signal ALU_ovf : std_logic;
   signal MM_WrEn : std_logic;
   signal MM_Addr : std_logic_vector(31 downto 0);
   signal MM_WrData : std_logic_vector(31 downto 0);

    -- Clock period definitions
   constant clk_period: time := 100 ns;
	signal stop_the_clock: boolean;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATAPATH PORT MAP (
          Clk => Clk,
          Rst => Rst,
          PC_sel => PC_sel,
          PC_LdEn => PC_LdEn,
          PC_out => PC_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          RF_WrEn => RF_WrEn,
          ImmExt_s => ImmExt_s,
          Instruction => Instruction,
          ALU_Bin_sel => ALU_Bin_sel,
          ALU_func => ALU_func,
          ALU_zero => ALU_zero,
          ALU_cout => ALU_cout,
          ALU_ovf => ALU_ovf,
          ByteOp => ByteOp,
          Mem_WrEn => Mem_WrEn,
          MM_RdData => MM_RdData,
          MM_WrEn => MM_WrEn,
          MM_Addr => MM_Addr,
          MM_WrData => MM_WrData
        );

	RAM_MODULE: RAM
		PORT MAP ( clk        => Clk, 
					  data_we    => MM_WrEn,
					  inst_addr  => PC_out (12 downto 2),
					  data_addr  => MM_Addr(10 downto 0),
					  data_din 	 => MM_WrData,
					  inst_dout  => Instruction,
					  data_dout  => MM_RdData
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
--------------------------------------------------------------
	-- Holding the reset for 1 clock period.
		-------------------------------------------------------- 0ns
		rst <= '1';					-- Setting Rst equal to 1
		wait for clk_period*1;
		-------------------------------------------------------- 100ns
		rst 	  <= '0';			-- Setting Rst equal to 0
		PC_sel  <= '0'; 			-- Setting PC_sel equal to 0
		--PC_LdEn <= '1'; 			-- Setting PC_LdEn equal to 1
		wait for clk_period;
		-------------------------------------------------------- 200ns
		PC_LdEn <= '1'; 			-- Setting PC_LdEn equal to 1
		---------------------------------------------------------------------------------------- 200ns
	-- addi r5,r0,8 
		---------------------------------------------------------------------------------------- 200ns
		-- IFstage -------------
		PC_sel        <= '0'; 	 -- Setting PC value to increment by 4 in each clock cycle
		PC_LdEn       <= '1'; 	 -- Setting PC able to read the value comming for the mux
		-- DECstage ------------
		RF_WrEn    	  <= '1';	 -- Setting the RF able to write to registers			
		RF_WrData_sel <= '0';    -- Choosing the ALU_out as the DataIN to register.                    
		RF_B_sel      <= '0';	 -- Choosing to read the register(instruction(20-16)) on RF_B
		ImmExt_s      <= "01";   -- Setting the ImmExt to perform sign extend
		-- EXstage -------------
		ALU_Bin_sel   <= '1';  	 -- Chooosing the Immed as the second input in ALU
		ALU_func 	  <= "0000"; -- Choosing the addition for the ALU func			 
		-- MEMstage ------------
		Mem_WrEn  	  <='0';		 -- Setting the write enable of ram off
		wait for clk_period;
		---------------------------------------------------------------------------------------- 300ns
	-- ori r3,r0,ABCD
		---------------------------------------------------------------------------------------- 300ns
		-- IFstage -------------
		PC_sel 		  <= '0'; 	 -- Setting PC value to increment by 4 in each clock cycle
		PC_LdEn       <= '1';	 -- Setting PC able to read the value comming for the mux
		-- DECstage	------------	
		RF_WrEn       <= '1';	 -- Setting the RF able to write to registers	
		RF_WrData_sel <= '0';    -- Choosing the ALU_out as the DataIN to register.
		RF_B_sel      <= '0';	 -- Choosing to read the register(instruction(15-11)) on RF_B
		ImmExt_s      <= "00"; 	 -- Setting the ImmExt to perform zero fill
		-- EXstage -------------
		ALU_Bin_sel   <= '1';    -- Chooosing the Immed as the second input in ALU
		ALU_func      <= "0011"; -- Choosing the OR function for the ALU func		
		-- MEMstage ------------
		Mem_WrEn  <='0';			 -- Setting the write enable of ram off
		wait for clk_period;
		---------------------------------------------------------------------------------------- 400ns
	-- sw r3 4(r0)
		---------------------------------------------------------------------------------------- 400ns
		-- IFstage -------------
		PC_sel 		  <= '0'; 	 -- Setting PC value to increment by 4 in each clock cycle
		PC_LdEn 		  <= '1'; 	 -- Setting PC able to read the value comming for the mux
		-- DECstage	------------	
		RF_WrEn 		  <= '0';	 -- Setting the RF not able to write to registers	
		RF_WrData_sel <= '1';    -- Choosing the MEM_out as the DataIN to register (Irrelevant)
		RF_B_sel  	  <= '1';    -- Choosing to read the register(instruction(20-16)) on RF_B
		ImmExt_s		  <= "01";   -- Setting the ImmExt to perform sign extend
		-- EXstage -------------
		ALU_Bin_sel   <= '1';    -- Chooosing the Immed as the second input in ALU
		ALU_func  	  <= "0000"; -- Choosing the addition for the ALU func			
		-- MEMstage ------------
		Mem_WrEn  	  <= '1';    -- Setting the write enable of ram on
		wait for clk_period;
		---------------------------------------------------------------------------------------- 500ns
	-- lw r10,-4(r5)
		---------------------------------------------------------------------------------------- 500ns
		-- IFstage -------------
		PC_sel 		  <= '0'; 	 -- Setting PC value to increment by 4 in each clock cycle
		PC_LdEn 		  <= '1'; 	 -- Setting PC able to read the value comming for the mux
		-- DECstage	------------	
		RF_WrEn 		  <= '1';	 -- Setting the RF able to write to registers
		RF_WrData_sel <= '1';    -- Choosing the MEM_out as the DataIN to register
		RF_B_sel      <= '0';    -- Choosing to read the register(instruction(15-11)) on RF_B
		ImmExt_s      <= "01";   -- Setting the ImmExt to perform sign extend
		-- EXstage -------------
		ALU_Bin_sel   <= '1';    -- Chooosing the Immed as the second input in ALU
		ALU_func      <= "0000"; -- Choosing the addition for the ALU func	
		-- MEMstage ------------
		Mem_WrEn      <='0';     -- Setting the write enable of ram off
		wait for clk_period;
		---------------------------------------------------------------------------------------- 600ns
	-- lb r16 4(r0)
		---------------------------------------------------------------------------------------- 600ns
		-- IFstage -------------
		PC_sel        <= '0';    -- Setting PC value to increment by 4 in each clock cycle
		PC_LdEn 		  <= '1';    -- Setting PC able to read the value comming for the mux
		-- DECstage	------------	
		RF_WrEn 		  <= '1';    -- Setting the RF able to write to registers
		RF_WrData_sel <= '1';    -- Choosing the MEM_out as the DataIN to register 
		RF_B_sel  	  <= '0';    -- Choosing to read the register(instruction(15-11)) on RF_B
		ImmExt_s      <= "01";   -- Setting the ImmExt to perform sign extend
		-- EXstage -------------
		ALU_Bin_sel   <= '1';    -- Chooosing the Immed as the second input in ALU
		ALU_func  	  <= "0000"; -- Choosing the addition for the ALU func
		-- MEMstage ------------
		ByteOp 		  <= '1';	 -- Choosing store byte operation from ram
		Mem_WrEn  	  <= '0';  	 -- Setting the write enable of ram off
		wait for clk_period*1;
		---------------------------------------------------------------------------------------- 700ns
		-- nand r4,r0,r16
		---------------------------------------------------------------------------------------- 700ns
		-- IFstage -------------
		PC_sel        <= '0'; 	 -- Setting PC value to increment by 4 in each clock cycle
		PC_LdEn 		  <= '1';	 -- Setting PC able to read the value comming for the mux	
		-- DECstage	------------	
		RF_WrEn       <= '1';    -- Setting the RF able to write to registers
		RF_WrData_sel <= '0';    -- Choosing the ALU_out as the DataIN to register 
		RF_B_sel      <= '1'; 	 -- Choosing to read the register(instruction(20-16)) on RF_B
		ImmExt_s      <= "XX"; 	 -- Setting the ImmExt to perform nothing
		-- EXstage -------------
		ALU_Bin_sel   <= '0';  	 -- Chooosing the RF_B as the second input in ALU
		ALU_func      <= "0101"; -- Choosing the Nand operation for the ALU func
		-- MEMstage ------------
		Mem_WrEn      <= '0';    -- Setting the write enable of ram off
		wait for clk_period;
		---------------------------------------------------------------------------------------- 800ns
		RF_WrEn  <= '0';
		PC_LdEn <='0';
		---------------------------------------------------------------------------------------- 800ns
		stop_the_clock <= true;
      wait;
   end process;
END;
