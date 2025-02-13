library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity struct_EXCES3_BCD is
  Port (exces3_in : in std_logic_vector(3 downto 0);
        bcd_out : out std_logic_vector(3 downto 0));
end struct_EXCES3_BCD;

architecture Behavioral of struct_EXCES3_BCD is

  component comp_EXCES3_BCD is
  Port (exces3_in : in std_logic_vector(3 downto 0);
        bcd_out: out std_logic_vector(3 downto 0));
  end component;
  
begin
   e1: comp_EXCES3_BCD port map(exces3_in => exces3_in, bcd_out => bcd_out);
end Behavioral;