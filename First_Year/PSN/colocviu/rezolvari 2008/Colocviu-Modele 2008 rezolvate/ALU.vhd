library IEEE;
use IEEE.STD_LOGIC_1164.all;
use STD_LOGIC_SIGNED.all;

entity ALU is
	 port(
		 s : in STD_LOGIC_VECTOR(0 to 2);
		 a : in STD_LOGIC_VECTOR(0 to 0);
		 b : in STD_LOGIC_VECTOR(0 to 0);
		 o : out STD_LOGIC_VECTOR(0 to 0)
	     );
end ALU;

--}} End of automatically maintained section

architecture Arhitectura of ALU is
begin

	 -- enter your statements here --
process(a,b,s)
begin
	case s is
		when "000" => o <= a + b;
		when "001" => o <= a - b;
		when "010" => o <= a * b;
		when "011" => o <= a xnor b; -- In loc de impartire - NU e implementata
		when "100" => o <= a and b;
		when "101" => o <= not a;
		when "110" => o <= a or b;
		when "111" => o <= a xor b;	
		when others => o <= "0";
	end case;
end process;

end Arhitectura;
