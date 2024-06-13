library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity dataflow_dcd_BCD_zecimal is
  Port (input : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(9 downto 0));
end dataflow_dcd_BCD_zecimal;

architecture Behavioral of dataflow_dcd_BCD_zecimal is

begin
    output(0) <= '1' when input = "0000" else '0';
    output(1) <= '1' when input = "0001" else '0';
    output(2) <= '1' when input = "0010" else '0';
    output(3) <= '1' when input = "0011" else '0';
    output(4) <= '1' when input = "0100" else '0';
    output(5) <= '1' when input = "0101" else '0';
    output(6) <= '1' when input = "0110" else '0';
    output(7) <= '1' when input = "0111" else '0';
    output(8) <= '1' when input = "1000" else '0';
    output(9) <= '1' when input = "1001" else '0';

end Behavioral;
