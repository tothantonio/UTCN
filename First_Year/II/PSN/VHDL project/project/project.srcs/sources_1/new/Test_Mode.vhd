library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Componenta pentru modul test
entity Test_Mode is
    Port ( clk : in STD_LOGIC;
           led_output : out STD_LOGIC_VECTOR (7 downto 0));
end Test_Mode;

architecture Behavioral of Test_Mode is
    constant clk_freq : natural := 100000000; --100 mhz
    type pwm_counter_type is array (0 to 7) of natural range 0 to clk_freq * 8;
    signal pwm_counters : pwm_counter_type := (others => 0);
    constant pwm_periods : pwm_counter_type := (clk_freq * 1, --definesc perioada pt fiecare led
                                                clk_freq * 2, 
                                                clk_freq * 3,
                                                clk_freq * 4, 
                                                clk_freq * 5, 
                                                clk_freq * 6, 
                                                clk_freq * 7, 
                                                clk_freq * 8); 
                                                
begin
    pwm_test_process: process(clk)
    begin
        if rising_edge(clk) then
            for i in 0 to 7 loop
                pwm_counters(i) <= pwm_counters(i) + 1;
                if pwm_counters(i) < pwm_periods(i) / 2 then
                    led_output(i) <= '1'; --led aprins
                else
                    led_output(i) <= '0'; --led stins
                end if;
                if pwm_counters(i) >= pwm_periods(i) then
                    pwm_counters(i) <= 0;
                end if; 
            end loop;
        end if;
    end process;
end Behavioral;
