library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity registru_universal is
	port(clk : in std_logic;
	     l, r, si: in std_logic;
	     sl, sr : in std_logic;
	     data_in : in std_logic_vector(7 downto 0);
	     data_out : out std_logic_vector(7 downto 0)
	     );
end registru_universal;

architecture comportamental of registru_universal is
    signal M: STD_LOGIC_VECTOR (7 downto 0);
begin
	process (clk, l, sl, r, sr, data_in)
	begin
	   if rising_edge(clk) then
			if (r = '1') then 			   			-- Resetare
				M <= "00000000";
			elsif (l = '1') then					-- Incarcare paralela
				M <= data_in;
			elsif (sr = '1') then					-- Deplasare dreapta
				M(6 downto 0) <= M(7 downto 1);
				M(7) <= si;
			elsif (sl = '1') then					-- Deplasare stanga
				M(7 downto 1) <= M(6 downto 0);
				M(0) <= si;
			end if;
		end if;
	end process;
	data_out <= M;
end architecture;