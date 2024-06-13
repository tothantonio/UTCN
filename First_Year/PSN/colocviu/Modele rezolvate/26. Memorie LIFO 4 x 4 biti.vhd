--  26. Memorie LIFO 4 x 4 biti

library	IEEE;
use IEEE.STD_LOGIC_1164.all;


-- Enititate:
entity LIFO_4x4 is
	
	-- Semnale de intrare si de iesire:
	port (
			CLK, R, WE, RE:  in STD_LOGIC;
					   Din:  in STD_LOGIC_VECTOR (3 downto 0);
					  Dout: out STD_LOGIC_VECTOR (3 downto 0);
			   Full, Empty: out STD_LOGIC
		  );

end entity;


-- Arhitectura
architecture comportamental of LIFO_4x4 is
shared variable tEmpty, tFull: STD_LOGIC;
shared variable	Pos: INTEGER range 0 to 4;
type mem is array (3 downto 0) of STD_LOGIC_VECTOR (3 downto 0);
shared variable M:mem := ("0000", "0000", "0000", "0000");
begin
	
	process (CLK, R, WE, RE, Din)
	begin
		if (CLK = '1') and (CLK'EVENT) then
			if (R = '1') then
				tEmpty :='1';
				tFull := '0';
				Pos := 0;
			elsif (WE = '1') and (tFull = '0') then
				M( Pos ) := Din;
				Pos := Pos + 1;
				tEmpty := '0';
				if (Pos = 4) then 
					tFull := '1';
				end if;
			elsif (RE = '1') and (tEmpty = '0') then
				Dout <= M(Pos - 1);
				Pos := Pos - 1;
				tFull := '0';
				if (Pos = 0) then
					tEmpty := '1';
				end if;
			end if;
			Empty <= tEmpty;
			Full <= tFull;
		end if;
	end process;
end architecture;
	
	