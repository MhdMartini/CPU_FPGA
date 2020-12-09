library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
    
Entity Address_conv is
   port(
         vector:	in std_logic_vector (3 downto 0); 
         add_int: out integer range 0 to 15
   );
end  Address_conv;
    
    
Architecture Address_conv_beh of Address_conv is
   BEGIN
		process (vector)
			begin
				case vector is
					when "0000" => add_int<=0;
					when "0001" => add_int<=1;
					when "0010" => add_int<=2;
					when "0011" => add_int<=3;
					when "0100" => add_int<=4;
					when "0101" => add_int<=5;
					when "0110" => add_int<=6;
					when "0111" => add_int<=7;
					when "1000" => add_int<=8;
					when "1001" => add_int<=9;
					when "1010" => add_int<=10;
					when "1011" => add_int<=11;
					when "1100" => add_int<=12;
					when "1101" => add_int<=13;
					when "1110" => add_int<=14;
					when "1111" => add_int<=15;
				end case;
				
			end process;
      
   END Address_conv_beh;