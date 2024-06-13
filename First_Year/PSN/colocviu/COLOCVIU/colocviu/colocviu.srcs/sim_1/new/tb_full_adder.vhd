library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder is
end tb_full_adder;

architecture Behavioral of tb_full_adder is
    component full_adder is
     port(a, b: in std_logic;
            cin : in std_logic;
            cout, sum : out std_logic);
    end component;
    
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal cin : std_logic := '0';
    
    signal cout : std_logic;
    signal sum : std_logic;
begin

    e1 : full_adder port map(a => a, b => b, cin => cin, sum => sum, cout => cout);
    
    process
    begin
        wait for 100 ns;
        a <= '1';
        b <= '0';
        cin <= '0';
        wait for 10 ns;
        a <= '0';
        b <= '1';
        cin <= '0';
        wait for 10 ns;
        a <= '1';
        b <= '1';
        cin <= '0';
        wait for 10 ns;
        a <= '0';
        b <= '0';
        cin <= '1';
        wait for 10 ns;
        a <= '1';
        b <= '0';
        cin <= '1';
        wait for 10 ns;
        a <= '0';
        b <= '1';
        cin <= '1';
        wait for 10 ns;
        a <= '1';
        b <= '1';
        cin <= '1';
        wait for 10 ns;
    end process;
end Behavioral;
