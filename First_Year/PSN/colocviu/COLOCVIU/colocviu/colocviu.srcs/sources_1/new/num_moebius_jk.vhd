library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity num_moebius_jk is
       Port (clk, r : in std_logic;
          Q        : out std_logic_vector(7 downto 0));
end num_moebius_jk;

architecture Behavioral of num_moebius_jk is
    signal q_int : std_logic_vector(7 downto 0) := (others => '0');
begin
    process(clk, r)
    begin
        if r = '1' then
            q_int <= (others => '0');
        elsif rising_edge(clk) then
            q_int(0) <= not q_int(0);
            for i in 1 to 7 loop
                if q_int(i - 1) = '1' then
                    q_int(i) <= not q_int(i);
                end if;
            end loop;
        end if;
    end process;
    q <= q_int;
end Behavioral;
