--> Compiled
-- Reference: https://www.intel.com/content/www/us/en/programmable/quartushelp/13.0/mergedProjects/hdl/vhdl/vhdl_pro_ram_inferred.htm
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;

entity RAM is
	port(
			Din:	in		std_logic_vector (3 downto 0);	-- Data in
			Dout:	out	std_logic_vector (3 downto 0);	-- Data out

			add: 	in 	std_logic_vector (3 downto 0);
			WE:   in   	std_logic					-- Read (1) Write (0)

--			CLOCK: in   std_logic  -- change later
   );
end RAM;


architecture RAM_beh of RAM is
--   type mem is array(0 to 15) of std_logic_vector(3 downto 0);  -- try 15 downto 0
	type mem is array(15 downto 0) of std_logic_vector(3 downto 0);
   signal ram_block : mem;
	
	BEGIN
		
		process (add, Din, WE)
			begin
							
				if (WE = '0') then
					ram_block(conv_integer(add)) <= Din;
				elsif (WE = '1') then
					Dout <= ram_block(conv_integer(add));
				else 
					Dout <= "0000";
				end if;
			
			end process;
		
	
	END RAM_beh;