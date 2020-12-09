--> Compiled
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
    
Entity ClockEntity is
   port(
         BTN:   	in std_logic;  
         CLK: 		out std_logic;
			CLK_INV:	out std_logic
   );
end  ClockEntity;
    
    
Architecture Clock_beh of ClockEntity is
   BEGIN
		CLK <= not BTN;
		CLK_INV <= BTN;
      
   END Clock_beh;