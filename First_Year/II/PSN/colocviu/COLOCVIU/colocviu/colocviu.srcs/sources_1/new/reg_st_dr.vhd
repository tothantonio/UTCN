library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_st_dr is
    port(clk, r, dir : in std_logic;
         data_in : in std_logic;
         output : out std_logic_vector(3 downto 0));
end reg_st_dr;

architecture Behavioral of reg_st_dr is
signal reg : std_logic_vector(3 downto 0) := "0000";
begin
process(clk, r)
begin
    if r = '1' then
        reg <= "0000";
    elsif rising_edge(clk) then
        if dir = '1' then
            reg <= reg(2 downto 0) & data_in;
        else reg <= data_in & reg(3 downto 1);
        end if;
    end if;
end process;
    output <= reg;
end Behavioral;
