library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Debounce is
    Generic (
        constant Debounce_Time : integer := 1000000 
    );
    Port (
        clk : in STD_LOGIC;
        btn_in : in STD_LOGIC; 
        btn_out : out STD_LOGIC 
    );
end Debounce;

architecture Behavioral of Debounce is
    signal btn_state : STD_LOGIC := '0';
    signal counter : integer := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if btn_in = '1' and btn_state = '0' then
                if counter < Debounce_Time then
                    counter <= counter + 1;
                else
                    btn_state <= '1';
                    btn_out <= '1';
                end if;
            elsif btn_in = '0' then
                counter <= 0;
                btn_state <= '0';
                btn_out <= '0';
            end if;
        end if;
    end process;
end Behavioral;
