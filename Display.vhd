--> Compiled
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
    
Entity Display is
	port(
        int:		in	std_logic_vector	(3 downto 0);	--|=> Lowest three switches as input
		  decoded:	out std_logic_vector (6 downto 0)	--|	7-bit decoded output
   );
end  Display;
    
    
Architecture Display_beh of Display is
	begin
		process(int)
			begin
				case int is
					when "0000" =>
						decoded <= "1000000";
					when "0001" =>
						decoded <= "1111001";
					when "0010" =>
						decoded <= "0100100";
					when "0011" =>
						decoded <= "0110000";
					when "0100" =>
						decoded <= "0011001";
					when "0101" =>
						decoded <= "0010010";
					when "0110" =>
						decoded <= "0000010";
					when "0111" =>
						decoded <= "1111000";
					when "1000" =>
						decoded <= "0000000";
					when "1001" =>
						decoded <= "0010000";
					when others =>
						decoded <= "0101101";
					end case;
			end process;
	end Display_beh;