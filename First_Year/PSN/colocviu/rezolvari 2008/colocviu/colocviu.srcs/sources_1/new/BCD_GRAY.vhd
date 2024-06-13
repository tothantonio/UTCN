library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity convertor_BCD_GRAY is
  Port (a3, a2, a1, a0: in bit;
        b3, b2, b1, b0: out bit );
end convertor_BCD_GRAY;

architecture Behavioral of convertor_BCD_GRAY is

begin
    b3 <= a3;
    b2 <= a2 xor a3;
    b1 <= a1 xor a1;
    b0 <= a1 xor a0;

end Behavioral;
