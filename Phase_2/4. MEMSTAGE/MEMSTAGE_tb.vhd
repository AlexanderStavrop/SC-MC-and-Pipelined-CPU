LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MEMSTAGE_tb IS
END MEMSTAGE_tb;
 
ARCHITECTURE behavior OF MEMSTAGE_tb IS 
  
	component MEMSTAGE
		Port ( ByteOp, Mem_WrEn					   : in  STD_LOGIC;
			   ALU_MEM_Addr, MEM_DataIn, MM_RdData : in  STD_LOGIC_VECTOR (31 downto 0);
			   MM_WrEn 							   : out STD_LOGIC;
			   MM_Addr, MM_WrData, MEM_DataOut	   : out STD_LOGIC_VECTOR (31 downto 0));
	end component;
    
	component RAM is
		 port ( clk, data_we 		  			   : in  std_logic;
				inst_addr, data_addr 			   : in  std_logic_vector(10 downto 0);
				data_din 				  		   : in  std_logic_vector(31 downto 0);
				inst_dout				  		   : out std_logic_vector(31 downto 0);
			    data_dout 			  			   : out std_logic_vector(31 downto 0)
		);
	end component;
	
   --Inputs
	signal Clk           : std_logic := '0';
	signal ByteOp 		 : std_logic := '0';
	signal Mem_WrEn      : std_logic := '0';
	signal ALU_MEM_Addr  : std_logic_vector(31 downto 0) := (others => '0');
	signal MEM_DataIn    : std_logic_vector(31 downto 0) := (others => '0');
	signal MM_RdData     : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
	signal MM_WrEn       : std_logic;
	signal MM_Addr       : std_logic_vector(31 downto 0);
	signal MM_WrData     : std_logic_vector(31 downto 0);
	signal MEM_DataOut   : std_logic_vector(31 downto 0);
 
	-- Clock period definitions
	constant clk_period  : time := 100 ns;
	signal stop_the_clock: boolean;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MEMSTAGE 
		PORT MAP ( ByteOp       => ByteOp,
				   Mem_WrEn     => Mem_WrEn,
				   ALU_MEM_Addr => ALU_MEM_Addr,
				   MEM_DataIn   => MEM_DataIn,
				   MM_RdData    => MM_RdData,
				   MM_WrEn      => MM_WrEn,
                   MM_Addr      => MM_Addr,
				   MM_WrData    => MM_WrData,
				   MEM_DataOut  => MEM_DataOut
		);
 
	Ram_module : Ram
		port map ( clk 			=> Clk,
				   data_we   	=> MM_WrEn,
				   inst_addr 	=> "00000000000",
				   data_addr 	=> MM_Addr(10 downto 0),
				   data_din 	=> MM_WrData,
				   inst_dout 	=> open,
				   data_dout 	=> MM_RdData
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
--------------------------------------------------------------------------------------------------------------------------------------------	
	-- Testing Lw/Sw
		------------------------------------------------------------------------------------------------------------------------------------ 0 ns
		ByteOp       <= '0';											-- Sw
		Mem_WrEn 	 <= '1';											-- Write enale is on
		ALU_MEM_Addr <= "00000000000000000000000000001100";				-- 256 + 3 = 259 
		MEM_DataIn   <= "00000000000000000000000000000111"; 			-- Data in 7
		wait for clk_period;											-- Expecting MEM_DataOut equal to 7 after 12ns from clk rising edge
		------------------------------------------------------------------------------------------------------------------------------------ 100 ns
		ByteOp       <= '0';											-- Lw
		Mem_WrEn 	 <= '0';											-- Write enale is off
		ALU_MEM_Addr <= "00000000000000000000000000000100"; 			-- 256 + 1 = 257
		MEM_DataIn   <= "00000000000000000000000001111111";				-- Irrelevant
		wait for clk_period;											-- MEM_DataOut equal to 0
		------------------------------------------------------------------------------------------------------------------------------------ 200 ns
		ByteOp       <= '0';											-- Lw
		Mem_WrEn 	 <= '0';											-- Write enale is off
		ALU_MEM_Addr <= "00000000000000000000000000001100"; 			-- 256 + 3 = 259
		MEM_DataIn   <= "00000000000000000000000001111111";				-- Irrelevant
		wait for clk_period;											-- MEM_DataOut equal to 7
		------------------------------------------------------------------------------------------------------------------------------------ 300 ns

--------------------------------------------------------------------------------------------------------------------------------------------
	-- Testing Lb/sb
		------------------------------------------------------------------------------------------------------------------------------------ 300 ns
		ByteOp                    <= '0';								-- Sw
		Mem_WrEn 	              <= '1';								-- Write enale is on
		MEM_DataIn(31 downto 24 ) <= "00000100"; 						-- Setting DataIn forth  byte equal to 4
		MEM_DataIn(23 downto 16 ) <= "00000011"; 						-- Setting DataIn third  byte equal to 3
		MEM_DataIn(15 downto 8  ) <= "00000010"; 						-- Setting DataIn second byte equal to 2
		MEM_DataIn(7  downto 0  ) <= "00000001"; 						-- Setting DataIn first  byte equal to 1		
		ALU_MEM_Addr <= "00000000000000000000000000011000"; 			-- 256 + 6 = 262
		wait for clk_period;											-- MEM_DataOut equal to 67305985
		------------------------------------------------------------------------------------------------------------------------------------ 400 ns
		ByteOp   	<= '1';												-- lb
		Mem_WrEn 	<= '0';						   						-- Write enale is off
		------------------------------------------------------------------------------------------------------------------------------------ 400 ns
		ALU_MEM_Addr <= "00000000000000000000000000011000"; 			-- Loading from 262 with 00 for the first 2 bits		
		wait for clk_period;											-- MEM_DataOut equal to 1
		------------------------------------------------------------------------------------------------------------------------------------ 500 ns
		ALU_MEM_Addr <= "00000000000000000000000000011011"; 			-- Loading from 262 with 11 for the first 2 bits
		wait for clk_period;											-- MEM_DataOut equal to 1
		------------------------------------------------------------------------------------------------------------------------------------ 600 ns
		ByteOp      			<= '1';									-- Sb
		Mem_WrEn 				<= '1';									-- Write enale is on
		MEM_DataIn(31 downto 8) <= "000000000000000000001110"; 			-- Setting the upper 24 bits to 14 but this will be irrelevant
		MEM_DataIn( 7 downto 0) <= "00011111"; 					 		-- Setting the 8 lower bits to 31.
		ALU_MEM_Addr 			<= "00000000000000000000000000011101";	-- 256 + 7 = 263
		wait for clk_period;											-- MEM_DataOut equal to 0 because we load the second byte (01)		
		------------------------------------------------------------------------------------------------------------------------------------ 700 ns
		ByteOp        <= '0';											-- Lw
		Mem_WrEn <= '0';											    -- Write enale is off
		ALU_MEM_Addr <= "00000000000000000000000000011101";  			-- 256 + 7 = 263 
		MEM_DataIn   <= "00000000000000000000000001111111";	 			-- Irrelevant
		wait for clk_period;											-- MEM_DataOut equal to 31
		------------------------------------------------------------------------------------------------------------------------------------ 800 ns
		stop_the_clock <= true;
		wait;
   end process;
END;
