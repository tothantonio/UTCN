library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
    Port (a, b : in std_logic_vector(7 downto 0);
          sel: in std_logic_vector(3 downto 0);
          res: out std_logic_vector(7 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
process(a, b, sel)
begin
    case sel is
        when "0000" =>
            res <= a + b;
        when "0001" =>
            res <= a - b;
        when "0010" =>
            res <= a * b;
        when "0011" =>
            res <= std_logic_vector(to_unsigned(to_integer(unsigned(a)) / to_integer(unsigned(b)), 8));
        when "0100" =>
            res <= a and b;
        when "0101" =>
            res <= not a;
        when "0110" =>
            res <= a or b;
        when "0111" =>
            res <= a xor b;
        when others => res <= (others => '0');
        end case;
end process;
end Behavioral;
