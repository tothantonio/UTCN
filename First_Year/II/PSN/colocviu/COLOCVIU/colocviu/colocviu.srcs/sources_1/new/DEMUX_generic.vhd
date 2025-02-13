library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity DEMUX_generic is 
	generic (nr_sel : integer := 4 );	
	port(S : in std_logic_vector(nr_sel - 1 downto 0);
	     X : in std_logic;
	     O : out std_logic_vector(2**nr_sel - 1 downto 0));
end DEMUX_generic;

architecture rtl of DEMUX_generic is
begin 
    process(S, X)
	begin
		O <= (others => '0');
		O(to_integer(unsigned(S))) <= X;
	end process;
end rtl;