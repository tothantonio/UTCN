library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity num_bin_8bit is
    Port (clk, btn : in std_logic;
          r, load   : in std_logic;
          data_in   : in std_logic_vector(7 downto 0);
          data_out  : out std_logic_vector(7 downto 0));
end num_bin_8bit;

architecture Behavioral of num_bin_8bit is

    signal cnt : std_logic_vector(7 downto 0) := (others => '0');
    signal btn_debounced : std_logic;
    
    component debouncer is 
        port(btn, clk: in std_logic;
             en      : out std_logic);
    end component;
begin
    e1: debouncer port map(btn, clk, btn_debounced);
    process(clk, r, load)
    begin
        if r = '1' then
            cnt <= "00000000";
        elsif load = '1' and r = '0' then
            cnt <= data_in;
        elsif rising_edge(clk) then
            if btn_debounced = '1' then
                cnt <= cnt + 1;
            end if;
        end if;
    end process;
    
    data_out <= cnt;
end Behavioral;
