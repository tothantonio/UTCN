library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifo_8x4 is
    port(clk, r, wr, rd : in std_logic;
         data_in : in std_logic_vector(3 downto 0);
         data_out : out std_logic_vector(3 downto 0);
         full, empty : inout std_logic);
end fifo_8x4;

architecture Behavioral of fifo_8x4 is
    
    type memory_arr is array(0 to 7) of std_logic_vector(3 downto 0);
    signal mem : memory_arr := (others => (others => '0'));
    signal read_p : integer range 0 to 7 := 0;
    signal write_p : integer range 0 to 7 := 0;
    signal count : integer range 0 to 8 := 0;
begin
    
    process(clk, r)
    begin
        if r = '1' then
            read_p <= 0;
            write_p <= 0;
            count <= 0;
            data_out <= (others => '0');
        elsif rising_edge(clk) then
            if wr = '1' and full = '0' then
                mem(write_p) <= data_in;
                write_p <= (write_p + 1) mod 8;
                count <= count + 1;
            end if;
            
            if rd = '1' and empty = '0' then
                data_out <= mem(read_p);
                read_p <= (read_p + 1) mod 8;
                count <= count + 1;
            end if;
        end if;
    end process;
    
    full <= '1' when count = 8 else '0';
    empty <= '1' when count = 0 else '0';

end Behavioral;
