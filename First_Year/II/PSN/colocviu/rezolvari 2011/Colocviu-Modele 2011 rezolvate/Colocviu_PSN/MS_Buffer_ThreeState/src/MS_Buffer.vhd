library IEEE;
use IEEE.std_logic_1164.all;
entity Buffer_3state is
	port(A:in std_logic_vector(7 downto 0);
	S:in bit;
	Q:out std_logic_vector(7 downto 0));
	end entity;
architecture ARH_Buff of Buffer_3state is
begin
	process(S)
	begin
		if(S='1') then 
			Q<=A;
		else
			Q<="UUUUUUUU";
		end if;
		end process;
	end architecture;
	
	library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity MS_Buffer is
	end entity;
	
	architecture ARH_MS_Buffer of MS_Buffer is
	
	component Buffer_3state
		port(A:in std_logic_vector(7 downto 0);
	S:in bit;
	Q:out std_logic_vector(7 downto 0));
	end component;
	
	signal Sa:std_logic_vector(7 downto 0):="01010101";
	signal Sq:std_logic_vector(7 downto 0);
	signal Ss:bit;
	
	begin
		P1: Buffer_3state port map(Sa,Ss,Sq);
		P2: Ss<='0','1' after 20 ns,'0' after 40 ns,'1' after 60 ns;
	end architecture;
	
		