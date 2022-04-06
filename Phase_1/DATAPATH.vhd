library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DATAPATH is
	 Port ( Clk, Rst   		 					  : in  std_logic;
			  -- IFSTAGE INPUTS/OUTPUTS ---------------------------------------------
			  PC_sel, PC_LdEn  		  		     : in  std_logic;
			  PC_out								     : out std_logic_vector (31 downto 0);
       	  -- DECSTAGE INPUTS ----------------------------------------------------
			  RF_WrData_sel, RF_B_sel, RF_WrEn : in  std_logic;
			  ImmExt_s			 					  : in  std_logic_vector ( 1 downto 0);  
			  Instruction 							  : in  std_logic_vector (31 downto 0);
			  -- EXSTAGE INPUTS -----------------------------------------------------	
			  ALU_Bin_sel		 					  : in  std_logic;	
			  ALU_func			 					  : in  std_logic_vector ( 3 downto 0);
			  ALU_zero, ALU_cout, ALU_ovf		  : out std_logic;
			  -- MEMSTAGE INPUTS/OUTPUTS --------------------------------------------
			  ByteOp, Mem_WrEn  					  : in  std_logic;
			  MM_RdData 		 					  : in  std_logic_vector (31 downto 0);
			  MM_WrEn			 					  : out std_logic;
			  MM_Addr, MM_WrData 	  			  : out STD_LOGIC_VECTOR (31 downto 0)			  
	 );
end DATAPATH;

architecture Behavioral of DATAPATH is
	
------------------- COMPONENTS --------------------------------------------------------------------
	component IFSTAGE is
		port ( Reset, Clk, PC_sel, PC_LdEn 						: in  std_logic;
				 PC_Immed         			  						: in  std_logic_vector(31 downto 0);
				 PC               			  						: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component DECSTAGE is
		Port ( RF_WrEn, RF_WrData_sel, RF_B_sel, Clk, Rst  : in  STD_LOGIC;
				 immExt											  		: in  std_logic_vector (1 downto 0);
				 Instr, ALU_out, MEM_out 			  			 	: in  STD_LOGIC_VECTOR (31 downto 0);
				 Immed, RF_A, RF_B 									: out STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component EXSTAGE is
		Port ( RF_A, RF_B, Immed 			  						: in  STD_LOGIC_VECTOR (31 downto 0);
             ALU_Bin_sel  	    			  						: in  STD_LOGIC;
             ALU_func 			 			  						: in  STD_LOGIC_VECTOR (3 downto 0);
             ALU_out 			 			  						: out  STD_LOGIC_VECTOR (31 downto 0);
             ALU_zero, ALU_cout, ALU_ovf 						: out  STD_LOGIC
		);
	end component;

	component MEMSTAGE is
		 Port ( ByteOp, Mem_WrEn					 	  			: in  STD_LOGIC;
              ALU_MEM_Addr, MEM_DataIn, MM_RdData 			: in  STD_LOGIC_VECTOR (31 downto 0);
              MM_WrEn 									  			: out STD_LOGIC;
				  MM_Addr, MM_WrData, MEM_DataOut	  			: out STD_LOGIC_VECTOR (31 downto 0)
		 );
	end component;

-- Needed signals
-- DECSTAGE SIGNAL ----------------------------------------------------------------------------------
	signal busA, busB 							     : std_logic_vector (31 downto 0) := (others => '0');
	signal IN_ALU_out, IN_MEM_out, IN_IMMED_OUT : std_logic_vector (31 downto 0) := (others => '0');


-------------------------------------------------- Main Functions --------------------------------------------------                                                                                        
begin
----------------------------------------------------- IFSTAGE ------------------------------------------------------
	IF_module:IFSTAGE
		port map ( PC_sel   => PC_sel, 
					  PC_LdEn  => PC_LdEn,
					  PC_Immed => IN_IMMED_OUT,
					  Reset    => Rst,
					  Clk      => Clk,                   
					  PC       => PC_out                  
		);

----------------------------------------------------- DECSTAGE ------------------------------------------------------
	DEC_module:DECSTAGE
		port map ( RF_WrEn        => RF_WrEn, 
					  RF_WrData_sel  => RF_WrData_sel,
					  RF_B_sel       => RF_B_sel,               
					  immExt         => ImmExt_s,
					  Instr 		     => Instruction,
					  Clk            => Clk,
					  Rst            => Rst,    
					  ALU_out		  => IN_ALU_out,
					  MEM_out 	     => IN_MEM_out,
					  Immed 			  => IN_IMMED_out,
					  RF_A			  => busA,
					  RF_B			  => busB					
		);
		
----------------------------------------------------- EXSTAGE ------------------------------------------------------
	EX_module:EXSTAGE
		Port map ( RF_A        => busA, 
				     RF_B        => busB,
					  Immed		  => IN_IMMED_out,
				     ALU_Bin_sel => ALU_Bin_sel,
					  ALU_func	  => ALU_func, 
				     ALU_out	  => IN_ALU_out,
                 ALU_zero    => ALU_zero,
					  ALU_cout	  => ALU_cout,
					  ALU_ovf     => ALU_ovf
		);

----------------------------------------------------- MEMSTAGE -----------------------------------------------------
	MEM_module:MEMSTAGE
		Port map( ByteOp       => ByteOp,
					 Mem_WrEn	  => Mem_WrEn,
					 ALU_MEM_Addr => IN_ALU_out,
					 MEM_DataIn   => busB,
					 MM_RdData    => MM_RdData, 
					 MM_WrEn      => MM_WrEn,
				    MM_Addr      => MM_Addr,
					 MM_WrData    => MM_WrData,
					 MEM_DataOut  => IN_MEM_out	
		);
	
end Behavioral;
