library IEEE;
use IEEE.std_logic_arith.all;

entity Detect is
	port( A:in bit;
	X:in bit_vector(3 downto 0);
	Q:out bit:='0');
end entity;

architecture ARH_Detector of Detect is
signal CLK:bit;
signal i:integer range 0 to 10 :=3;
begin 
	process(CLK)
	begin
		CLK<=not CLK after 10 ns;
		end process;
	
	process(CLK,A)
	begin	   						   
		
		if(CLK'event and CLK='1') then
		if(i/=0) then
			if(A=X(i)) then 
				i<=i-1;
			else
				i<=3;
			end if;
			else
				Q<='1';			  
			end if;
			end if;
			end process;
		end architecture;
		