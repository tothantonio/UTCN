library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_ROM_8x4 is
    Port (address: in std_logic_vector(3 downto 0);
          en    : in std_logic;
          d_rom : out std_logic_vector(7 downto 0));
end comp_ROM_8x4;

architecture Behavioral of comp_ROM_8x4 is

type memory is array (0 to 15) of std_logic_vector(7 downto 0);
signal rom : memory := (x"00", x"01", x"02", x"03", x"04", x"05", x"06", x"06", x"07", x"09", x"0A", x"0B",x"0C", x"0D", x"0E", x"0F");
begin
process(address, en)
begin
    if en = '0' then d_rom <= "ZZZZZZZZ";
    else
        case address is
        when x"0" => d_rom <= rom(0);
        when x"1" => d_rom <= rom(1);
        when x"2" => d_rom <= rom(2);
        when x"3" => d_rom <= rom(3);
        when x"4" => d_rom <= rom(4);
        when x"5" => d_rom <= rom(5);
        when x"6" => d_rom <= rom(6);
        when x"7" => d_rom <= rom(7);
        when x"8" => d_rom <= rom(8);
        when x"9" => d_rom <= rom(9);
        when x"A" => d_rom <= rom(10);
        when x"B" => d_rom <= rom(11);
        when x"C" => d_rom <= rom(12);
        when x"D" => d_rom <= rom(13);
        when x"E" => d_rom <= rom(14);
        when others => d_rom <= rom(15);   
        end case;
    end if;      
end process;
end Behavioral;
