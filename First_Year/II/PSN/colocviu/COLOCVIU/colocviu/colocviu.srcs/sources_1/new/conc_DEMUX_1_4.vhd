library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conc_DEMUX_1_4 is
    Port (input : in std_logic;
          sel   : in std_logic_vector(1 downto 0);
          output: out std_logic_vector(3 downto 0));
end conc_DEMUX_1_4;

architecture Behavioral of conc_DEMUX_1_4 is

begin
process(input, sel)
begin
    if sel = "00" then
        output(0) <= input;
    elsif sel = "01" then
        output(1) <= input;
    elsif sel = "10" then
        output(2) <= input;
    elsif sel = "11" then
        output(3) <= input;
    else output <= "0000";
    end if;
end process;
end Behavioral;
