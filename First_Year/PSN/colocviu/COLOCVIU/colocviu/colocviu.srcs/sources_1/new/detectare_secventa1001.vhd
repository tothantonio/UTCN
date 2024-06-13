library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectare_secventa1001 is
    port(serial_in : in std_logic;
         r, clk :  in std_logic;
         detected : out std_logic);
end detectare_secventa1001;

architecture Behavioral of detectare_secventa1001 is
type state is (z, o, oz, ozz, ozzo);
signal curr_state, next_state : state;
begin
    
    process(clk, r)
        begin
            if r = '1' then
                curr_state <= z;
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
                    next_state <= o;
                else
                    next_state <= oz;
                end if;
           when oz => 
                if serial_in = '1' then
                    next_state <= o;
                else
                    next_state <= ozz;
                end if;
          when ozz => 
                if serial_in = '1' then
                    next_state <= ozzo;
                else
                    next_state <= oz;
                end if;
          when ozzo => 
                if serial_in = '1' then
                    next_state <= o;
                else 
                    next_state <= oz;
                end if;
          end case;
    end process;

    process(curr_state)
        begin
            case curr_state is
            when z => detected <= '0';
            when o => detected <= '0';
            when oz => detected <= '0';
            when ozz => detected <= '0';
            when ozzo => detected <= '1';
            end case;
    end process;
end Behavioral;
