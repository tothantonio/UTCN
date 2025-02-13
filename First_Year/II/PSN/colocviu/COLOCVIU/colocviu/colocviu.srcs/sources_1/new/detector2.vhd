library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity detector2 is
Port (clk, r : in std_logic;
      serial_in : in std_logic;
      detected  : out std_logic);
end detector2;

architecture Behavioral of detector2 is
type state is (s0, s1, s2, s3, s4);
signal curr_state, next_state: state;
begin
process(clk, r)
begin
    if r  = '1' then curr_state <= s0;
    elsif rising_edge(clk) then
        curr_state <= next_state;
    end if;
end process;

process(curr_state, serial_in)
begin
    case curr_state is
    when s0 =>
    if serial_in = '1' then --1
        next_state <= s1;
    else next_state <= s0;
    end if;
    when s1 =>
    if serial_in = '1' then --11
        next_state <= s2;
    else next_state <= s1;
    end if;
    when s2 => 
    if serial_in = '0' then --110
        next_state <= s3;
    else next_state <= s2;
    end if;
    when s3 =>
    if serial_in = '0' then --1100
        next_state <= s4;
    else next_state <= s3;
    end if;
    when s4 => 
    if serial_in = '1' then
        next_state <= s1;
    else next_state <= s2;
    end if;
    end case;
end process;

process(curr_state)
begin
    case curr_state is
    when s0 =>
    detected <= '0';
    when s1 =>
    detected <= '0';
    when s2 =>
    detected <= '0';
    when s3 =>
    detected <= '0';
    when s4 =>
    detected <= '1';
    end case;
end process;
end Behavioral;
