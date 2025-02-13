library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TFF_tb is
end entity;

architecture tb of TFF_tb is
component T_FF is
Port ( T,CLK,R : in STD_LOGIC;
Q,Qn : out STD_LOGIC);
end component;

signal T,CLK,R,Q,Qn : STD_LOGIC;

begin
e1: T_FF port map(
T => T,
CLK => CLK,
R => R,
Q => Q,
Qn => Qn);

process
begin

CLK <= '0';
wait for 10 ns;
CLK <= '1';
wait for 10 ns;

end process;

process
begin

R <= '0';

T <= '0';
wait for 20 ns;

T <= '1';
wait for 20 ns;

end process;
end tb;