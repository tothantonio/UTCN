library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_env is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end test_env;

architecture Behavioral of test_env is

component MPG is
    port(clk : in std_logic;
         btn : in std_logic;
         enable : out std_logic);
end component;

component SSD is
Port ( digit : in std_logic_vector(31 downto 0);
         clk   : in std_logic;
         cat   : out std_logic_vector(6 downto 0);
         an    : out std_logic_vector(7 downto 0));
end component;

component IFetch is
Port ( clk : in STD_LOGIC;
           Jump : in STD_LOGIC;
           JumpAddress : in STD_LOGIC_VECTOR (31 downto 0);
           PCSrc : in STD_LOGIC;
           BranchAddress : in STD_LOGIC_VECTOR (31 downto 0);
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           Instruction : out STD_LOGIC_VECTOR (31 downto 0);
           PC : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component ID is
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
end component;

component UC is
    Port ( Instr : in STD_LOGIC_VECTOR (5 downto 0);
           RedDst : out STD_LOGIC;
           ExtOp : out STD_LOGIC;
           ALUSrc : out STD_LOGIC;
           Branch : out STD_LOGIC;
           Jump : out STD_LOGIC;
           ALUOp : out STD_LOGIC_VECTOR(2 downto 0);
           MemWrite : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           RegWrite : out STD_LOGIC;
           Br_ne : out STD_LOGIC
           );
end component;

signal enable: std_logic := '0';
signal digits: std_logic_vector (31 downto 0) := (others => '0');

--IFetch
signal reset : STD_LOGIC :='0';
signal PC_4 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal Instruction : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin

connectMPG1: MPG port map(clk, btn(0), enable);
connectMPG2: MPG port map(clk, btn(1), reset);

connectIFetch: IFetch port map(clk, sw(0), X"00000000", sw(1), X"00000010", enable, reset, Instruction, PC_4);

with sw(7) select
    digits <= PC_4 when '1',
              Instruction when '0',
              (others => 'X') when others;
              
displaySSD: SSD port map(digits, clk, cat, an);

end Behavioral;
