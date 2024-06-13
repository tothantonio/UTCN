library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_EXCES3_BCD is
   Port (exces3_in : in std_logic_vector(3 downto 0);
        bcd_out: out std_logic_vector(3 downto 0));
end comp_EXCES3_BCD;

architecture Behavioral of comp_EXCES3_BCD is

begin
process(exces3_in)
begin
    case exces3_in is
    when "0011" => bcd_out <= "0000";
    when "0100" => bcd_out <= "0001";
    when "0101" => bcd_out <= "0010";
    when "0110" => bcd_out <= "0011";
    when "0111" => bcd_out <= "0100";
    when "1000" => bcd_out <= "0101";
    when "1001" => bcd_out <= "0110";    
    when "1010" => bcd_out <= "0111";
    when "1011" => bcd_out <= "1000";
    when "1100" => bcd_out <= "1001";
    when others => bcd_out <= "XXXX";
    end case;
end process;
end Behavioral;
