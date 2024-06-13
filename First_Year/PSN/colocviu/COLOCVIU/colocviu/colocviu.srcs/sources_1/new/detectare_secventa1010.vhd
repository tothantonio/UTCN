library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity detectare_secventa1010 is
    port(serial_in : in std_logic;
         clk, r    : in std_logic;
         detected  : out std_logic);
end detectare_secventa1010;

architecture Behavioral of detectare_secventa1010 is
type state is (o, z, oz, ozo, ozoz);
signal curr_state, next_state : state;
begin
    
    process(clk, r)
    begin
        if r = '1' then
            curr_state <= o;
        elsif rising_edge(clk) then
            curr_state <= next_state;
        end if;
    end process;
    
    process(curr_state, serial_in)
    begin
        case curr_state is
            when z => 
                if serial_in = '1' then
                    next_state <= o;
                else
                    next_state <= z;
                end if;
            when o =>
                if serial_in = '1' then
                    next_state <=  z;
                else
                    next_state <=  oz;
                end if;
            when oz =>
                if serial_in = '1' then
                    next_state <= ozo;
                else 
                    next_state <= oz;
                end if;
            when ozo =>
                if serial_in = '1' then
                    next_state <= ozo;
                else 
                    next_state <= ozoz;
                end if;
            when ozoz => 
                if serial_in = '1' then
                    next_state <= ozo;
                else 
                    next_state <=  z;
                end if;
        end case;
    end process;
    
    process(curr_state)
    begin
        case curr_state is
        when o => detected <= '0';
        when z => detected <= '0';
        when oz => detected <= '0';
        when ozo => detected <= '0';
        when ozoz => detected <= '1';
        end case;
    end process;

end Behavioral;
