library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity MPG is
    port(clk : in std_logic;
         btn : in std_logic;
         enable : out std_logic);
end MPG;

architecture Behavioral of MPG is
signal Q1, Q2, Q3 : std_logic := '0';
signal cnt_int : std_logic_vector(17 downto 0) := (others => '0');

begin

enable <= Q2 and not(Q3);

counter:
process(clk)
begin
    if rising_edge(clk) then
            cnt_int <= cnt_int + 1;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if cnt_int(17 downto 0) = "111111111111111111" then
            Q1 <= btn;
        end if;
        
        Q2 <= Q1;
        Q3 <= Q2;
    end if;
end process;
end Behavioral;
