library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity struct_BCD_GRAY is
    Port (bcd_in : in std_logic_vector(3 downto 0);
          gray_out: out std_logic_vector(3 downto 0));
end struct_BCD_GRAY;

architecture Behavioral of struct_BCD_GRAY is

component comp_BIN_GRAY is
    Port(bin_in : in std_logic_vector(3 downto 0);
         gray_out : out std_logic_vector(3 downto 0));
         
end component;

begin
    e1: comp_BIN_GRAY port map(bin_in => BCD_in, gray_out => gray_out);
end Behavioral;
