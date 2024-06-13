
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_substractor is
    port(a, b, bin : in std_logic;
         diff, bout : out std_logic);
end full_substractor;

architecture Behavioral of full_substractor is

begin

    diff <= (a xor b) xor bin;
    bout <= ((not a) and b) or (not(a xor b) and bin);
end Behavioral;
