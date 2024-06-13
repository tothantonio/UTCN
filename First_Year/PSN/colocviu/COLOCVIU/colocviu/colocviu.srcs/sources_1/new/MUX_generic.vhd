library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MUX_generic is
    generic(nr_sel : integer := 3);
    port(S : in std_logic_vector(nr_sel - 1 downto 0);
         X : in std_logic_vector(2**nr_sel - 1 downto 0);
         O : out std_logic);
end entity;


architecture bhv of MUX_generic is
begin
    O <= X(conv_integer(S));
end architecture bhv;