--> Compiled
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
    
Entity PC is
   port(
			CLOCK	: in std_logic;

			output: out std_logic_vector(3 downto 0);

			RST	: in std_logic
   );
end  PC;

    
Architecture PC_beh of PC is
	signal Q: std_logic_vector(3 downto 0);
	
	BEGIN

		process(CLOCK, RST)
			begin
				if RST = '1' then
					Q <= "0000";
				elsif (CLOCK'event and CLOCK = '1') then
					Q <= Q + 1;
				end if;
			end process;
		output <= Q;
		
   END PC_beh;
	