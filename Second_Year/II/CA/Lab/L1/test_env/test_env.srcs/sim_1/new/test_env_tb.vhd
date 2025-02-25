library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity test_env_tb is
end test_env_tb;

architecture Behavioral of test_env_tb is

    signal clk : std_logic := '0';
    signal btn : std_logic_vector(4 downto 0) := (others => '0');
    signal sw : std_logic_vector(15 downto 0) := (others => '0');
    signal an : std_logic_vector(7 downto 0);
    signal led : std_logic_vector(15 downto 0);
    signal cat : std_logic_vector(6 downto 0);
    
    constant CLK_PERIOD : time := 10 ns;
    
begin

    -- Instantiate the Unit Under Test (UUT)
    uut: entity work.test_env port map (
        clk => clk,
        btn => btn,
        sw => sw,
        an => an,
        led => led,
        cat => cat
    );

    -- Clock process definition
    clk_process : process
    begin
        while now < 1 us loop  -- Run for a sufficient duration
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    -- Stimulus process
    stim_process : process
    begin
        wait for 20 ns;
        
        -- Enable counting, increment mode
        btn(0) <= '1';
        sw(0) <= '0';
        wait for 100 ns;
        
        -- Change button inputs
        btn(1) <= '1';
        wait for 50 ns;
        btn(1) <= '0';
        btn(2) <= '1';
        wait for 50 ns;
        
        -- Switch to decrement mode
        sw(0) <= '1';
        sw(1) <= '1';
        wait for 100 ns;
        
        -- Stop counting
        btn(0) <= '0';
        btn(2) <= '0';
        wait for 50 ns;
        
        -- Enable counting again, increment mode
        btn(0) <= '1';
        sw(0) <= '0';
        sw(2) <= '1';
        wait for 100 ns;
        
        -- Finish simulation
        wait;
    end process;
    
end Behavioral;