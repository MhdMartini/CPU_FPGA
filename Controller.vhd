--> Compiled
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
    
Entity Controller is
   port(
         ACC: 	in std_logic_vector	(3 downto 0);  -- ACC value
         
			JMPZ: in std_logic;	-- JUMP to Zero
			JIFN: in std_logic;	-- JUMP to Zero if ACC = 1111
			JIFP: in std_logic;	-- JUMP to Zero if ACC = 0001
			JIFZ: in std_logic;	-- JUMP to Zero if ACC = 0000
			
			CLEAR: out std_logic
   );
end  Controller;

    
-- Monitor the JUMPS signals and assign the CLEAR signal accordingly
Architecture Controller_beh of Controller is
   BEGIN
	process (JMPZ, JIFN, JIFP, JIFZ)
		begin
			if JMPZ = '1' then
				CLEAR <= '1';
			elsif JIFN = '1' then
				if ACC = "1111" then
					CLEAR <= '1';
				end if;
			elsif JIFP = '1' then
				if ACC = "0001" then
					CLEAR <= '1';
				end if;
			elsif JIFZ = '1' then
				if ACC = "0000" then
					CLEAR <= '1';
				end if;
			else
				CLEAR <= '0';
			end if;
		end process;
      
   END Controller_beh;