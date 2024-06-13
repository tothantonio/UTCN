----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 03:32:35 PM
-- Design Name: 
-- Module Name: si_generic - Behavioral
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

entity si_generic is
    generic (N : integer := 4);
    Port ( intrari : in std_logic_vector(0 to N-1);
        iesire : out std_logic);
end si_generic;

architecture Behavioral of si_generic is

begin

process(intrari)
variable V : std_logic := '1';
begin
V := '1';
for I in 0 to N-1 loop
    V := V and intrari(I);
end loop;  
iesire <= V;
end process;


end Behavioral;
