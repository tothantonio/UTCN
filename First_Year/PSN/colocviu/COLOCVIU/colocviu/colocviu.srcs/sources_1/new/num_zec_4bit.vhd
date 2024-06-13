library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity num_zec_4bit is
    Port (clk, btn, load, r: in std_logic;
          data_in : in std_logic_vector(3 downto 0);
          data_out : out std_logic_vector(3 downto 0));
end num_zec_4bit;

architecture Behavioral of num_zec_4bit is
    
    component debouncer is
        port(btn, clk: in std_logic;
             en      : out std_logic);
    end component;
    
    signal cnt : std_logic_vector(3 downto 0) := (others => '0');
    signal btn_debounced: std_logic;
    
begin
    l1: debouncer port map(btn, clk, btn_debounced);
    
    process(clk)
    begin
        if r = '1' then
            cnt <= "0000";
        elsif r = '0' and load = '1' then
            cnt <= data_in;
        elsif rising_edge(clk) then
            if btn_debounced = '1' then
                if cnt < "1001" then
                    cnt <= cnt + 1;
                else cnt <= "0000";
                end if;
            end if;
        end if;
    end process;
    
    data_out <= cnt;
end Behavioral;
