----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 02:32:43 PM
-- Design Name: 
-- Module Name: circuit_curs2 - Behavioral
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

entity circuit_curs is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Y : out STD_LOGIC);
end circuit_curs;

architecture Behavioral of circuit_curs is

component inversor is
    Port ( A : in STD_LOGIC;
           notA : out STD_LOGIC);
end component inversor;

signal nA, nB, andSign : STD_LOGIC;

begin

inv1 : inversor port map (A, nA);
inv2 : inversor port map (B, nB);

process (nA, nB)
begin

if nA = '1' and nB = '1' then
    andSign <= '1';
else
    andSign <= '0';
end if;
end process;

Y <= andSign or C;

end Behavioral;
