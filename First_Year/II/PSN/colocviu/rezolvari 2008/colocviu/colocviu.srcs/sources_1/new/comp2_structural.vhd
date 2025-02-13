library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp2_structural is
  Port (a, b: in std_logic_vector(1 downto 0);
        a_eq_b, a_less_b, a_gr_b: out bit);
end comp2_structural;

architecture Behavioral of comp2_structural is

begin

    a_eq_b <= '1' when  a = b;
    a_less_b <= '1' when a < b;
    a_gr_b <= '1' when a > b;
    
end Behavioral;
