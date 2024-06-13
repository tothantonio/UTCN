----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 03:13:59 PM
-- Design Name: 
-- Module Name: mux_2_1 - Behavioral
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

entity mux_2_1 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           s : in STD_LOGIC;
           en : in STD_LOGIC;
           ies : out STD_LOGIC);
end mux_2_1;

architecture Behavioral of mux_2_1 is

begin

MUX1 : process(en, s, i0, i1)
begin

if en = '1' then
    if s = '0' then
        ies <= i0;
    else
        ies <= i1;
    end if;
else
    ies <= '0';
end if;

end process MUX1;

end Behavioral;
