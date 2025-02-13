library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_num_bin_8bit is
end tb_num_bin_8bit;

architecture Behavioral of tb_num_bin_8bit is
    component num_bin_8bit
        Port (
            clk      : in std_logic;
            btn      : in std_logic;
            r        : in std_logic;
            load     : in std_logic;
            data_in  : in std_logic_vector(7 downto 0);
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;

    signal clk_tb      : std_logic := '0';
    signal btn_tb      : std_logic := '0';
    signal r_tb        : std_logic := '0';
    signal load_tb     : std_logic := '0';
    signal data_in_tb  : std_logic_vector(7 downto 0) := (others => '0');
    signal data_out_tb : std_logic_vector(7 downto 0);

begin
    e1 : num_bin_8bit
        port map (
            clk      => clk_tb,
            btn      => btn_tb,
            r        => r_tb,
            load     => load_tb,
            data_in  => data_in_tb,
            data_out => data_out_tb
        );

    clk_process : process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for 5 ns;
            clk_tb <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    process
    begin
        r_tb <= '1';
        wait for 20 ns;
        r_tb <= '0';
        wait for 20 ns;

        data_in_tb <= "10101010";
        load_tb <= '1';
        wait for 20 ns;
        load_tb <= '0';
        wait for 40 ns;

        btn_tb <= '1';
        wait for 20 ns;
        btn_tb <= '0';
        wait for 40 ns;

        wait;
    end process;

end Behavioral;
