library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Mux32_pkg.all;
use work.Mux5_pkg.all;


entity DECSTAGE_PIPELINE is
    Port ( RF_WrEn, RF_WrData_sel, RF_B_sel, Clk, Rst : in  std_logic;
		   immExt									  : in  std_logic_vector  ( 1 downto 0);
		   Instruction, ALU_out, MEM_out 	  		  : in  std_logic_vector  (31 downto 0);
		   RS_out, RD_out, RT_out, MuxOut			  : out std_logic_vector  ( 4 downto 0); 
		   Immed, RF_A, RF_B 						  : out std_logic_vector  (31 downto 0) 
	 );
end DECSTAGE_PIPELINE;

architecture Behavioral of DECSTAGE_PIPELINE is
---------------------------------------------------------- COMPONENTS --------------------------------------------------------------------
	component Mux32 is
		port( DataIn  		   : in MuxMatrix32;
			  DataSel   	   : in std_logic;
			  DataOut          : out std_logic_vector (31 downto 0)
		);
	end component;
	
	component Immed16to32 is
		Port ( instr_in        : in  std_logic_vector (15 downto 0);
			   instr_sel       : in  std_logic_vector (  1 downto 0);
			   instr_out       : out std_logic_vector (31 downto 0)
		);
	end component;
	
	component Mux5 is
		port( DataIn  	       : in MuxMatrix5;
		      DataSel 	       : in std_logic;
			  DataOut 		   : out std_logic_vector(4 downto 0)
		);
	end component;
	
	component RF is
		Port ( Ard1, Ard2, Awr : in  std_logic_vector (4 downto 0);
			   WrEn, Clk, Rst  : in  std_logic;
			   Din 			   : in  std_logic_vector (31 downto 0);
			   Dout1, Dout2	   : out std_logic_vector (31 downto 0)
		);
	end component;
	
	-- Needed signals
	------------- MUX 32 -----------------------------------------
	signal mux_32_matrix : MuxMatrix32;
	signal mux_32_out    : std_logic_vector (31 downto 0);
	
	------------- MUX 5 ------------------------------------------
	signal mux_5_matrix  : MuxMatrix5;
	signal mux_5_out     : std_logic_vector (4 downto 0);
	

-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        
begin
	RS_out <= Instruction(25 downto 21);
	RD_out <= Instruction(20 downto 16);
	RT_out <= Instruction(15 downto 11);
------------------------------------------------------ Mux5 --------------------------------------------------------
	mux_5_matrix(0) <= Instruction(15 downto 11);
	mux_5_matrix(1) <= Instruction(20 downto 16);
	
	MUX_in:Mux5
		port map ( DataIn    => mux_5_matrix,
				   DataSel 	 => RF_B_sel,
				   DataOut 	 => mux_5_out 
		);
	MuxOut <= mux_5_out;
------------------------------------------------------- RF ---------------------------------------------------------
	RegisterFile:RF
		port map ( Ard1    	 => Instruction(25 downto 21),
				   Ard2    	 => mux_5_out, 
				   Awr     	 => Instruction(20 downto 16),
				   WrEn    	 => RF_WrEn,
				   Clk     	 => Clk,
				   Rst     	 => Rst,
				   Din       => mux_32_out,
				   Dout1   	 => RF_A,
				   Dout2   	 => RF_B
		);	
--------------------------------------------------- Immed16to32 ----------------------------------------------------
	ImmedSelector:Immed16to32
		port map ( instr_in  => Instruction(15 downto 0),
				   instr_sel => immExt,
				   instr_out => Immed
		);
------------------------------------------------------ Mux32 -------------------------------------------------------
	mux_32_matrix(0) <= ALU_out;
	mux_32_matrix(1) <= MEM_out;
	
	MUX_out:Mux32
		port map ( DataIn  	 => mux_32_matrix,
				   DataSel 	 => RF_WrData_sel,
				   DataOut   => mux_32_out 
		);
      	
end Behavioral;