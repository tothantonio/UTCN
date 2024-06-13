library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_jk_ff is
end tb_jk_ff;

architecture Behavioral of tb_jk_ff is

    component comp_jk_ff is
    Port (j, k : in std_logic;
             clk  : in std_logic;
             r : in std_logic;
             Q    : out std_logic;
             Qn   : out std_logic);
    end component;
    
    signal j, k, clk, r, Q, Qn : std_logic;
begin
    e1 : comp_jk_ff port map(
        j => j, k => k, clk => clk,
        r => r, Q => Q, Qn => Qn
    );
    
    process
    begin
        clk <= '0';
        wait for 15 ns;
        clk <= '1';
        wait for 15 ns;
    end process;
    
    process
    begin
        j <= '0';
        k <= '0';
        r <= '1';
        wait for 10 ns;
        j <= '0';
        k <= '1';
        r <= '1';
        wait for 10 ns;
        j <= '1';
        k <= '0';
        r <= '1';
        wait for 10 ns;
        j <= '1';
        k <= '1';
        r <= '1';
        wait for 10 ns;
        j <= '0';
        k <= '0';
        r <= '0';
        wait for 10 ns;
    end process;

end Behavioral;
