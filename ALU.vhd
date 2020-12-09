--> Compiled
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
    
Entity ALU is
	port(
			A:	in std_logic_vector    (3 downto 0);	-- A operand
			B:	in std_logic_vector    (3 downto 0);	-- B operand
			S:	in std_logic_vector    (3 downto 0);	-- OpCode
			Q:	out std_logic_vector    (3 downto 0)	-- answer
	);
end  ALU;
    
    
Architecture Behavior of ALU is
	signal temp: std_logic_vector    (3 downto 0);
   BEGIN
      with S select
			Q <= 	A 				when "0000",
					(not A) 		when "1111", 
					
					B 				when "0001",
					(not B) 		when "1110", 
					
					(A + B) 		when "0110",
					(A - B) 		when "1001",
					
					(A or B) 	when "0101",
					(A and B)	when "1010",
--					temp 			when "0011", -- nope
					
					(A xor B)	when others;
   END Behavior;