library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conc_dcd_3bit is
  Port (input : in std_logic_vector(2 downto 0);
        output : out std_logic_vector(7 downto 0));
end conc_dcd_3bit;

architecture Behavioral of conc_dcd_3bit is

begin
    output(0) <= '1' when input = "000" else '0';
    output(1) <= '1' when input = "001" else '0';
    output(2) <= '1' when input = "010" else '0';
    output(3) <= '1' when input = "011" else '0';
    output(4) <= '1' when input = "100" else '0';
    output(5) <= '1' when input = "101" else '0';
    output(6) <= '1' when input = "110" else '0';
    output(7) <= '1' when input = "111" else '0';
   
end Behavioral;
