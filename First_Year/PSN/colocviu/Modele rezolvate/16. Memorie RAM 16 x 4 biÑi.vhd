-- 16. Memorie RAM 16 x 4 bi�i

library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Entitatea:
entity RAM16_4 is
	
	-- Semnale de intrare si de iesire:
	port (
			         ADR:  in STD_LOGIC_VECTOR (3 downto 0);
			 CLK, CS, WE:  in STD_LOGIC;  
			         Din:  in STD_LOGIC_VECTOR (3 downto 0);
			        Dout: out STD_LOGIC_VECTOR (3 downto 0)
		  );

end entity;

-- Architectura:
architecture comportamental of RAM16_4 is
type mem is array (15 downto 0) of STD_LOGIC_VECTOR (3 downto 0);
signal M:mem := (	  --Continutul memoriei
	"0000",    	-- 15
	"0001",		-- 14
	"0010",
	"0011",
	"0100",
	"0101",
	"0110",
	"0111",
	"1000",
	"1001",
	"1010",
	"1011",
	"1100",
	"1101",
	"1110",
	"1111" );  -- 0
begin
	
	process (CLK, CS, ADR, WE)
	begin
		if CLK = '1' and CLK'EVENT and CS = '1' then
			if (WE = '1') then
				M (conv_integer(ADR)) <= Din;
			end if;
			Dout <= M( conv_integer(ADR) );
		end if;
	end process;
	
end architecture;