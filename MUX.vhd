--> Compiled
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
    
Entity MUX is
   port(
			A: 	in		std_logic_vector	(3 downto 0);	-- Input A
			B: 	in		std_logic_vector	(3 downto 0);	-- Input B
			
			Y: 	out 	std_logic_vector	(3 downto 0);  -- Output
			SEL:	in		std_logic	-- SELECT A or B
            
   );
end  MUX;
    
    
Architecture MUX_beh of MUX is
	BEGIN
		with SEL select
			Y <=	A when '0',
					B when '1';
   end MUX_beh;