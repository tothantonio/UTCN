library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity codificator_zecimal is
  Port (input : in std_logic_vector(9 downto 0);
        output : out std_logic_vector(3 downto 0));
end codificator_zecimal;

architecture Behavioral of codificator_zecimal is

begin
process(input)
begin
    case input is
    when "0000000001" => output <= "0000";
    when "0000000010" => output <= "0001";
    when "0000000100" => output <= "0010";
    when "0000001000" => output <= "0011";
    when "0000010000" => output <= "0100";
    when "0000100000" => output <= "0101";
    when "0001000000" => output <= "0110";
    when "0010000000" => output <= "0111";
    when "0100000000" => output <= "1000";
    when "1000000000" => output <= "1001";
    when others => output <= "XXXX";
    end case;
end process;
end Behavioral;
