library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all;
--use IEEE.std_logic_unsigned.all;

entity ROM_16X16 is
	port (adress:in bit_vector(3 downto 0);
	valoare: out bit_vector(15 downto 0));
end entity;

architecture ROM_COMP of ROM_16X16 is
begin 
	process(adress)
	begin
	case adress is
		when "0000" => valoare<="0000000000000000";
		when "0001" => valoare<="0000000000000000";
		when "0010" => valoare<="0000000000000000";
		when "0011" => valoare<="0000000000000000";
		when "0100" => valoare<="0000000011110000";
		when "0101" => valoare<="0000000000000000";
		when "0110" => valoare<="0000000000000000";
		when "0111" => valoare<="0000000000111100";
		when "1000" => valoare<="0000000000000000";
		when "1001" => valoare<="0000000000000000";
		when "1010" => valoare<="0000000000000000";
		when "1011" => valoare<="0011110000000000";
		when "1100" => valoare<="0000000000000000";
		when "1101" => valoare<="0000000000000000";
		when "1110" => valoare<="0000000000000000";
		when "1111" => valoare<="0000000000000000";
		end case;
	end process;
end architecture;

		   

	