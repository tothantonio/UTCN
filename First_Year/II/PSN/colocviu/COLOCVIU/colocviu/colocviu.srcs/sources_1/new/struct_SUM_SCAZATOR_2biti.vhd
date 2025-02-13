library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity struct_SUM_SCAZATOR_1bit is
    Port (a, b : in std_logic;
          cin, bin : in std_logic;
          add_sub : in std_logic;
          sum, cout, diff, bout : out std_logic);
end struct_SUM_SCAZATOR_1bit;

architecture Behavioral of struct_SUM_SCAZATOR_1bit is
    component xor2 is
        port(a, b: in std_logic;
             x: out std_logic);
    end component;
    
    component and2 is
        port(a, b: in std_logic;
             x: out std_logic);
    end component;
    
    component or2 is 
        port(a, b: in std_logic;
             x: out std_logic);
    end component;
    
    component not_gate is
        port(a : in std_logic;
             x: out std_logic);
    end component;
    
    component or3 is
        port(a, b, c: in std_logic;
             x: out std_logic);
    end component;
    
    signal s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12: std_logic;
begin
    xor_ab: xor2 port map(a, b, s1); -- a + b
    xor_sum_cin: xor2 port map(s1, cin, s2); -- a + b cu carry
    and_ab: and2 port map(a, b, s3); -- a and b
    and_cin_xor_ab : and2 port map(cin, s1, s4);
    or_and_ab_cin_xor_ab : or2 port map(s3, s4, s5);
    a_xor_b_xor_cin : xor2 port map(s1, cin, s6);
    a_xor_b_xor_bin : xor2 port map(s1, bin, s7);
    a_not : not_gate port map(a, s8);
    e1: and2 port map(s8, bin, s9);
    e2: and2 port map(s8, b, s10);
    e3: and2 port map(b, bin, s11);
    e4: or3 port map(s9, s10, s11, s12);
    
process(a, b, add_sub)
begin
    if add_sub = '0' then -- adunare
        sum <= s6;
        cout <= s5;
        diff <= '0';
        bout <= '0';
    else             -- scadere
        sum <= '0';
        cout <= '0';
        diff <= s7;
        bout <= s12;
    end if;
end process;
end Behavioral;
