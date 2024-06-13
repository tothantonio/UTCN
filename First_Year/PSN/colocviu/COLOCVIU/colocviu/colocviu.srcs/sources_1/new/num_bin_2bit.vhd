----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2024 10:46:10
-- Design Name: 
-- Module Name: num_bin_2bit - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity num_bin_2bit is
        port(r, clk : in std_logic;
             btn    : in std_logic;
             Q      : out std_logic_vector(1 downto 0));
end num_bin_2bit;

architecture Behavioral of num_bin_2bit is

    component debouncer is
    port(btn, clk: in std_logic;
         en      : out std_logic);
    end component;
    
    signal cnt : std_logic_vector(1 downto 0) := (others => '0');
    signal btn_debounced : std_logic;
begin
    e1 : debouncer port map(btn, clk, btn_debounced);
    process(r, clk)
    begin
        if r = '1' then
            cnt <= "00";
        elsif rising_edge(clk) then
            if btn_debounced = '1' then
                cnt <= cnt + 1;
            end if;
        end if;
    end process;
    Q <= cnt;
end Behavioral;
