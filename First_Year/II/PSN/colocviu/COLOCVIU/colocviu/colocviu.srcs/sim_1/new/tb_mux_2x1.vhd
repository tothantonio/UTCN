library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux_2x1 is
end tb_mux_2x1;

architecture Behavioral of tb_mux_2x1 is
    component conc_MUX_2_1 is
    Port (sel : in std_logic;
          data1: in std_logic_vector(3 downto 0);
          data2: in std_logic_vector(3 downto 0);
          output: out std_logic_vector(3 downto 0));
    end component;
    
    signal sel : std_logic := '0';
    signal data1 : std_logic_vector(3 downto 0) := "0000";
    signal data2 : std_logic_vector(3 downto 0) := "0000";

    signal output : std_logic_vector(3 downto 0);
begin
    e1 : conc_MUX_2_1 port map(sel => sel, data1 => data1, data2 => data2, output => output);
    
    process
    begin
    wait for 10 ns;
    data1 <= "0001";
    wait for 10 ns;
    data2 <= "0010";
    wait for 10 ns;
    sel <= '1';
    wait for 10 ns;
    sel <= '0';
    wait for 10 ns;
    wait;
    end process;
end Behavioral;
