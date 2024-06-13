library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity comp_BCD_EXCES3 is
  Port (bcd_in : in std_logic_vector(3 downto 0);
        exces3_out: out std_logic_vector(3 downto 0));
end comp_BCD_EXCES3;

architecture Behavioral of comp_BCD_EXCES3 is

begin
    process(bcd_in) 
    begin
        exces3_out <= bcd_in + "0011";
    end process;

end Behavioral;
