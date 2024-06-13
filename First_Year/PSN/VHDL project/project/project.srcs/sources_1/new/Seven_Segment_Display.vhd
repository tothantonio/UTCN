library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Componenta pentru afisarea pe 7 segmente
entity Seven_Segment_Display is
    Port ( clk : in STD_LOGIC;
           mode : in STD_LOGIC_VECTOR (1 downto 0);
           anodes : out STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out STD_LOGIC_VECTOR (6 downto 0));
end Seven_Segment_Display;

architecture Behavioral of Seven_Segment_Display is

    function decode_seven_segment(value : STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
        variable seg : STD_LOGIC_VECTOR(6 downto 0);
    begin
        case value is
            when "0000" => seg := "0000001"; -- 0
            when "0001" => seg := "1001111"; -- 1
            when "0010" => seg := "0010010"; -- 2
            when "0011" => seg := "0000110"; -- 3
            when "0100" => seg := "1001100"; -- 4
            when "0101" => seg := "0100100"; -- 5
            when "0110" => seg := "0100000"; -- 6
            when "0111" => seg := "0001111"; -- 7
            when "1000" => seg := "0000000"; -- 8
            when "1001" => seg := "0000100"; -- 9
            when "1010" => seg := "0001000"; -- A
            when "1011" => seg := "1100000"; -- b
            when "1100" => seg := "0110001"; -- C
            when others => seg := "1111111"; 
        end case;
        return seg;
    end decode_seven_segment;
    
    signal mode_display : STD_LOGIC_VECTOR(6 downto 0);
    begin
       display_process: process(clk)
            begin
                if rising_edge(clk) then
                    --  doar primul anod pentru a afisa pe un singur afisor
                    anodes <= "1110"; -- '0' activeaza primul afisor, restul sunt '1'
                    case mode is
                    when "00" => -- Mod manual
                        mode_display <= decode_seven_segment("0001"); --  A pentru modul manual
                    when "01" =>  -- Mod test
                        mode_display <= decode_seven_segment("0010"); --  b pentru modul test
                    when "10" =>  -- Mod automat
                        mode_display <= decode_seven_segment("0011"); --  C pentru modul automat
                    when others =>
                        mode_display <= decode_seven_segment("0000"); --  mod neidentificat
                    end case;
        
                    cathodes <= mode_display;
                end if;
            end process;
        end Behavioral;