library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PROC_SC is
	port (Clk, Reset, PC_LdEnbl : std_logic);
end PROC_SC;

architecture Behavioral of PROC_SC is
	------------------- COMPONENTS --------------------------------------------------------------------
	component Control is
		Port ( PC_LdEnbl, ALU_zero 				: in   std_logic;
			   Instruction						: in   std_logic_vector(31 downto 0);
			   -- IFSTAGE INPUTS/OUTPUTS ---------------------------------------------
			   PC_sel, PC_LdEn  		  		: out  std_logic;
			   -- DECSTAGE INPUTS ----------------------------------------------------
			   RF_WrData_sel, RF_B_sel, RF_WrEn : out  std_logic;
			   ImmExt_s			 				: out  std_logic_vector ( 1 downto 0);  
			   -- EXSTAGE INPUTS -----------------------------------------------------	
			   ALU_Bin_sel		 				: out  std_logic;	
			   ALU_func			 				: out  std_logic_vector ( 3 downto 0);
			   -- MEMSTAGE INPUTS/OUTPUTS --------------------------------------------
			   ByteOp, Mem_WrEn  				: out  std_logic
		);
	end component;
	
	component Datapath is
		Port ( Clk, Rst   		 				: in  std_logic;
			   -- IFSTAGE INPUTS/OUTPUTS ---------------------------------------------
			   PC_sel, PC_LdEn  		  		: in  std_logic;
			   PC_out							: out std_logic_vector (31 downto 0);
			   -- DECSTAGE INPUTS ----------------------------------------------------
			   RF_WrData_sel, RF_B_sel, RF_WrEn : in  std_logic;
			   ImmExt_s			 				: in  std_logic_vector ( 1 downto 0);  
			   Instruction 						: in  std_logic_vector (31 downto 0);
			   -- EXSTAGE INPUTS -----------------------------------------------------	
			   ALU_Bin_sel		 				: in  std_logic;	
			   ALU_func			 				: in  std_logic_vector ( 3 downto 0);
			   ALU_zero, ALU_cout, ALU_ovf		: out std_logic;
			   -- MEMSTAGE INPUTS/OUTPUTS --------------------------------------------
			   ByteOp, Mem_WrEn  				: in  std_logic;
			   MM_RdData 		 				: in  std_logic_vector (31 downto 0);
			   MM_WrEn			 				: out std_logic;
			   MM_Addr, MM_WrData 	  			: out std_logic_vector (31 downto 0)			  
		);
	end component;
	
	component RAM is
		 port ( clk, data_we 		  			: in  std_logic;
				inst_addr, data_addr 			: in  std_logic_vector(10 downto 0);
				data_din 				  		: in  std_logic_vector(31 downto 0);
				inst_dout				  		: out std_logic_vector(31 downto 0);
				data_dout 			  			: out std_logic_vector(31 downto 0)
		);
	end component; 
	
	
	-- Needed signals
	-- IFSTAGE ---------------------------------------------------------------------------------------------------------------------
	signal IN_PC_sel, IN_PC_LdEn 		 			 : std_logic := '0';
	signal IN_PC_out								 : std_logic_vector (31 downto 0) := (others => '0');
	-- DECSTAGE --------------------------------------------------------------------------------------------------------------------
	signal IN_RF_WrData_sel, IN_RF_B_sel, IN_RF_WrEn : std_logic := '0';
	-- EXSTAGE ---------------------------------------------------------------------------------------------------------------------
	signal IN_ALU_Bin_sel, IN_ALU_zero				 : std_logic := '0';
	signal IN_ImmExt_s			    				 : std_logic_vector ( 1 downto 0) := (others => '0');
	signal IN_ALU_func 								 : std_logic_vector ( 3 downto 0) := (others => '0');
	-- MEMSTAGE --------------------------------------------------------------------------------------------------------------------
	signal IN_ByteOp, IN_Mem_WrEn, IN_MM_WrEn		 : std_logic := '0';
	signal IN_Instruction, IN_MM_Addr, IN_MM_WrData	 : std_logic_vector (31 downto 0) := (others => '0');
	-- Ram -------------------------------------------------------------------------------------------------------------------------
	signal IN_MM_RdData                              : std_logic_vector (31 downto 0) := (others => '0');

-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        
begin
----------------------------------------------------- Control ------------------------------------------------------
	Control_module:Control
		port map ( PC_LdEnbl 	 => PC_LdEnbl,
				   ALU_zero 	 => IN_ALU_zero,
				   Instruction	 => IN_Instruction,
				   PC_sel        => IN_PC_sel, 
				   PC_LdEn       => IN_PC_LdEn,
				   RF_WrData_sel => IN_RF_WrData_sel,
				   RF_B_sel      => IN_RF_B_sel,
				   RF_WrEn       => IN_RF_WrEn,
				   ImmExt_s      => IN_ImmExt_s,
				   ALU_Bin_sel   => IN_ALU_Bin_sel,
				   ALU_func      => IN_ALU_func,
				   ByteOp        => IN_ByteOp,
				   Mem_WrEn      => IN_Mem_WrEn               
		);

----------------------------------------------------- Datapath ------------------------------------------------------
	Datapath_module:Datapath
		port map ( Clk     		 => Clk,
				   Rst     		 => Reset,
				   PC_sel  		 => IN_PC_sel,
				   PC_LdEn 		 => IN_PC_LdEn,
				   PC_out	 	 => IN_PC_out,
				   RF_WrData_sel => IN_RF_WrData_sel, 
				   RF_B_sel		 => IN_RF_B_sel,
				   RF_WrEn  	 => IN_RF_WrEn, 
				   ImmExt_s      => IN_ImmExt_s,
				   Instruction   => IN_Instruction,
				   ALU_Bin_sel   => IN_ALU_Bin_sel,
				   ALU_func      => IN_ALU_func,
				   ALU_zero      => IN_ALU_zero,
				   ALU_cout      => open,
				   ALU_ovf       => open,
				   ByteOp        => IN_ByteOp, 
				   Mem_WrEn      => IN_Mem_WrEn,
				   MM_RdData     => IN_MM_RdData,
				   MM_WrEn       => IN_MM_WrEn,
				   MM_Addr       => IN_MM_Addr,
				   MM_WrData     => IN_MM_WrData
		);
	
-------------------------------------------------------- Ram --------------------------------------------------------
	Ram_module:Ram
		port map ( clk       	 => Clk,
				   data_we   	 => IN_MM_WrEn,
				   inst_addr 	 => IN_PC_out(12 downto 2),
				   data_addr	 => IN_MM_Addr(10 downto 0),
				   data_din  	 => IN_MM_WrData,
				   inst_dout 	 => IN_Instruction,
				   data_dout 	 => IN_MM_RdData 
		);

end Behavioral;

