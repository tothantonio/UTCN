library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

    entity xor_gate is
    port(x, y: in std_logic;
         q   : out std_logic);
    end xor_gate;
    
    architecture arh1 of xor_gate is
    begin
        q <= x xor y;
    end arh1;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

    entity and_gate is
    port(x, y, z: in std_logic;
             q   : out std_logic);
        end and_gate;
        
        architecture arh2 of and_gate is
        begin
            q <= x and y and z;
        end arh2;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

    entity or_gate is
    port(x, y, z: in std_logic;
             q   : out std_logic);
        end or_gate;
        
        architecture arh3 of or_gate is
        begin
            q <= x or y or z;
        end arh3;
        
library IEEE;
        use IEEE.STD_LOGIC_1164.ALL;
        
            entity not_gate is
            port(x: in std_logic;
                     z   : out std_logic);
                end not_gate;
                
                architecture arh4 of not_gate is
                begin
                    z <= not x;
                end arh4;
                
                
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity struct_comparator is
    Port (d0 : in std_logic_vector(1 downto 0);
          d1 : in std_logic_vector(1 downto 0);
          eq, less, gr : out std_logic);
end struct_comparator;

architecture Behavioral of struct_comparator is 
        component xor_gate is
        port(x, y: in std_logic;
            q: out std_logic);
        end component;
    
        component not_gate is
        port(x: in std_logic;
             z   : out std_logic);
        end component;
       
        component or_gate is
        port(x, y, z: in std_logic;
              q   : out std_logic);
        end component;   
        
        component and_gate is
        port(x, y, z: in std_logic;
             q   : out std_logic);
        end component;                        
 
        signal nd00, nd01, nd10, nd11 : std_logic;  
        signal p1, p2, p3 : std_logic;
        signal t1, t2, t3 : std_logic;
        signal q1, q2, q3 : std_logic;
           
begin
    inv1: not_gate port map(d0(0), nd00);
    inv2: not_gate port map(d0(1), nd01);
    inv3: not_gate port map(d1(0), nd10);
    inv4: not_gate port map(d1(1), nd11);
    
        and_1: and_gate port map ( d1(1),  nd01,  '1', p1);
        and_2: and_gate port map ( d0(0),  nd00,  nd01, p2);
        and_3: and_gate port map ( nd00,  d1(1), d1(0), p3);
        
        or1: or_gate port map (p1, p2, p3, less);
    
    -- mare: 
        and_4: and_gate port map ( d0(1),   nd11,  '1', q1);
        and_5: and_gate port map ( d0(0),   nd10,  nd11, q2);
        and_6: and_gate port map (  nd10,  d0(1), d0(0), q3);
        
        or2: or_gate port map (q1, q2, q3, gr);
    
    -- egal:
        xor_1: xor_gate port map ( d0(1), d1(1), t1);
        xor_2: xor_gate port map ( d0(0), d1(0), t2);
        
        or_3: or_gate port map ( t1, t2, '0', t3);
        
        inv_5: not_gate port map (t3, eq);
        
end Behavioral;
