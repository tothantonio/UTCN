library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ID is
    Port ( clk: in STD_LOGIC;
           RegWrite : in STD_LOGIC;
           Instr : in STD_LOGIC_VECTOR (25 downto 0);
           RegDst : in STD_LOGIC;
           en : in STD_LOGIC;
           ExtOp : in STD_LOGIC;
           rd1 : out STD_LOGIC_VECTOR (31 downto 0);
           rd2 : out STD_LOGIC_VECTOR (31 downto 0);
           wd : in STD_LOGIC_VECTOR (31 downto 0);
           ext_imm : out STD_LOGIC_VECTOR (31 downto 0);
           func : out STD_LOGIC_VECTOR (5 downto 0);
           sa : out STD_LOGIC_VECTOR (4 downto 0));
end ID;

architecture Behavioral of ID is

signal ra1, ra2, wa: std_logic_vector(4 downto 0);
type reg_array is array(0 to 31) of std_logic_vector(31 downto 0);
signal reg_file : reg_array := (others=>X"00000000");

begin

ra1 <= Instr(25 downto 21);
ra2 <= Instr(20 downto 16);

rd1 <= reg_file(conv_integer(ra1));
rd2 <= reg_file(conv_integer(ra2));

wa <= Instr(20 downto 16) when RegDst = '0' else Instr(15 downto 11);

func <= Instr(5 downto 0);
sa <= Instr(10 downto 6);

ext_Imm(15 downto 0) <= Instr(15 downto 0); --bitii mai putin semnificativi sunt copiati direct
ext_imm(31 downto 16) <= (others => Instr(15)) when ExtOp = '1' else (others => '0'); -- bitii cei mai putini semnificativi se aleg in functie de extOp

process(clk)
    begin
    if rising_edge(clk) then
        if en = '1' and RegWrite = '1'  then
            reg_file(conv_integer(wa)) <= wd;
        end if;
     end if;
end process;

end Behavioral;
