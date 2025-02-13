library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registru is
    port(clk, si, l, r, sl, sr : in std_logic;
         data_in : in std_logic_vector(3 downto 0);
         data_out : out std_logic_vector(3 downto 0));
end registru;

architecture arh1 of registru is
signal M : std_logic_vector(3 downto 0) := (others => '0');
begin
    process(si, l, r, sl, clk, sr, data_in)
    begin
        if rising_edge(clk) then
          if r = '1' then
            M <= "0000";
          elsif l = '1' then
            M <= data_in;
          elsif sr = '1' then
            M(6 downto 0) <= M(7 downto 1);
            M(7) <= si;  
          elsif sl = '1' then
            M(7 downto 1) <= M(6 downto 0);
            M(0) <= si;
          end if;
        end if;
    end process;
end arh1;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor2 is
    port(a, b : in std_logic;
         c : out std_logic);
end xor2;

architecture arh2 of xor2 is
begin
    c <= a xor b;
end arh2;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity struct_gen_rand_4bit is
    port(r, clk : in std_logic;
         data_out : out std_logic_vector(3 downto 0));
end struct_gen_rand_4bit;

architecture Behavioral of struct_gen_rand_4bit is
component xor2 is
    port(a, b : in std_logic;
         c : out std_logic);
end component;

component registru is
    port(clk, si, l, r, sl, sr : in std_logic;
         data_in : in std_logic_vector(3 downto 0);
         data_out : out std_logic_vector(3 downto 0));
end component;

signal x : std_logic;
signal y : std_logic_vector(7 downto 0);
begin
    reg: registru port map (clk => clk, L=> R, sl => '0', sr => '1', r=> '0', si => x, data_in => "00010000", data_out => y);
	xor1: XOR2 port map (Y(7), Y(4), X);
	data_out <= y (7 downto 4);
	end Behavioral;
