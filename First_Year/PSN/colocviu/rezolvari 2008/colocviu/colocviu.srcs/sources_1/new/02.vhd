library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SAU_EXCLUSIV is
  Port (a, b:in bit;
        c: out bit);
end SAU_EXCLUSIV;

architecture Behavioral of SAU_EXCLUSIV is
begin
    c <= a xor b;
end Behavioral;

entity COINCIDENTA is 
Port(a, b: in bit;
     c: out bit);
end COINCIDENTA;

architecture arh1 of COINCIDENTA is
begin
    c <= a xnor b;
end arh1;
