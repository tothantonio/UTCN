library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity Numarator_2bit is
	port(A: in std_logic_vector(1 downto 0);
	R,L,CLK:in bit;
	Q:inout std_logic_vector(1 downto 0):="00");
end entity;

architecture ARH_Counter of Numarator_2bit is
begin
	process(CLK,L,R)
	begin
		if(CLK'event and CLK='1') then
			if(R='1') then Q<="00";
			elsif(L='1') then Q<=A;
			else
				Q<=Q+"01";
			end if;
			end if;
			end process;
		end architecture;
	
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;		
		
entity MS_Counter is
end entity;

architecture ARH_MS_COUNTER of MS_Counter is  

component Numarator_2bit is
	  port(A: in std_logic_vector(1 downto 0);
	R,L,CLK:in bit;
	Q:inout std_logic_vector(1 downto 0):="00");
end component;		  

signal Sr,Sl,CLK:bit;
signal Sq,Sa:std_logic_vector(1 downto 0);	 

begin
	P1: Numarator_2bit port map(Sa,Sr,Sl,CLK,Sq);
	process(CLK)
	begin
		CLK<=not CLK after 10 ns;
	end process;
	Sa<="10";
	Sr<='0','1' after 40 ns,'0' after 60 ns;
	Sl<='0','1' after 60 ns,'0' after 80 ns;
	
end architecture;

		