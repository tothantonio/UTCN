library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;  
use IEEE.std_logic_unsigned.all;

entity Counter is
	port(A:in std_logic_vector(7 downto 0);
	L,R:in bit;
	Q: inout std_logic_vector(7 downto 0));
end entity;

architecture ARH_Count of Counter is
signal CLK:bit;
begin	
Clock: process(CLK)
begin
	CLK<=not CLK after 10ns;
end process;
Numarare: process(CLK,L,R) 
variable Qa: integer;
begin			 
	Qa:=conv_integer(Q);
	if(CLK'event and CLK='1') then
		if(R='1') then Qa:=0;
		elsif(L='1') then Qa:=conv_integer(A);
		else Qa:=Qa+1;
			end if;
			Q<=conv_std_logic_vector(Qa,8);
		end if;
end process;
end architecture;

		