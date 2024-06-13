library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX8_1 is
  Port (i: in bit_vector(7 downto 0);
        s: in bit_vector(2 downto 0);
        y: out bit);
end MUX8_1;

architecture Behavioral of MUX8_1 is

begin
with s select
    y <= i(0) when "000",
         i(1) when "001",
         i(2) when "010",
         i(3) when "011",
         i(4) when "100",
         i(5) when "101",
         i(6) when "110",
         i(7) when "111";
         
end Behavioral;
