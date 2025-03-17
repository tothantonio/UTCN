library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 


entity SSD is
  Port ( digit : in std_logic_vector(31 downto 0);
         clk   : in std_logic;
         cat   : out std_logic_vector(6 downto 0);
         an    : out std_logic_vector(7 downto 0));
end SSD;

architecture Behavioral of SSD is

signal cnt: std_logic_vector(17 downto 0);
signal sel: std_logic_vector(2 downto 0);
signal out_cat: std_logic_vector(3 downto 0);
signal out_an: std_logic_vector(7 downto 0);

begin

counter: 
process(clk)
begin
    if rising_edge(clk) then
        cnt <= cnt + 1;
    end if;
end process;

sel <=  cnt(16 downto 14);

mux8x1:
process(sel)
begin
    case sel is
        when "000" => out_cat <= digit(3 downto 0);
                      out_an  <= "11111110";
        when "001" => out_cat <= digit(7 downto 4);
                      out_an <= "11111101";
        when "010" => out_cat <= digit(11 downto 8);
                      out_an  <= "11111011";
        when "011" => out_cat <= digit(15 downto 12);
                      out_an <= "11110111";
        when "100" => out_cat <= digit(19 downto 16);
                      out_an  <= "11101111";
        when "101" => out_cat <= digit(23 downto 20);
                      out_an <= "11011111";
        when "110" => out_cat <= digit(27 downto 24);
                      out_an  <= "10111111";
        when "111" => out_cat <= digit(31 downto 28);
                      out_an <= "01111111"; 
         when others => out_cat <= "00000000";
                        out_an <= "11111111";        
     end case;                                 
end process;

an <= out_an;

hex2_7:
process(out_cat)
begin
case out_cat is
    when "0000" => cat <= "1000000"; -- 0
    when "0001" => cat <= "1111001"; -- 1
    when "0010" => cat <= "0100100"; -- 2
    when "0011" => cat <= "0110000"; -- 3
    when "0100" => cat <= "0011001"; -- 4
    when "0101" => cat <= "0010010"; -- 5
    when "0110" => cat <= "0000010"; -- 6
    when "0111" => cat <= "1111000"; -- 7
    when "1000" => cat <= "0000000"; -- 8
    when "1001" => cat <= "0010000"; -- 9
    when "1010" => cat <= "0001000"; -- A
    when "1011" => cat <= "0000011"; -- B
    when "1100" => cat <= "1000110"; -- C
    when "1101" => cat <= "0100001"; -- D
    when "1110" => cat <= "0000110"; -- E
    when others => cat <= "0001110"; -- F
end case;
end process;

end Behavioral;