-- 36. Modul de simulare pt. registru de deplasare stânga-dreapta si dreapta-stânga

-- Registru de deplasare:
library IEEE;
use IEEE.STD_LOGIC_1164.all;


-- Entitate:
entity reg is
	port (
			CLK, L, ST, DR, R, SI:  in STD_LOGIC;
						      Din:  in STD_LOGIC_VECTOR (7 downto 0);
							 Dout: out STD_LOGIC_VECTOR (7 downto 0)
		  );
end entity;

-- Arhitectura:
architecture comportamental of reg is
signal M: STD_LOGIC_VECTOR (7 downto 0);
begin
	process (CLK, L, ST, DR, R, SI, Din)
	begin
		if (CLK = '1') and (CLK'EVENT) then
			if (R = '1') then 			   			-- Resetare
				M <= "00000000";
			elsif (L = '1') then					-- Incarcare paralela
				M <= Din;
			elsif (DR = '1') then					-- Deplasare dreapta
				M(6 downto 0) <= M(7 downto 1);
				M(7) <= SI;
			elsif (ST = '1') then					-- Deplasare stanga
				M(7 downto 1) <= M(6 downto 0);
				M(0) <= SI;
			end if;
		end if;
	end process;
	Dout <= M;
end architecture;

-- Modul de simulare:
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity modul_reg is
end entity;

-- Arhitectura:
architecture comportamental of modul_reg is
	component reg is
		port (
				CLK, L, ST, DR, R, SI:  in STD_LOGIC;
							      Din:  in STD_LOGIC_VECTOR (7 downto 0);
								 Dout: out STD_LOGIC_VECTOR (7 downto 0)
		  	);
	end component;

signal CLK, L, ST, DR, R, SI: STD_LOGIC :='0';
signal Din: STD_LOGIC_VECTOR (7 downto 0);
signal Dout: STD_LOGIC_VECTOR (7 downto 0);

begin
	UST: reg port map (CLK, L, ST, DR, R, SI, Din, Dout);
	
	clock: process
	begin
		CLK <= not (CLK);
		wait for 5 ns;
	end process;
	
	Din <= "01101101", "00001111" after 10 ns;
	L <= '1', '0' after 20 ns;
	SI <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0' after 60 ns,
		  '1' after 70 ns, '0' after 80 ns, '1' after 90 ns, '0' after 100 ns, '1' after 110 ns, '0' after 120 ns;
	R <= '0', '1' after 20 ns, '0' after 30 ns;
	ST <= '0', '1' after 30 ns, '0' after 80 ns;
	DR <= '0', '1' after 80 ns;
end architecture;
	
		