LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Forward_Unit_Testbench IS
END Forward_Unit_Testbench;
 
architecture behavior of Forward_Unit_Testbench is
 
    component Forward_Unit
		Port ( -- DEC_Reg ---------------------------------------------------------------
			   DEC_Reg_RS, DEC_Reg_RDRT	  		 			 : in  std_logic_vector ( 4 downto 0);
		       -- EX_Reg ----------------------------------------------------------------
		       EX_Reg_RegWrite					 			 : in  std_logic;
		       EX_Reg_RD 						 			 : in  std_logic_vector ( 4 downto 0);
		       -- MEM_Reg ---------------------------------------------------------------
		       MEM_Reg_RegWrite					 			 : in  std_logic;
		       MEM_Reg_RD 						             : in  std_logic_vector ( 4 downto 0);
		       -- Muxes -----------------------------------------------------------------
		       DEC_Reg_RF_A, DEC_Reg_RF_B, DEC_Reg_Write_Mux : in  std_logic_vector (31 downto 0);
		       EX_Reg_ALU_out						 		 : in  std_logic_vector (31 downto 0);
		       FU_UpMux_OUT, FU_DownMux_OUT		 			 : out std_logic_vector (31 downto 0)
		);
    end component;
    

	--Inputs
	signal DEC_Reg_RS        : std_logic_vector( 4 downto 0) := (others => '0');
	signal DEC_Reg_RDRT      : std_logic_vector( 4 downto 0) := (others => '0');
	signal EX_Reg_RegWrite   : std_logic := '0';
	signal EX_Reg_RD 	     : std_logic_vector( 4 downto 0) := (others => '0');
	signal MEM_Reg_RegWrite  : std_logic := '0';
	signal MEM_Reg_RD 	     : std_logic_vector( 4 downto 0) := (others => '0');
	signal DEC_Reg_RF_A 	 : std_logic_vector(31 downto 0) := (others => '0');
	signal DEC_Reg_RF_B 	 : std_logic_vector(31 downto 0) := (others => '0');
	signal DEC_Reg_Write_Mux : std_logic_vector(31 downto 0) := (others => '0');
	signal EX_Reg_ALU_out    : std_logic_vector(31 downto 0) := (others => '0');

	--Outputs
	signal FU_UpMux_OUT 	 : std_logic_vector(31 downto 0);
	signal FU_DownMux_OUT 	 : std_logic_vector(31 downto 0);

  
BEGIN
 
	uut: Forward_Unit 
		Port map ( DEC_Reg_RS        => DEC_Reg_RS,
				   DEC_Reg_RDRT	     => DEC_Reg_RDRT,
				   EX_Reg_RegWrite   => EX_Reg_RegWrite,					 			 
				   EX_Reg_RD 	     => EX_Reg_RD, 
				   MEM_Reg_RegWrite  => MEM_Reg_RegWrite, 
				   MEM_Reg_RD 		 => MEM_Reg_RD,
				   DEC_Reg_RF_A      => DEC_Reg_RF_A,
				   DEC_Reg_RF_B      => DEC_Reg_RF_B,
				   DEC_Reg_Write_Mux => DEC_Reg_Write_Mux,
				   EX_Reg_ALU_out	 => EX_Reg_ALU_out,
				   FU_UpMux_OUT      => FU_UpMux_OUT,
				   FU_DownMux_OUT	 => FU_DownMux_OUT
        );

	stim_proc: process
	begin
---------------------------------------------------------------------------------------------------------------------------- 0ns
	-- Testing if Hazard unit works as intended
		-------------------------------------------------------------------------------------------------------------------- 0ns
		DEC_Reg_RF_A	  <= "00000000000000000000000000000100"; -- Setting RF_A equal to 4
		DEC_Reg_RF_B	  <= "00000000000000000000000000000101"; -- Setting RF_B equal to 5
		DEC_Reg_Write_Mux <= "00000000000000000000000000000110"; -- Setting Write_Mux equal to 6
		EX_Reg_ALU_out	  <= "00000000000000000000000000000111"; -- Setting Write_Mux equal to 7
		-------------------------------------------------------------------------------------------------------------------- 0ns
		DEC_Reg_RS       <= "00000";  							 -- Setting RD from DEC register equal to 0
		DEC_Reg_RDRT     <= "00000";  						   	 -- Setting RDRT from DEC register equal to 0
		EX_Reg_RegWrite  <= '0'; 	 							 -- Setting RegWrite fron Ex register equal to 0 
		EX_Reg_RD 		 <= "00000"; 							 -- Setting RD from Ex register equal to 0
		MEM_Reg_RegWrite <= '0';     							 -- Setting RegWrite fron MEM register equal to 0
		MEM_Reg_RD		 <= "00000"; 							 -- Setting RD from EX register equal to 0
		wait for 100ns;											 -- Expecting Fu_upMux equal to 4 and FU_DownMux equal to 5
		-------------------------------------------------------------------------------------------------------------------- 100ns
		DEC_Reg_RS       <= "00000";  							 -- Setting RD from DEC register equal to 0
		DEC_Reg_RDRT     <= "00000";  						   	 -- Setting RDRT from DEC register equal to 0
		EX_Reg_RegWrite  <= '1'; 	 							 -- Setting RegWrite fron Ex register equal to 1
		EX_Reg_RD 		 <= "00000"; 							 -- Setting RD from Ex register equal to 0
		MEM_Reg_RegWrite <= '0';     							 -- Setting RegWrite fron MEM register equal to 0
		MEM_Reg_RD		 <= "00000"; 							 -- Setting RD from EX register equal to 0
		wait for 100ns;											 -- Expecting Fu_upMux equal to 4 and FU_DownMux equal to 5
		-------------------------------------------------------------------------------------------------------------------- 200ns
		DEC_Reg_RS       <= "00000";  							 -- Setting RD from DEC register equal to 0
		DEC_Reg_RDRT     <= "00000"; 						   	 -- Setting RDRT from DEC register equal to 0
		EX_Reg_RegWrite  <= '1'; 	 							 -- Setting RegWrite fron Ex register equal to 1
		EX_Reg_RD 		 <= "00001"; 							 -- Setting RD from Ex register equal to 1
		MEM_Reg_RegWrite <= '0';     							 -- Setting RegWrite fron MEM register equal to 0
		MEM_Reg_RD		 <= "00000"; 							 -- Setting RD from EX register equal to 0
		wait for 100ns;											 -- Expecting Fu_upMux equal to 7 and FU_DownMux equal to 7
		-------------------------------------------------------------------------------------------------------------------- 300ns
		DEC_Reg_RS       <= "00001";  							 -- Setting RD from DEC register equal to 1
		DEC_Reg_RDRT     <= "00001"; 						   	 -- Setting RDRT from DEC register equal to 0
		EX_Reg_RegWrite  <= '1'; 	 							 -- Setting RegWrite fron Ex register equal to 1
		EX_Reg_RD 		 <= "00001"; 							 -- Setting RD from Ex register equal to 1
		MEM_Reg_RegWrite <= '0';     							 -- Setting RegWrite fron MEM register equal to 0
		MEM_Reg_RD		 <= "00000"; 							 -- Setting RD from EX register equal to 0
		wait for 100ns;											 -- Expecting Fu_upMux equal to 6 and FU_DownMux equal to 6
		-------------------------------------------------------------------------------------------------------------------- 400ns
		DEC_Reg_RS       <= "00010";  							 -- Setting RD from DEC register equal to 0
		DEC_Reg_RDRT     <= "00010"; 						   	 -- Setting RDRT from DEC register equal to 2
		EX_Reg_RegWrite  <= '0'; 	 							 -- Setting RegWrite fron Ex register equal to 0
		EX_Reg_RD 		 <= "00010"; 							 -- Setting RD from Ex register equal to 2
		MEM_Reg_RegWrite <= '1';     							 -- Setting RegWrite fron MEM register equal to 1
		MEM_Reg_RD		 <= "00010"; 							 -- Setting RD from EX register equal to 2
		wait for 100ns;											 -- Expecting Fu_upMux equal to 6 and FU_DownMux equal to 6
		-------------------------------------------------------------------------------------------------------------------- 500ns

      wait;
   end process;

END;