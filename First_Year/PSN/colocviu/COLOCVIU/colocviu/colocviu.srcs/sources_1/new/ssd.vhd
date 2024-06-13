library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ssd is
    port(input : in std_logic_vector(15 downto 0);
         clk   : in std_logic;
         anodes : out std_logic_vector(3 downto 0);
         cathodes : out std_logic_vector(6 downto 0));
end ssd;

architecture Behavioral of ssd is

type ssd_digits is array(0 to 9) of std_logic_vector(6 downto 0);

constant digits : ssd_digits := ("0000001",
                                 "1001111",
                                 "0010010",
                                 "0000110",
                                 "1001100",
                                 "0100100",
                                 "0100000",
                                 "0001111",
                                 "0000000",
                                 "0000100");
signal count: std_logic_vector(15 downto 0) := x"0000";
signal curr_digit : std_logic_vector(0 to 6);

begin
process(clk)
begin
    if rising_edge(clk) then
        count <= count + 1;
    end if;
end process;

    process(count(15 downto 14))
    begin
        case count(15 downto 14) is
        when "00" => anodes <= "1110";
        curr_digit <= digits(conv_integer(input(3 downto 0)));
        when "01" => anodes <= "1101";
        curr_digit <= digits(conv_integer(input(7 downto 4)));
        when "10" => anodes <= "1011";
        curr_digit <= digits(conv_integer(input(11 downto 8)));
        when "11" => anodes <= "0111";
        curr_digit <= digits(conv_integer(input(15 downto 11)));
        end case;
    end process;
    cathodes <= curr_digit;
end Behavioral;
