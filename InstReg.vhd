--> Compiled
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
    
Entity InstReg is
   port(
         input:   in std_logic_vector 	(5 downto 0);  
         output: out std_logic_vector 	(5 downto 0);
			
			CLOCK:	in std_logic
   );
end  InstReg;
    
    
Architecture InstReg_beh of InstReg is
   BEGIN
	process (CLOCK)
		begin
			if (CLOCK'event and CLOCK = '1') then
				output <= input;
			end if;
		end process;
      
   END InstReg_beh;