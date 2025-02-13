library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity D_FF is
Port ( D, CLK, R, S : in  STD_LOGIC;
Q : out  STD_LOGIC);
end D_FF;

architecture Behavioral of D_FF is

begin
process (D, CLK, R, S)
    begin
        if R = '1' then
            Q <= '0';
        elsif S = '1' then
            Q <= '1';
        elsif rising_edge(CLK) then 
            Q <= D;
        end if;
end process;
end Behavioral;