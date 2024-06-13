library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_detector2 is
end tb_detector2;

architecture Behavioral of tb_detector2 is
    component detector2 is
        port(clk, r : in std_logic;
             serial_in : in std_logic;
             detected  : out std_logic);
    end component;
    
    signal clk : std_logic := '0';
    signal r   : std_logic := '0';
    signal serial_in : std_logic := '0';
    signal detected: std_logic := '0';
    constant clk_period : time := 10 ns;
begin
    e1: detector2 port map(clk => clk, r => r, serial_in => serial_in, detected => detected);
    
    process
    begin
    clk <= '0';
    wait for clk_period / 2;
    clk <= '1';
    wait for clk_period / 2;
    end process;
    
    process
    begin
    serial_in <= '0';
    r <= '1';
    wait for 30 ns;
        r <= '0';
    wait for 40 ns;
    serial_in <= '1';
    wait for 10 ns;
    serial_in <= '1';
    wait for 20 ns;
    serial_in <= '0';
    wait for 20 ns;
    serial_in <= '0';
    wait;
    end process;
end Behavioral;
