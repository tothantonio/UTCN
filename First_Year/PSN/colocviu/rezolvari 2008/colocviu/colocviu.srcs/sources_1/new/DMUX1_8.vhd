library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DMUX1_8 is
  Port (i: in bit;
        s: in bit_vector(2 downto 0);
        y: out bit_vector(7 downto 0));
end DMUX1_8;

architecture Behavioral of DMUX1_8 is

begin
    y(0) <= i when s = "000" else '0';
    y(1) <= i when s = "000" else '0';
    y(2) <= i when s = "000" else '0';
    y(3) <= i when s = "000" else '0';
    y(4) <= i when s = "000" else '0';
    y(5) <= i when s = "000" else '0';
    y(6) <= i when s = "000" else '0';
    y(7) <= i when s = "000" else '0';

end Behavioral;
