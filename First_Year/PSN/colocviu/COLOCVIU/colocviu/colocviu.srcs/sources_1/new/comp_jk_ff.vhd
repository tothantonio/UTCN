library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comp_jk_ff is
    Port (j, k : in std_logic;
          clk  : in std_logic;
          r, s : in std_logic;
          Q    : out std_logic);
end comp_jk_ff;

architecture Behavioral of comp_jk_ff is
begin
process(clk)
variable Q_int : std_logic := '0';
begin
    if r = '1' then Q_int := '0';
    elsif s = '1' then Q_int := '1';
    elsif rising_edge(clk) then
        if j = '0' then
            if k = '0' then
                Q_int := Q_int;
            else
            Q_int := '0';
            end if;
        elsif j = '1' then
            if k = '0' then
                Q_int := '1';
            else 
                Q_int := not Q_int;
            end if;
        end if;
     end if;
     Q <= Q_int;
end process;
end Behavioral;
