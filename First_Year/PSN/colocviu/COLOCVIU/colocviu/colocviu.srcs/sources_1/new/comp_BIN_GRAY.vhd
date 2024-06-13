library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_BIN_GRAY is
  Port (bin_in : in std_logic_vector(3 downto 0);
        gray_out : out std_logic_vector(3 downto 0));
end comp_BIN_GRAY;

architecture Behavioral of comp_BIN_GRAY is

begin
process(bin_in)
begin
    gray_out(3) <= bin_in(3);
    gray_out(2) <= bin_in(3) xor bin_in(2);
    gray_out(1) <= bin_in(2) xor bin_in(1);
    gray_out(0) <= bin_in(1) xor bin_in(0);
end process;

end Behavioral;
