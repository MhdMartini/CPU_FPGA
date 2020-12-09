--> Compiled
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
    
Entity ACC is
   port(
			input:	in std_logic_vector    (3 downto 0);
         output:	out std_logic_vector   (3 downto 0);

			CLOCK: 	in std_logic
   );
end  ACC;
    
    
Architecture ACC_beh of ACC is
	
	BEGIN
		process (CLOCK)
			begin
				if (CLOCK'event and CLOCK = '1') then
					output <= input;
				end if;
		end process;
		
   END ACC_beh;