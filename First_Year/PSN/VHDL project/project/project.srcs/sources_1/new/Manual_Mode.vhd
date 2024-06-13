library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;   

-- Componenta pentru modul manual
entity Manual_Mode is
    Port (
        switches : in STD_LOGIC_VECTOR (7 downto 0); 
        led_output : out STD_LOGIC_VECTOR (7 downto 0));
end Manual_Mode;

architecture Behavioral of Manual_Mode is

begin
    led_intensity_process: process(switches)
    begin
        led_output <= switches;
    end process;
end Behavioral;
