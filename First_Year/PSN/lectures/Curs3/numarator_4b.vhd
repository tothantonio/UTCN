----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 03:34:10 PM
-- Design Name: 
-- Module Name: numarator_4b - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity numarator_4b is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           NUMAR : out STD_LOGIC_VECTOR (3 downto 0));
end numarator_4b;

architecture Behavioral of numarator_4b is
signal numar_temp : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin

process (rst, en, clk)
begin
if rst = '1' then 
    numar_temp <= "0000";
else
    if en = '1' then
        if clk'event and clk = '1' then
            numar_temp <= numar_temp + 1;
        end if;
    end if;
end if;
NUMAR <= numar_temp;
end process;

end Behavioral;
