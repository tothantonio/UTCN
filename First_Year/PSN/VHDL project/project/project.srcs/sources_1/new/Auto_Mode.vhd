library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Componenta pentru modul automat
entity Auto_Mode is
    Port ( clk : in STD_LOGIC;
           time_interval : in STD_LOGIC_VECTOR(2 downto 0); 
           led_output : out STD_LOGIC_VECTOR (7 downto 0));

end Auto_Mode;

architecture Behavioral of Auto_Mode is
    constant clk_freq : natural := 100000000; 
    type pwm_counter_array is array (0 to 7) of natural;
    signal pwm_counters : pwm_counter_array := (others => 0);
    signal direction : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

begin
    pwm_auto_process: process(clk)
    variable interval_count : natural;
    begin
        interval_count := clk_freq * to_integer(unsigned(time_interval));
        if rising_edge(clk) then
            for i in 0 to 7 loop
                if pwm_counters(i) = 0 then
                    direction(i) <= '0'; 
                elsif pwm_counters(i) = interval_count then
                    direction(i) <= '1'; 
                end if;

                if direction(i) = '0' then
                    pwm_counters(i) <= pwm_counters(i) + 1;
                else
                    pwm_counters(i) <= pwm_counters(i) - 1;
                end if;

                if pwm_counters(i) < interval_count / 2 then
                    led_output(i) <= '1';
                else
                    led_output(i) <= '0';
                end if;

                if pwm_counters(i) >= interval_count then
                    pwm_counters(i) <= 0;
                end if;
            end loop;
        end if;
    end process;
end Behavioral;
