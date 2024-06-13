library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debouncer is
    port(btn, clk: in std_logic;
         en      : out std_logic);
end debouncer;

architecture Behavioral of debouncer is
signal count : std_logic_vector(15 downto 0) := (others => '0');
signal t : std_logic;
signal q1, q2, q3 : std_logic;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;
    
    t <= '1' when count <= x"FFFF" else '0';
    
    process(clk)
    begin
        if rising_edge(clk) then
            if t = '1' then
                q1 <= btn;
            end if;
        end if;
    end process;
    
    process(clk)
    begin
        if rising_edge(clk) then
            q2 <= q1;
            q3 <= q2;
        end if;
    end process;
    
    en <= q2 and not q3; 
end Behavioral;
