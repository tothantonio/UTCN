library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_env is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end test_env;

architecture Behavioral of test_env is

component MPG is
port(clk : in std_logic;
         btn : in std_logic;
         enable : out std_logic);
end component;

signal cnt: std_logic_vector(15 downto 0) := x"0000";
signal en: std_logic := '0';
signal dir: std_logic := '0';

begin

conectareMPG: MPG port map(clk, btn(0), en);

--en <= btn(0);
dir <= sw(0);

process(clk)
begin
    if rising_edge(clk) then
        if en = '1' then
            if dir = '0' then
                cnt <= cnt + 1;
            else 
                cnt <= cnt - 1;
            end if;
        end if;
    end if;
end process;

led <= cnt;

end Behavioral;
