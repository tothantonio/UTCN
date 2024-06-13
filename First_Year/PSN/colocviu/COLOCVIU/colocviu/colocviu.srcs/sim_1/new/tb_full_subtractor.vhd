library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_full_subtractor is
end tb_full_subtractor;

architecture Behavioral of tb_full_subtractor is
    
    component full_substractor is
    port(a, b, bin : in std_logic;
         diff, bout : out std_logic);
    end component;
    
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal bin : std_logic := '0';
    
    signal diff : std_logic;
    signal bout : std_logic;
    
    
begin
    e1 : full_substractor port map(a => a, b => b, bin => bin, bout => bout, diff => diff);
    
    process
    begin
    wait for 50 ns;
    a <= '1';
    b <= '0';
    bin <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    bin <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    bin <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '0';
    bin <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    bin <= '1';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    bin <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    bin <= '1';
    wait for 10 ns;
    end process;
end Behavioral;
