library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_tb is
end top_tb;

architecture sim of top_tb is

    signal clk_tb : std_logic := '0';
    signal btn_tb : std_logic_vector(3 downto 0) := (others => '0');
    signal sw_tb  : std_logic_vector(3 downto 0) := (others => '0');
    signal led_tb : std_logic_vector(3 downto 0);

    constant CLK_PERIOD : time := 8 ns;
    
    signal force_error : std_logic := '0';

begin
    DUT: entity work.top
        port map(
            clk => clk_tb,
            btn => btn_tb,
            sw  => sw_tb,
            led => led_tb
        );
        
    clk_proc: process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD/2;
            clk_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    stim_proc: process
    begin
        wait for 100 ns;
        btn_tb(1) <= '1';  -- reset activ
        wait for CLK_PERIOD * 3;
        btn_tb(1) <= '0';
        wait for 100 ns;
        
        for pkt in 0 to 4 loop
            -- START transmitere
            btn_tb(0) <= '1';
            wait for CLK_PERIOD;
            btn_tb(0) <= '0';
            wait for CLK_PERIOD * 2;

            for step_idx in 0 to 5 loop
                btn_tb(2) <= '1';
                wait for CLK_PERIOD;
                btn_tb(2) <= '0';
                wait for CLK_PERIOD * 2;
            end loop;

            wait for 50 ns;  
        end loop;

        sw_tb(3) <= '1';  
        wait for CLK_PERIOD * 50;

        sw_tb(3) <= '0';
        sw_tb(2) <= '1';  
        wait for CLK_PERIOD * 50;

        sw_tb(2) <= '0';
        sw_tb(1) <= '1';  
        wait for CLK_PERIOD * 50;

        wait;
    end process;

end sim;