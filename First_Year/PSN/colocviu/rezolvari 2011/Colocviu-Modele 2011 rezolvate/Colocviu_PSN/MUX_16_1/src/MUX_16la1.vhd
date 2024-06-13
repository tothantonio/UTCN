library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.all;

entity MUX is
	generic(n:integer:=4);
	port(a:in std_logic_vector(0 to 2**n-1);
	s:in std_logic_vector(0 to n-1);
	q:out std_logic);
end entity;

architecture arh of mux is
begin 
	process(s,a)
	variable aux:integer;
	begin
		aux:=conv_integer(s);
		q<=a(aux-1);
	end process;
end arh;

	