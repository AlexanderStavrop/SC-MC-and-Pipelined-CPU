library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Mux32_pkg.all;

entity EXSTAGE is
    Port ( 	RF_A, RF_B, Immed 			: in  std_logic_vector(31 downto 0);
			ALU_func 					: in  std_logic_vector(3 downto 0);
			ALU_Bin_sel 				: in  std_logic;
			ALU_out 					: out  std_logic_vector(31 downto 0);
			ALU_zero, ALU_cout, ALU_ovf	: out  std_logic
	 );
end EXSTAGE;

architecture Behavioral of EXSTAGE is

---------------------------------------------------------- COMPONENTS --------------------------------------------------------------------
	component Mux32 is
		port( DataIn  : in MuxMatrix32;
			  DataSel : in std_logic;
			  DataOut : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component ALU is
		Port ( A, B			   : in  std_logic_vector (31 downto 0);
			   Op 			   : in  std_logic_vector (3 downto 0);
			   Dout 		   : out std_logic_vector (31 downto 0);
			   Zero, Cout, Ovf : out std_logic
		);
	end component;


	-- Needed signals
	----------------------------------------------------------- MUX 32 ----------------------------------------------------------------------------
	signal mux_32_matrix : MuxMatrix32 := (others =>(others => '0'));
	signal mux_32_out    : std_logic_vector (31 downto 0) := (others => '0');
	
	
-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        
begin
------------------------------------------------------ Mux32 -------------------------------------------------------
	mux_32_matrix(0) <= RF_B;
	mux_32_matrix(1) <= Immed;
	
	MUX_module:Mux32
		port map ( DataIn  => mux_32_matrix,
				   DataSel => ALU_Bin_sel,
				   DataOut => mux_32_out 
		);
	
------------------------------------------------------- ALU -------------------------------------------------------
	ALU_module:ALU
		port map ( A 	=> RF_A,
				   B    => mux_32_out,
				   Op 	=> ALU_func,
				   Dout => ALU_out,
				   zero => ALU_zero,
				   Cout => ALU_cout,
				   Ovf  => ALU_ovf
		); 
		
end Behavioral;