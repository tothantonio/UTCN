library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_2bit is
    port(a, b : in std_logic_vector(1 downto 0);
         s    : out std_logic_vector(1 downto 0));
end full_adder_2bit;

architecture Behavioral of full_adder_2bit is
    
    component full_adder is
    port(a, b, cin: in std_logic;
         cout, sum: out std_logic);
    end component;
    
    signal c0, c1, c: std_logic;
begin
    e1 : full_adder port map(a(0), b(0), c0, c, s(0));
    e2 : full_adder port map(a(1), b(1), c, c1, s(1));
end Behavioral;
