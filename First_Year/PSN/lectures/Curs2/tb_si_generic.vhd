----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 03:44:49 PM
-- Design Name: 
-- Module Name: tb_si_generic - Behavioral
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

entity tb_si_generic is
--  Port ( );
end tb_si_generic;

architecture Behavioral of tb_si_generic is
--constant N := 4;
component si_generic is
    generic (N : integer := 4);
    Port ( intrari : in std_logic_vector(0 to N-1);
        iesire : out std_logic);
end component si_generic;

signal intrari : std_logic_vector(0 to 7);
signal iesire : std_logic;

begin

si_gate : si_generic 
    generic map (N => 8)
    port map (intrari, iesire);

process

begin

intrari <= "11110101";
wait for 20 ns;

intrari <= "11111111";
wait for 20 ns;

intrari <= "11111110";
wait for 20 ns;

intrari <= "11111111";
wait for 20 ns;
wait;
end process;


end Behavioral;
