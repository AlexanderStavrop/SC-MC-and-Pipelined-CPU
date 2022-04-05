LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Immed16to32_tb IS
END Immed16to32_tb;
 
ARCHITECTURE behavior OF Immed16to32_tb IS 
	COMPONENT Immed16to32
		PORT( Instr_in  : IN  std_logic_vector(15 downto 0);
				Instr_sel : IN  std_logic_vector(1 downto 0);
				instr_out : OUT std_logic_vector(31 downto 0)
      );
	END COMPONENT;
    
	-- Input signals
   signal Instr_in : std_logic_vector(15 downto 0) := (others => '0');
   signal Instr_sel : std_logic_vector(1 downto 0) := (others => '0');

 	-- Output signals
   signal instr_out : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Immed16to32 
		PORT MAP ( Instr_in  => Instr_in,
					  Instr_sel => Instr_sel,
					  instr_out => instr_out
      );

   -- Stimulus process
   stim_proc: process
   begin
-----------------------------------------------------------------------------------------------
		-- Testing if  
		----------------------------------------------------------------------------------------- 0ns
		Instr_in <= "0000000000000010"; -- Setting the PC_immed value to 2.
		----------------------------------------------------------------------------------------- 0ns
		Instr_sel <= "00";				  -- Choosing sign extend to 32 bits.
		wait for 100ns;					  -- Expecting Instr_out to be 2 but in 32 bits.
		----------------------------------------------------------------------------------------- 100ns
		Instr_sel <= "01";				  -- Choosing sign extend to 32 bits with 2 left shitfs.
		wait for 100ns;					  -- Expecting Instr_out to be 16.
		----------------------------------------------------------------------------------------- 200ns
		Instr_sel <= "10";				  -- Choosing 16 left-shift and zero-fill.
		wait for 100ns;					  -- Expecting Instr_out to be 131072.
		----------------------------------------------------------------------------------------- 300ns
      Instr_sel <= "11";				  -- Choosing sign extend to 32 bits.
		wait for 100ns;					  -- Expecting Instr_out to be 2.
		----------------------------------------------------------------------------------------- 400ns
		-- Negative numbers
		----------------------------------------------------------------------------------------- 400ns
		Instr_in  <= "1111111111111110"; -- Setting the PC_immed value to -2.
		----------------------------------------------------------------------------------------- 400ns
		Instr_sel <= "00";				  -- Choosing sign extend to 32 bits.
		wait for 100ns;					  -- Expecting Instr_out to be -2 but in 32 bits.
		----------------------------------------------------------------------------------------- 500ns
		Instr_sel <= "01";				  -- Choosing sign extend to 32 bits with 2 left shitfs.
		wait for 100ns;					  -- Expecting Instr_out to be -8.
		----------------------------------------------------------------------------------------- 600ns
		Instr_sel <= "10";				  -- Choosing 16 left-shift and zero-fill.
		wait for 100ns;					  -- Expecting Instr_out to be -131072.
		----------------------------------------------------------------------------------------- 700ns
      Instr_sel <= "11";				  -- Choosing sign extend to 32 bits.
		wait for 100ns;					  -- Expecting Instr_out to be 65532.
		----------------------------------------------------------------------------------------- 800ns
		wait;
   end process;
END;
