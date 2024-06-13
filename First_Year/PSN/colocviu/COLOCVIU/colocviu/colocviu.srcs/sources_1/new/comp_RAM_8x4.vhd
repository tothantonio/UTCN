library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comp_RAM_8x4 is
    Port (address : in std_logic_vector(3 downto 0);
       en, wr, rd : in std_logic;
          data_in : in std_logic_vector(7 downto 0);
          data_out: out std_logic_vector(7 downto 0));
end comp_RAM_8x4;

architecture Behavioral of comp_RAM_8x4 is
type memory is array(0 to 15) of std_logic_vector(7 downto 0);
signal rom : memory := (x"00", x"01", x"02", x"03", x"04", x"05", x"06", x"07", x"08", x"09", x"0A", x"0B", x"0C", x"0D", x"0E", x"0F");

begin
process(address, en, rd, wr)
begin 
    if en = '0' then data_out <= "ZZZZZZZZ";
    else
        if rd = '1' then
        case address is
        when x"0" => data_out <= rom(0);
        when x"1" => data_out <= rom(1);
        when x"2" => data_out <= rom(2);
        when x"3" => data_out <= rom(3);
        when x"4" => data_out <= rom(4);
        when x"5" => data_out <= rom(5);
        when x"6" => data_out <= rom(6);
        when x"7" => data_out <= rom(7);
        when x"8" => data_out <= rom(8);
        when x"9" => data_out <= rom(9);
        when x"A" => data_out <= rom(10);
        when x"B" => data_out <= rom(11);
        when x"C" => data_out <= rom(12);
        when x"D" => data_out <= rom(13);
        when x"E" => data_out <= rom(14);
        when others => data_out <= rom(15);
        end case;
        elsif wr = '1' then
            case address is
        when x"0" => rom(0) <= data_in; 
        when x"1" => rom(1) <= data_in; 
        when x"2" => rom(2) <= data_in; 
        when x"3" => rom(3) <= data_in; 
        when x"4" => rom(4) <= data_in; 
        when x"5" => rom(5) <= data_in; 
        when x"6" => rom(6) <= data_in; 
        when x"7" => rom(7) <= data_in; 
        when x"8" => rom(8) <= data_in; 
        when x"9" => rom(9) <= data_in; 
        when x"A" => rom(10) <= data_in; 
        when x"B" => rom(11) <= data_in; 
        when x"C" => rom(12) <= data_in; 
        when x"D" => rom(13) <= data_in; 
        when x"E" => rom(14) <= data_in; 
        when others => rom(15) <= data_in;
        end case;
        else data_out <= rom(0);
        end if;
     end if;
end process;
end Behavioral;
