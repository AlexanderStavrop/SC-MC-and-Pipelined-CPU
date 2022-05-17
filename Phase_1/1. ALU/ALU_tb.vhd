library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ALU_tb is
end;

architecture bench of ALU_tb is

	-- Creating the component of ALU
	component ALU
		Port (  A, B 			: in STD_LOGIC_VECTOR (31 downto 0);
				Op   			: in STD_LOGIC_VECTOR (3 downto 0);
				Dout 			: out STD_LOGIC_VECTOR (31 downto 0);
				Zero, Cout, Ovf : out STD_LOGIC
			);
	end component;

	-- Input Signals
	signal A, B : STD_LOGIC_VECTOR (31 downto 0) := (others => '0'); 
	signal Op   : STD_LOGIC_VECTOR  (3 downto 0) := (others => '0');
  
	-- Output Signals
	signal Dout            : STD_LOGIC_VECTOR (31 downto 0);
	signal Zero, Cout, Ovf : STD_LOGIC;
	  
begin
	-- Declaring the ALU port map
	uut: ALU 
		port map ( A    => A,
                   B    => B,
                   Op   => Op,
                   Dout => Dout,
                   Zero => Zero,
                   Cout => Cout,
                   Ovf  => Ovf
		);
  
	-- Stimulus process
	stimulus: process
	begin
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Addition Mode
		----------------------------------------------------------------------------------------------------------- 0ns	
		Op <= "0000";								-- Opcode will be 0 for following tests (Addition)
		----------------------------------------------------------------------------------------------------------- 0ns	
		A <= "11111111111111111111111111111111";   	-- Setting A equal to -1
		B <= "00000000000000000000000000000001";	-- Setting B equal to  1
		wait for 100ns;   							-- Expect -1 + 1 = 0 (Zero)(Carry Out)
		----------------------------------------------------------------------------------------------------------- 100ns	
		A <= "00000000000000000000000000000001"; 	-- Setting A equal to  1
		B <= "00000000000000000000000000000001";	-- Setting B equal to  1	
		wait for 100ns;      						-- Expect 1 + 1 = 2
		----------------------------------------------------------------------------------------------------------- 200ns	
		A <= "11111111111111111111111111111111"; 	-- Setting A equal to -1
		B <= "11111111111111111111111111111111"; 	-- Setting B equal to -1
		wait for 100ns;      						-- Expect -1 + -1 = -2 (Carry Out)
		----------------------------------------------------------------------------------------------------------- 300ns	
		A <= "01111111111111111111111111111110";	-- Setting A equal to 2147483646
		B <= "00000000000000000000000000000001";  	-- Setting B equal to  1
		wait for 100ns;                       		-- Expect 2147483646 + 1 = 2147483647
		----------------------------------------------------------------------------------------------------------- 400ns		
		A <= "10000000000000000000000000000001";  	-- Setting A equal to -2147483647
		B <= "11111111111111111111111111111111";	-- Setting B equal to -1
		wait for 100ns;                      		-- Expect -2147483647 + (-1) = -2147483648  (Carry Out)
		----------------------------------------------------------------------------------------------------------- 500ns
		A <= "01111111111111111111111111111110"; 	-- Setting A equal to 2147483647
		B <= "00000000000000000000000000000010";   	-- Setting B equal to  1
		wait for 100ns;                       		-- Expect 2147483646 + 2 = 2147483648 (Overflow)   
		----------------------------------------------------------------------------------------------------------- 600ns
		A <= "10000000000000000000000000000001";  	-- Setting A equal to -2147483647
		B <= "11111111111111111111111111111110"; 	-- Setting B equal to -2
		wait for 100ns;                       		-- Expect -2147483647 + (-2) = -2147483647 (Overflow) (Carry Out)
		----------------------------------------------------------------------------------------------------------- 700ns
		
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Subtraction Mode
		----------------------------------------------------------------------------------------------------------- 700ns
		Op <= "0001";								-- Opcode will be 1 for following tests (Subtraction)
		----------------------------------------------------------------------------------------------------------- 700ns	
		A <= "00000000000000000000000000000001";	-- Setting A equal to 1
		B <= "00000000000000000000000000000001";  	-- Setting B equal to 1
		wait for 100ns;                       		-- Expect 1 - 1 = 0 (Zero)
		----------------------------------------------------------------------------------------------------------- 800ns	
		A <= "11111111111111111111111111111111";	-- Setting A equal to -1
		B <= "11111111111111111111111111111111";  	-- Setting B equal to -1
		wait for 100ns;                       		-- Expect -1 - (-1) = 0 (Zero)
		----------------------------------------------------------------------------------------------------------- 900ns	
		A <= "01111111111111111111111111111111";  	-- Setting A equal to 2147483647
		B <= "00000000000000000000000000000001";	-- Setting B equal to 1
		wait for 100ns;                       		-- Expect 2147483647 - 1 = 2147483646
		----------------------------------------------------------------------------------------------------------- 10000ns	
		A <= "10000000000000000000000000000001";  	-- Setting A equal to -2147483647
		B <= "00000000000000000000000000000001";  	-- Setting B equal to 1
		wait for 100ns;                       		-- Expect -2147483647 - 1 = -2147483648
		----------------------------------------------------------------------------------------------------------- 1100ns
		A <= "01111111111111111111111111111111";  	-- Setting A equal to 2147483647
		B <= "11111111111111111111111111111111";  	-- Setting B equal to -1
		wait for 100ns;                       		-- Expect 2147483647 - (-1) = 2147483648 (Overflow)
		----------------------------------------------------------------------------------------------------------- 1200ns
		A <= "10000000000000000000000000000001";  	-- Setting A equal to -2147483647
		B <= "00000000000000000000000000000010";  	-- Setting B equal to 2
		wait for 100ns;                      		-- Expect -2147483647 - 2 = -2147483647  (Overflow)
		----------------------------------------------------------------------------------------------------------- 1300ns
	 
--------------------------------------------------------------------------------------------------------------------------
	-- Testing And Mode
		----------------------------------------------------------------------------------------------------------- 1300ns
		Op <= "0010";								-- Opcode will be 2 for following tests (And)
		----------------------------------------------------------------------------------------------------------- 1300ns	
		A  <= "00000100100001001111100101000101"; 	-- Setting A equal to a random string
		B  <= "00000000000000000000000000000000"; 	-- Setting A equal to 0
		wait for 100ns;                       		-- Expect Zero (Zero)
		----------------------------------------------------------------------------------------------------------- 1400ns	
		A  <= "01010101010101010101010101010101"; 	-- Setting equal to 0101....
		B  <= "10101010101010101010101010101010"; 	-- Setting equal to 1010....
		wait for 100ns;                       		-- Expect Zero (Zero)
		----------------------------------------------------------------------------------------------------------- 1500ns	
		A  <= "10000100100001001111100101000101"; 	-- Setting A equal to 2223307077
		B  <= "10000000100101111011101000000011"; 	-- Setting A equal to 2157427203
		wait for 100ns;                       		-- Expect -2138785791 (10000000100001001011100000000001)
		----------------------------------------------------------------------------------------------------------- 1600ns	
	 
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Or Mode 
	 	----------------------------------------------------------------------------------------------------------- 1600ns
		Op <= "0011";								-- Opcode will be 3 for following tests (Or)
		----------------------------------------------------------------------------------------------------------- 1600ns	
		A <= "00000100100001001111100101000101"; 	-- Setting A equal to 75823429
		B <= "00000000000000000000000000000000";  	-- Setting B equal to 0
		wait for 100ns;                       		-- Expect 75823429 (A)
		----------------------------------------------------------------------------------------------------------- 1700ns	
		A <= "01010101010101010101010101010101";  	-- Setting A equal to  1431655765
		B <= "10101010101010101010101010101010";  	-- Setting B equal to -1431655766
		wait for 100ns;                       		-- Expect -1
		----------------------------------------------------------------------------------------------------------- 1800ns
	 
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Not Mode
		----------------------------------------------------------------------------------------------------------- 1800ns
		Op <= "0100";								-- Opcode will be 4 for following tests (Not)
		B <= "00000000000000000000000000000000";  	-- Setting B equal to 0 for the following  tests.
		----------------------------------------------------------------------------------------------------------- 1800ns
		A <= "00000000000000000000000000000000";	-- Setting A equal to 0
		wait for 100ns;                       		-- Expect -1
		----------------------------------------------------------------------------------------------------------- 1900ns
		A <= "01010101010101010101010101010101"; 	-- Setting A equal to 1431655765
		wait for 100ns;                       		-- Expect -1431655766
		----------------------------------------------------------------------------------------------------------- 2000ns
		A <= "00000000111110111111100111001010";  	-- Setting A equal to 16513482
		wait for 100ns;                       		-- Expect -16513483 (11111111000001000000011000110101)
		----------------------------------------------------------------------------------------------------------- 2100ns
		B <= "11111110110011000111110100100010";	-- Setting B equal to -20153054
		wait for 100ns;                       		-- Expect -16513483 (11111111000001000000011000110101)
		----------------------------------------------------------------------------------------------------------- 2200ns
				
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Nand Mode 
		----------------------------------------------------------------------------------------------------------- 2200ns
		Op <= "0101";								-- Opcode will be 5 for following tests (Nand)
		----------------------------------------------------------------------------------------------------------- 2200ns
		A <= "00000000000000000000000000000000";  	-- Setting A equal to 0
		B <= "00000000000000000000000000000000";  	-- Setting B equal to 0
		wait for 100ns;                       		-- Expect -1
		----------------------------------------------------------------------------------------------------------- 2300ns
		A <= "01010101010101010101010101010101";  	-- Setting A equal to 1431655765
		B <= "10101010101010101010101010101010";  	-- Setting B equal to -1431655766
		wait for 100ns;                       		-- Expect -1
		----------------------------------------------------------------------------------------------------------- 2400ns
		A <= "10000100100001001111100101000101";  	-- Setting A equal to -2071660219
		B <= "10000000100101111011101000000011";  	-- Setting B equal to -2137540093
		wait for 100ns;                       		-- Expect 2138785790
		----------------------------------------------------------------------------------------------------------- 2500ns
		A <= "11111111111111111111111111111111";  	-- Setting A equal to -1
		B <= "11111111111111111111111111111111";  	-- Setting B equal to -1
		wait for 100ns;                      	 	-- Expect 0 (Zero)
		----------------------------------------------------------------------------------------------------------- 2600ns
		
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Nor Mode 
		----------------------------------------------------------------------------------------------------------- 2600ns
		Op <= "0110";								-- Opcode will be 6 for following tests (Nor)
		----------------------------------------------------------------------------------------------------------- 2600ns
		A <= "00000000000000000000000000000000";  	-- Setting A equal to 0
		B <= "00000000000000000000000000000000";  	-- Setting B equal to 0
		wait for 100ns;                       		-- Expect -1
		----------------------------------------------------------------------------------------------------------- 2700ns
		A <= "01010101010101010101010101010101";  	-- Setting A equal to 1431655765
		B <= "10101010101010101010101010101010";  	-- Setting B equal to -1431655766
		wait for 100ns;                       		-- Expect 0 (Zero)
		----------------------------------------------------------------------------------------------------------- 2800ns
		A <= "10000100100001001111100101000101";  	-- Setting A equal to -2071660219
		B <= "10000000100101111011101000000011";  	-- Setting B equal to -2137540093
		wait for 100ns;                       		-- Expect 2070414520
		----------------------------------------------------------------------------------------------------------- 2900ns
		A <= "11111111111111111111111111111111"; 	-- Setting A equal to -1
		B <= "11111111111111111111111111111111";  	-- Setting B equal to -1
		wait for 100ns;                      	 	-- Expect 0 (Zero)
		----------------------------------------------------------------------------------------------------------- 3000ns
		
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Arithmetic Right Shift Mode  
		----------------------------------------------------------------------------------------------------------- 3000ns
		Op <= "1000";								-- Opcode will be 8 for following tests (arithmetic right shift)
		B <= "00000000000000000000000000000000";  	-- Setting B equal to 0 for the following  tests.
		----------------------------------------------------------------------------------------------------------- 3000ns
		A <= "01010101010101010101010101010101";  	-- Setting A equal to 1431655765
		wait for 100ns;                       		-- Expect 715827882 (1431655765/2)
		----------------------------------------------------------------------------------------------------------- 3100ns
		A <= "11111111111111111111111111111111";  	-- Setting A equal to -1
		wait for 100ns;                       		-- Expect -1
		----------------------------------------------------------------------------------------------------------- 3200ns
		B <= "10000100100001001111100101000101";  	-- Setting B equal to -2071660219
		wait for 100ns;                       		-- Expect -1
		----------------------------------------------------------------------------------------------------------- 3300ns
		
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Logic Right Shift Mode 
		----------------------------------------------------------------------------------------------------------- 3300ns
		Op <= "1001";								-- Opcode will be 9 for following tests (logic right shift)
		B <= "00000000000000000000000000000000";  	-- Setting B equal to 0 for the following  tests.
		----------------------------------------------------------------------------------------------------------- 3300ns
		A <= "11111111111111111111111111111111";  	-- Setting A equal to -1
		wait for 100ns;								-- Expect 2147483647
		----------------------------------------------------------------------------------------------------------- 3400ns
		A <= "01010101010101010101010101010101";  	-- Setting A equal to 1431655765
		wait for 100ns;                       		-- Expect 715827882
		----------------------------------------------------------------------------------------------------------- 3500ns
		B <= "11001010010101010001010101010100";  	-- Setting B equal to -900393644
		wait for 100ns;                       		-- Expect 715827882
		----------------------------------------------------------------------------------------------------------- 3600ns
		  
--------------------------------------------------------------------------------------------------------------------------
 	-- Testing Logic Left Shift Mode    
		----------------------------------------------------------------------------------------------------------- 3600ns
		Op <= "1010";								-- Opcode will be 10 for following tests (logic left shift)
		B <= "00000000000000000000000000000000";  	-- Setting B equal to 0 for the following tests.
		----------------------------------------------------------------------------------------------------------- 3600ns
		A <= "11111111111111111111111111111111";	-- Setting A equal to -1
		wait for 100ns;                       		-- Expect -2
		----------------------------------------------------------------------------------------------------------- 3700ns
		A <= "01010101010101010101010101010101";  	-- Setting A equal to 1431655765
		wait for 100ns;                       		-- Expect -1431655766
		----------------------------------------------------------------------------------------------------------- 3800ns
		B <= "11001010010101010001010101010100";  	-- Setting B equal to -900393644
		wait for 100ns;                       		-- Expect -1431655766
		----------------------------------------------------------------------------------------------------------- 3900ns
	 
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Left Rotare Mode  
		----------------------------------------------------------------------------------------------------------- 3900ns
		Op <= "1100";								-- Opcode will be 12 for following tests (left rotate)
		B <= "00000000000000000000000000000000";  	-- Setting B equal to 0 for the following tests.
		----------------------------------------------------------------------------------------------------------- 3900ns
		A <= "11111111111111111111111111111111"; 	-- Setting A equal to -1
		wait for 100ns;                       		-- Expect -1
		----------------------------------------------------------------------------------------------------------- 4000ns
		A <= "00010101010101010101010101010101";  	-- Setting A equal to 357913941
		wait for 100ns;                       		-- Expect 715827882
		----------------------------------------------------------------------------------------------------------- 4100ns
		B <= "11001010010101010001010101010100";  	-- Setting B equal to -900393644
		wait for 100ns;								-- Expect 715827882
		----------------------------------------------------------------------------------------------------------- 4200ns
		  
--------------------------------------------------------------------------------------------------------------------------
	-- Testing Right Rotare Mode   
		----------------------------------------------------------------------------------------------------------- 4200ns
		Op <= "1101";								-- Opcode will be 13 for following tests (right rotate)
		B <= "00000000000000000000000000000000";  	-- Setting B equal to 0 for the following tests.
		----------------------------------------------------------------------------------------------------------- 4200ns
		A <= "11111111111111111111111111111111";  	-- Setting A equal to -1
		wait for 100ns;                       		-- Expect -1	
		----------------------------------------------------------------------------------------------------------- 4300ns		
		A <= "01010101010101010101010101010101";  	-- Setting A equal to 357913941
		wait for 100ns;                       		-- Expect -1431655766
		----------------------------------------------------------------------------------------------------------- 4400ns
		B <= "11001010010101010001010101010100";  	-- Setting B equal to 1431655765
		wait for 100ns;                       		-- Expect -1431655766
		----------------------------------------------------------------------------------------------------------- 4500ns

--------------------------------------------------------------------------------------------------------------------------
	-- Testing every other opcode Mode 
		----------------------------------------------------------------------------------------------------------- 4500ns
		A <= "01001001010101010010010101001001";  	-- Setting A equal to  1230316873
		B <= "10100100110011000111000000011110";  	-- Setting B equal to -1530105826		
		----------------------------------------------------------------------------------------------------------- 4500ns	
		Op <= "0111";   							-- Setting the opcode equal to 7
		wait for 100ns;                       		-- Expect 0 (Zero)
		----------------------------------------------------------------------------------------------------------- 4600ns	
		Op <= "1011";   							-- Setting the opcode equal to 13
		wait for 100ns;                       		-- Expect 0 (Zero)
		----------------------------------------------------------------------------------------------------------- 4700ns	
		Op <= "1110";   							-- Setting the opcode equal to 14
		wait for 100ns;                       		-- Expect 0 (Zero)
		----------------------------------------------------------------------------------------------------------- 4800ns	
		Op <= "1111";   							-- Setting the opcode equal to 15
		wait for 100ns;                       		-- Expect 0 (Zero)
		----------------------------------------------------------------------------------------------------------- 4900ns	
		wait;
  end process;
end;