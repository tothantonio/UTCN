library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF is
    Port (
        T   : in STD_LOGIC;
        clk : in STD_LOGIC;
        Q   : out STD_LOGIC
    );
end T_FF;

architecture Behavioral of T_FF is
    signal Q_int : STD_LOGIC := '0'; 
begin

    process (clk, Q_int, T)
    begin
        if rising_edge(clk) then
            if T = '0' then
                Q_int <= Q_int;
            elsif T = '1' then
                Q_int <= not Q_int; 
            end if;
        end if;
        Q <= Q_int;
    end process;
end Behavioral;
