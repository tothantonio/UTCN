library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity num_moebius_D is
    Port (clk, r : in std_logic;
          Q        : out std_logic_vector(7 downto 0));
end num_moebius_D;

architecture Behavioral of num_moebius_D is
signal d: std_logic_vector(7 downto 0) := (others => '0');
begin
    process(clk, r)
    begin
        if r = '1' then
            d <= (others => '1');
        elsif rising_edge(clk) then
            d(0) <= not d(0);
            for i in 1 to 7 loop
                if d(i - 1) = '1' then
                    d(i) <= not d(i);
                else d(i) <= d(i);
                end if;
            end loop;
        end if;
    end process;
    Q <= d;
end Behavioral;
