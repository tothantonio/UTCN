library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp2421BCD is
  Port (code2421: in std_logic_vector(3 downto 0);
        bcd_out: out std_logic_vector(3 downto 0));
end comp2421BCD;

architecture Behavioral of comp2421BCD is
begin
process(code2421)
begin
    case code2421 is
    when "0000" => bcd_out <= "0000";
    when "0001" => bcd_out <= "0001";
    when "0010" => bcd_out <= "0010";
    when "0011" => bcd_out <= "0011";
    when "0100" => bcd_out <= "0100";
    when "1011" => bcd_out <= "0101";
    when "1100" => bcd_out <= "0110";
    when "1101" => bcd_out <= "0111";
    when "1110" => bcd_out <= "1000";
    when "1111" => bcd_out <= "1001";
    end case;
end process;
end Behavioral;
