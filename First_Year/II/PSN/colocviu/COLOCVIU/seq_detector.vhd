library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity seq_detector is
  Port (clk : in std_logic;
        input : in std_logic;
        detected : out std_logic );
end seq_detector;

architecture Behavioral of seq_detector is
signal secventa : std_logic_vector (3 downto 0) := "0000";
begin

process(clk)
begin
    if rising_edge(clk) then
        secventa <= input & secventa (3 downto 1);
        if secventa = "1010" then
            detected <= '1';
        else
            detected <= '0';
        end if;
    end if;
    
end process;
end Behavioral;
