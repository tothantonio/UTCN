library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RAM is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           we : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (5 downto 0);
           di : in STD_LOGIC_VECTOR (31 downto 0);
           do : out STD_LOGIC_VECTOR (31 downto 0));
end RAM;

architecture Behavioral of RAM is

type ram_type is array (0 to 31) of std_logic_vector(31 downto 0);
signal RAM: ram_type := (
    X"00000001",
    X"00000002",
    X"00000003",
    X"00000004",
    X"00000005",
    others => X"00000000"); 

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then 
                if we = '1' then
                    RAM(conv_integer(address)) <= di;
                    do <= di;
                else
                    do <= RAM(conv_integer(address));
                end if;
            end if;
        end if;
    end process;

end Behavioral;
