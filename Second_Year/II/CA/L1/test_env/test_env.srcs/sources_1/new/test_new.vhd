library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity test_new is
Port (     clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end test_new;

architecture Behavioral of test_new is

component MPG
port(clk : in std_logic;
     btn : in std_logic;
     enable : out std_logic);
end component;

signal en: std_logic := '0';
signal cnt: std_logic_vector(2 downto 0) := "000";
signal dir: std_logic := '0';
signal dcd_out: std_logic_vector(7 downto 0) := x"00";

begin

conectareMPG: MPG port map(clk, btn(0), en);

dir <= sw(0);

--Counter
process(clk)
begin
    if rising_edge(clk) then
        if en = '1' then
            if dir = '0' then
                cnt <= cnt + 1;
            end if;
        end if;
    end if;
end process;

--DCD 3:8
process(cnt)
begin
    case cnt is
            when "000" => dcd_out <= "00000001";
            when "001" => dcd_out <= "00000010";
            when "010" => dcd_out <= "00000100";
            when "011" => dcd_out <= "00001000";
            when "100" => dcd_out <= "00010000";
            when "101" => dcd_out <= "00100000";
            when "110" => dcd_out <= "01000000";
            when "111" => dcd_out <= "10000000";
            when others => dcd_out <= x"00";
    end case;
end process;

led(7 downto 0) <= dcd_out;

end Behavioral;
