library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity convertor_2421_GRAY is
    Port (a3, a2, a1, a0: in bit;
          b3, b2, b1, b0: out bit);
end convertor_2421_GRAY;

architecture Behavioral of convertor_2421_GRAY is
    
begin
    b3 <= a2 and a1;
    b2 <= (a2 and not a1) or (a3 and not a2);
    b1 <= a3 xor a1;
    b0 <= a0;
end Behavioral;
