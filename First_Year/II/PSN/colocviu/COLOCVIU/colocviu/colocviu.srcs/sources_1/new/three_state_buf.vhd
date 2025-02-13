library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity three_state_buf is
    port(data_in : in std_logic;
         en : in std_logic;
         data_out : out std_logic);
end three_state_buf;

architecture Behavioral of three_state_buf is

begin
data_out <= data_in when en = '1' else 'Z';
end Behavioral;
