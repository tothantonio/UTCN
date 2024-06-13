library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_dcd_bin is
end tb_dcd_bin;

architecture Behavioral of tb_dcd_bin is

    component dcd_bin_4bit is
     Port (input: in std_logic_vector(3 downto 0);
            en :  in std_logic;
            output: out std_logic_vector(15 downto 0));
    end component;
    
    signal input : std_logic_vector(3 downto 0) := "0000";
    signal en    : std_logic := '1';
    
    signal output : std_logic_vector(15 downto 0);
begin
    e1 : dcd_bin_4bit port map(input => input, en => en, output => output);
    
    process
    begin
    input <= "0001";
    wait for 10 ns;
    input <= "0010";
    wait for 10 ns;
    input <= "0011";
    wait for 10 ns;
    input <= "0100";
    wait for 10 ns;
    input <= "0101";
    wait for 10 ns;
    input <= "0110";
    wait for 10 ns;
    input <= "0111";
    wait for 10 ns;
    input <= "1000";
    wait for 10 ns;
    input <= "1001";
    wait for 10 ns;
    input <= "1010";
    wait for 10 ns;
    input <= "1011";
    wait for 10 ns;
    input <= "1100";
    wait for 10 ns;
    input <= "1101";
    wait for 10 ns;
    input <= "1110";
    wait for 10 ns;
    input <= "1111";
    wait for 10 ns;
    wait;
    end process;    
end Behavioral;
