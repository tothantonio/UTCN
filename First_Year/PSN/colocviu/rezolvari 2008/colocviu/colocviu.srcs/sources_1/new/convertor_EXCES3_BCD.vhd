library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity convertor is
	port(a3, a2, a1, a0: in std_logic;
	     b3, b2, b1, b0: out std_logic);
end convertor;

architecture arhExces3 of convertor is
begin
    b3 <= (a3 and a2) or (a3 and a1 and a0);
    b2 <= (not a2 and not a1) or (not a2 and not a1) or (a2 and a1 and a0);
    b1 <= a1 xnor a0;
    b0 <= not a0;
end arhExces3;
