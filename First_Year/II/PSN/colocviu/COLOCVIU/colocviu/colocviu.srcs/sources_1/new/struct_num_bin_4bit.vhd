library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity struct_num_bin_4bit is
    port(r, clk: in std_logic;
         btn   : in std_logic;
         Q     : out std_logic_vector(3 downto 0));
end struct_num_bin_4bit;

architecture Behavioral of struct_num_bin_4bit is
    
    component num_bin_2bit is
        port(r, clk : in std_logic;
             btn    : in std_logic;
             Q      : out std_logic_vector(1 downto 0));
    end component;
    
    signal q1, q2 : std_logic_vector(1 downto 0);
    
begin
    e1 : num_bin_2bit port map(clk => clk, r => r, btn => btn, Q => q1);
    e2 : num_bin_2bit port map(clk => clk, r => r, btn => btn, Q => q2);

    Q <= q1 & q2;
end Behavioral;
