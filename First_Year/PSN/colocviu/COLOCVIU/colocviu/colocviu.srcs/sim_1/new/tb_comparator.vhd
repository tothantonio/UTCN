library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_comparator is
end tb_comparator;

architecture Behavioral of tb_comparator is

    component comparator is
    port(a, b : in std_logic;
         eq, less, gr : out std_logic); 
    end component;
    
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    
    signal eq, less, gr : std_logic;
begin
    e1 : comparator port map(a => a, b => b, eq => eq, less => less, gr => gr);
    
    process 
    begin
    wait for 50 ns;
    a <= '0';
    b <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    wait for 10 ns;
    end process;
end Behavioral;
