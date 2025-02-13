library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comparator is
    port(a, b : in std_logic;
         eq, less, gr : out std_logic);
end comparator;

architecture Behavioral of comparator is

begin
process(a, b)
begin
    if a = b then
        eq <= '1';
        less <= '0';
        gr <= '0';
    elsif a < b then
        less <= '1';
        eq <= '0';
        gr <= '0';
    else 
        gr <= '1';
        less <= '0';
        eq <= '0';
    end if;
end process;
end Behavioral;
