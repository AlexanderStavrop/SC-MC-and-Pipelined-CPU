library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity MEMSTAGE is
    Port ( ByteOp, Mem_WrEn					 	  : in  STD_LOGIC;
           ALU_MEM_Addr, MEM_DataIn, MM_RdData : in  STD_LOGIC_VECTOR (31 downto 0);
           MM_WrEn 									  : out STD_LOGIC;
           MM_Addr, MM_WrData, MEM_DataOut	  : out STD_LOGIC_VECTOR (31 downto 0));
end MEMSTAGE;

architecture Behavioral of MEMSTAGE is		
	
	-- Needed signals
	signal instaction_addr 									 : std_logic_vector (31 downto 0) := (others => '0');
	signal index_bytes  	  									 : std_logic_vector ( 1 downto 0) := (others => '0');
	signal selected_bytes_load, selected_bytes_store : std_logic_vector ( 7 downto 0) := (others => '0');
	
begin
	MM_WrEn <= MEM_WrEn;
	
	index_bytes <= ALU_MEM_Addr(1) & ALU_MEM_Addr(0);
	
	with index_bytes select 
		selected_bytes_load <= MM_RdData (7 downto 0)   when "00",
								     MM_RdData (15 downto 8)  when "01",
									  MM_RdData (23 downto 16) when "10",
									  MM_RdData (31 downto 24) when "11",
								     "00000000"					when others;
	 
	instaction_addr <= "00" & ALU_MEM_Addr(31 downto 2);									  			  -- Ignoring the 2 lsbs
	MM_Addr 		 	 <= unsigned(instaction_addr) + 1024;									  			  -- Adding the required offset

	with ByteOp  
		select MEM_DataOut <= MM_RdData 											   		when '0',	  -- Load Word
							     "000000000000000000000000" & selected_bytes_load    when '1',	  -- Load Byte
							     x"00000000"											   	   when others;  -- Other case
	
	with ByteOp
		select MM_WrData <= MEM_DataIn   										   		when '0',     -- Store Word
					 			  "000000000000000000000000" & MEM_DataIn(7 downto 0) when '1',	  -- Store Byte
								  x"00000000"											   		when others;  -- Other cases							 
end Behavioral;
