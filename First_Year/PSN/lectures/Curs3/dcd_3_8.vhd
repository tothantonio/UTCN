----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 04:14:20 PM
-- Design Name: 
-- Module Name: dcd_3_8 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dcd_3_8 is
    Port ( intrare : in STD_LOGIC_VECTOR (2 downto 0);
           iesire : out STD_LOGIC_VECTOR (7 downto 0));
end dcd_3_8;

architecture Behavioral of dcd_3_8 is

begin

process(intrare)
begin

case intrare is
    when "000" => iesire <= "00000001"; --caz 0
    when "001" => iesire <= "00000010"; --caz 1
    when "010" => iesire <= "00000100";
    when "011" => iesire <= "00001000";
    when "100" => iesire <= "00010000";
    when "101" => iesire <= "00100000";
    when "110" => iesire <= "01000000";
    when others => iesire <= "10000000";
end case;

end process;


end Behavioral;
