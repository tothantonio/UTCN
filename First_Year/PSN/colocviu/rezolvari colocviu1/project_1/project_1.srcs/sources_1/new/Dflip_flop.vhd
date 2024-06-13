----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.05.2024 15:41:57
-- Design Name: 
-- Module Name: Dflip_flop - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Dflip_flop is
  Port (D, R, S, CLK: in std_logic;
        Q: out std_logic);
end Dflip_flop;

architecture Behavioral of Dflip_flop is

begin
    process(CLK, R)
    begin
        if (R = '0') then
            Q <= '1';
        elsif (CLK'event and CLK = '1') then
            Q <= D;
        end if;
    end process;
end Behavioral;
