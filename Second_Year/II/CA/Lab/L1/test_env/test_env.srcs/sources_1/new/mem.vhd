library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mem is
    Port ( memWrite : in STD_LOGIC;
           aluResIn : in STD_LOGIC_VECTOR (31 downto 0);
           rd2 : in STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           en : in STD_LOGIC;
           memData : out STD_LOGIC_VECTOR (31 downto 0);
           aluResOut : out STD_LOGIC_VECTOR (31 downto 0));
end mem;

architecture Behavioral of mem is

type data_memory is array(0 to 63) of std_logic_vector(31 downto 0);
signal memory_data : data_memory := (
X"0000000C", --adresa lui A - adr0
X"00000005", -- adr4
X"00000000", -- adr8

X"00000001", -- 1 -adr12
X"00000002", -- 2
X"00000003", -- 3
X"00000004", -- 4
X"00000005", -- 5
others => X"00000000"
);

begin

process(clk)
begin
    if rising_edge(clk) then
        if en='1' and memWrite='1' then
            memory_data(conv_integer(aluResIn(7 downto 2))) <= rd2;
        end if;
    end if;
end process;

memData <= memory_data(conv_integer(aluResIn(7 downto 2)));
aluResOut <= aluResIn;

end Behavioral;