library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IFetch is
    Port ( clk : in STD_LOGIC;
           Jump : in STD_LOGIC;
           JumpAddress : in STD_LOGIC_VECTOR (31 downto 0);
           PCSrc : in STD_LOGIC;
           BranchAddress : in STD_LOGIC_VECTOR (31 downto 0);
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           Instruction : out STD_LOGIC_VECTOR (31 downto 0);
           PC_4 : out STD_LOGIC_VECTOR (31 downto 0));
end IFetch;

architecture Behavioral of IFetch is

signal PC, mux1, mux2, addr: std_logic_vector(31 downto 0);

type rom_type is array (0 to 31) of std_logic_vector(31 downto 0);
signal rom : rom_type := (
    b"100011_00000_00001_0000000000000000", -- X"8C01 0000"  lw $1, 0($0)
    b"100011_00000_00010_0000000000000100", -- X"8C02 0004"  lw $2, 4($0)
    b"001000_00000_00011_0000000000000001", -- X"2003 0001"  addi $3, $0, 1
    b"100011_00001_00100_0000000000000000", -- X"8C24 0000"  lw $4, 0($1)
    b"100011_00001_00101_0000000000000100", -- X"8C25 0004"  lw $5, 4($1)
    b"000000_00100_00101_00110_00000_101010", -- X"0085 302A"  slt $6, $4, $5
    b"000100_00110_00000_0000000000000111", -- X"10C0 0007"  beq $6, $0, 7 (not_sorted)
    b"001000_00001_00001_0000000000000100", -- X"2021 0004"  addi $1, $1, 4
    b"001000_00011_00011_0000000000000001", -- X"2063 0001"  addi $3, $3, 1
    b"000101_00011_00010_1111111111111001", -- X"1462 FFF9"  bne $3, $2, -7 (loop)
    b"001101_00000_01000_0000000000000001", -- X"3408 0001"  ori $8, $0, 1
    b"101011_00000_01000_0000000000001000", -- X"AC08 0008"  sw $8, 8($0)
    b"100011_00000_01001_0000000000001000", -- X"8C09 0008"  lw $9, 8($0)
    b"000010_00000000000000000000010111", -- X"0800 0017"  j 17
    b"001101_00000_01000_0000000000000000", -- X"3408 0000"  ori $8, $0, 0
    b"101011_00000_01000_0000000000001000", -- X"AC08 0008"  sw $8, 8($0)
    b"100011_00000_01001_0000000000001000", -- X"8C09 0008"  lw $9, 8($0)
    others => X"00000000");

begin

process(clk)
begin
    if rst = '1' then
        addr <= (others => '0');
    elsif rising_edge(clk) then
        if en = '1' then
            addr <= mux2;
        end if;
    end if;
end process;

PC <= addr + 4;

mux1 <= PC when PCSrc = '0' else BranchAddress;
mux2 <= mux1 when Jump = '0' else JumpAddress;

PC_4 <= PC;

process(clk)
begin
    if rising_edge(clk) then
        Instruction <= rom(conv_integer(addr(6 downto 2)));
    end if;
end process;

end Behavioral;
