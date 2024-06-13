library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity struct_scazator_complet_1bit is
  Port (a, b: in std_logic;
        bin: in std_logic;
        bout: out std_logic;
        diff: out std_logic);
end struct_scazator_complet_1bit;

architecture Behavioral of struct_scazator_complet_1bit is
    component xor2 is 
        port (a, b : in std_logic;
              x: out std_logic);
    end component;

    component and2 is
        port(a, b : in std_logic;
             x: out std_logic);
    end component;
    
    component not_gate is
        port(a: in std_logic;
                 x: out std_logic);
    end component;

    signal s1, s2, s3, s4, s5 : std_logic;
begin
    e1 : xor2 port map(a => a , b =>b , x => s1);
    e2 : xor2 port map(a => s1, b => bin, x => s2);
    e3 : not_gate port map(a => a, x => s3);
    e4 : not_gate port map(a => s1, x => s4);
    e5 : and2 port map(a => s3, b => b , x => s5);
    
process(a, b , bin)
begin
    diff <= s2; -- a xor b xor bin
    bout <= s5 or s4; -- a' and b or (a xor b)' and bin
end process;
end Behavioral;
