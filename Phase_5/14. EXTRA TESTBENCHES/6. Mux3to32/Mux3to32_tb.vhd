LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.Mux3to32_pkg.all;

ENTITY Mux3to32_tb IS
END Mux3to32_tb;
 
architecture behavior of Mux3to32_tb is
 
    component Mux3to32
		Port ( DataIn  : in  MuxMatrix3to32;
			   DataSel : in  std_logic_vector ( 1 downto 0);
			   DataOut : out std_logic_vector (31 downto 0)
		);
    end component;
    
	--Inputs
	signal DataIn  : MuxMatrix3to32 := (others => (others => '0'));
	signal DataSel : std_logic_vector( 1 downto 0) := (others => '0');

	--Outputs
	signal DataOut : std_logic_vector(31 downto 0);
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: Mux3to32 
		Port map ( DataIn  => DataIn,
				   DataSel => DataSel,
				   DataOut => DataOut
        );

	-- Stimulus process
	stim_proc: process
	begin		
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Testing if the multiplexer is working as expected
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 0ns
		DataIn(0) <= "00000000000000000000000000000000";   	-- Setting the first input to 0
		DataIn(1) <= "00000000000000000000000000000001";	-- Setting the second input to 1
		DataIn(2) <= "00000000000000000000000000000010";	-- Setting the third input to 2
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 0ns
		DataSel   <= "00";									-- Selecting the first input
		wait for 100ns;										-- Expecting DataOut equal to 0 after 10ns
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 100ns   
		DataSel   <= "01";									-- Selecting the second input
		wait for 100ns;										-- Expecting DataOut equal to 1 after 10ns
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 200ns 
		DataSel   <= "10";									-- Selecting the third input
		wait for 100ns;										-- Expecting DataOut equal to 2 after 10ns
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 300ns 
		DataSel   <= "11";									-- Selecting the forth input
		wait for 100ns;										-- Expecting DataOut equal to 0 after 10ns
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 400ns 
		DataIn(0) <= "00000000000000000000000000001010";   	-- Setting the first input to 10
		DataIn(1) <= "00000000000000000000000000001100";	-- Setting the second input to 12
		DataIn(2) <= "00000000000000000000000000000110";	-- Setting the third input to 6
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 400ns
		DataSel   <= "00";									-- Selecting the first input
		wait for 100ns;										-- Expecting DataOut equal to 0 after 10ns
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 500ns   
		DataSel   <= "01";									-- Selecting the second input
		wait for 100ns;										-- Expecting DataOut equal to 1 after 10ns
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 600ns 
		DataSel   <= "10";									-- Selecting the third input
		wait for 100ns;										-- Expecting DataOut equal to 2 after 10ns
   		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 700ns
		DataSel   <= "11";									-- Selecting the forth input
		wait for 100ns;										-- Expecting DataOut equal to 0 after 10ns
		--------------------------------------------------------------------------------------------------------------------------------------------------------------- 800ns 		
	  wait;	  
   end process;

END;
