library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_reg_st_dr is
end tb_reg_st_dr;

architecture Behavioral of tb_reg_st_dr is

    component reg_st_dr is
    port(clk, r, dir : in std_logic;
         data_in : in std_logic;
         output : out std_logic_vector(3 downto 0));
    end component;
    
    signal clk, r, dir, data_in : std_logic := '0';
    signal output : std_logic_vector(3 downto 0);
begin
    e1: reg_st_dr port map(clk => clk, r => r, dir => dir, data_in => data_in, output => output);
    
    process
    begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    end process;
    
    process
    begin
    dir <= '1';
    data_in <= '1';
    wait for 10 ns;
    data_in <= '0';
    wait for 10 ns;
    data_in <= '1';
    wait for 10 ns;
    
        dir <= '0';
        data_in <= '1';
        wait for 10 ns;
        data_in <= '0';
        wait for 10 ns;
        data_in <= '1';
        wait for 10 ns;
    wait;
    end process;

end Behavioral;
