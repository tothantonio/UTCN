library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity conc_MUX_2_1 is
    Port (sel : in std_logic;
          data1: in std_logic_vector(3 downto 0);
          data2: in std_logic_vector(3 downto 0);
          output: out std_logic_vector(3 downto 0));
end conc_MUX_2_1;

architecture Behavioral of conc_MUX_2_1 is

begin
process(sel, data1, data2)
begin
    if sel = '0' then
        output <= data1;
    else output <= data2;
    end if;
end process;

end Behavioral;
