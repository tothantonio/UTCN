library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Registru is
	port (A:in bit_vector(3 downto 0);
	M,Load,L,R,Reset: in bit;
	Q: inout bit_vector(3 downto 0):="0000");
end entity;

architecture Registru_Comp of Registru is
signal CLK:bit;
begin
Clock: process(CLK)
begin
	CLK<=not CLK after 10 ns;
end process;
P: process(CLK,M,Load,L,R,Reset)
begin
	if(CLK'event and CLK='1') then
		if(Reset='1') then Q<="0000";
		elsif(Load='1') then Q<=A;
		elsif(M='1') then Q<=Q;
		elsif(L='1') then Q<=Q sll 1;
		elsif(R='1') then Q<=Q srl 1;
		end if;
		end if;
		end process;
		end architecture;
		
	