
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Decodificator_BCD_zecimal is
  Port (a, b, c, d: in bit;
        zero,
        unu,
        doi,
        trei,
        patru,
        cinci,
        sase,
        sapte,
        opt,
        noua,
        zece,
        unsprezece,
        doisprezece,
        treisprezece,
        paisprezece,
        cincisprezece: out bit);
end Decodificator_BCD_zecimal;

architecture Behavioral of Decodificator_BCD_zecimal is

begin
    zero <= not(not(a) and not(b) and not(c) and not(d));
    unu <= not(not(a) and not(b) and not(c) and d);
    doi <= not(not(a) and not(b) and c and not(d));
    trei <= not(not(a) and not(b) and c and d);
    patru <= not(not(a) and b and not(c) and not(d));
    cinci <= not(not(a) and b and not(c) and d);
    sase <= not(not(a) and b and c and not(d));
    sapte <= not(not(a) and b and c and d);
    opt <= not(a and not(b) and not(c) and not(d));
    noua <= not(a and not(b) and not(c) and d);
    zece <= not(a and not(b) and c and not(d));
    unsprezece <= not(a and not(b) and c and d);
    doisprezece <= not(a and b and not(c) and not(d));
    treisprezece <= not(a and b and not(c) and d);
    paisprezece <= not(a and b and c and not(d));
    cincisprezece <= not(a and b and c and d);

end Behavioral;
