library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity dcd_bin_4bit is
    Port (input: in std_logic_vector(3 downto 0);
          en : in std_logic;
          output: out std_logic_vector(15 downto 0));
end dcd_bin_4bit;

architecture Behavioral of dcd_bin_4bit is

begin
process(input, en)
begin
    if en = '0' then
        case input is
        when "0000" => output <= "111111111111110";
        when "0001" => output <= "111111111111101";
        when "0010" => output <= "111111111111011";
        when "0011" => output <= "111111111110111";
        when "0100" => output <= "111111111101111";
        when "0101" => output <= "111111111011111";
        when "0110" => output <= "111111110111111";
        when "0111" => output <= "111111101111111";
        when "1000" => output <= "111111011111111";
        when "1001" => output <= "111110111111111";
        when "1010" => output <= "111101111111111";
        when "1011" => output <= "111011111111111";
        when "1100" => output <= "110111111111111";
        when "1101" => output <= "101111111111111";
        when "1110" => output <= "011111111111111";
        when "1111" => output <= "111111111111111";
        end case;
    else output <= "XXXXXXXXXXXXXXXX";
    end if;
end process;
end Behavioral;
