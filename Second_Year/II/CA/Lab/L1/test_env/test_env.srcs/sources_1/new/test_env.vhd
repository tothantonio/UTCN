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
           PC_4 : out STD_LOGIC_VECTOR (31 downto 0));
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
           RegDst : out STD_LOGIC;
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

component EX is
    Port ( rd1 : in STD_LOGIC_VECTOR (31 downto 0);
           aluSrc : in STD_LOGIC;
           rd2 : in STD_LOGIC_VECTOR (31 downto 0);
           ext_imm : in STD_LOGIC_VECTOR (31 downto 0);
           sa : in STD_LOGIC_VECTOR (4 downto 0);
           func : in STD_LOGIC_VECTOR (5 downto 0);
           aluOp : in STD_LOGIC_VECTOR (2 downto 0);
           PC_4 : in STD_LOGIC_VECTOR (31 downto 0);
           RegDst: in STD_LOGIC;
           Zero : out STD_LOGIC;
           aluRes : out STD_LOGIC_VECTOR (31 downto 0);
           BranchAddress : out STD_LOGIC_VECTOR (31 downto 0)
           );
end component;

component mem is
    Port ( memWrite : in STD_LOGIC;
           aluResIn : in STD_LOGIC_VECTOR (31 downto 0);
           rd2 : in STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           en : in STD_LOGIC;
           memData : out STD_LOGIC_VECTOR (31 downto 0);
           aluResOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal enable: STD_LOGIC := '0';
signal digits: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

--IFetch
signal reset, PCSrc : STD_LOGIC :='0';
signal PC_4 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal Instruction : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal JumpAddress, BranchAddress : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

--IDecode
signal wd, rd1, rd2, ext_imm, ext_func, ext_sa : STD_LOGIC_VECTOR(31 downto 0);
signal func : STD_LOGIC_VECTOR(5 downto 0);
signal sa : STD_LOGIC_VECTOR(4 downto 0);

--Main Controls
signal RegDst, ExtOp, ALUSrc, Branch, Jump, MemWrite, MemToReg, RegWrite, Br_ne: STD_LOGIC;
signal ALUOp: STD_LOGIC_VECTOR(2 downto 0);

--Execute
signal ALURes: STD_LOGIC_VECTOR(31 downto 0);
signal Zero : STD_LOGIC;

--Memory
signal MemData : STD_LOGIC_VECTOR(31 downto 0);
signal ALUResOut: STD_LOGIC_VECTOR(31 downto 0);

begin

connectMPG1: MPG port map(clk, btn(0), enable);
connectMPG2: MPG port map(clk, btn(1), reset);

connectIFetch: IFetch port map(clk, Jump, JumpAddress, PCSrc, BranchAddress, enable, reset, Instruction, PC_4);
connectIDecode: ID port map(clk, RegWrite, Instruction(25 downto 0), RegDst, enable, ExtOp, rd1, rd2, wd, ext_imm, func, sa);
connectMainControl : UC port map(Instruction(31 downto 26), RegDst, ExtOp, ALUSrc, Branch, Jump, ALUOp, MemWrite, MemToReg, RegWrite, Br_ne);
connectExecute: EX port map(rd1, aluSrc, rd2, ext_imm, sa, func, ALUOp, PC_4, RegDst, Zero, ALURes, BranchAddress);
connectMemory: mem port map(MemWrite, ALURes, rd2, clk, enable, MemData, ALUResOut);

JumpAddress <= PC_4(31 downto 28) & Instruction(25 downto 0) & "00";
PCSrc <= (Branch and Zero) or (not(Zero) and Br_ne);
wd <= aluResOut when MemtoReg = '0' else memData;

process(sw(7 downto 5), Instruction, PC_4, rd1, rd2, ext_imm, aluRes, memData, wd)
begin
  case sw(7 downto 5) is 
    when "000" =>
      digits <= Instruction;
    when "001" =>
      digits <= PC_4;
    when "010" =>
      digits <= rd1;
    when "011" =>
      digits <= rd2;
    when "100" =>
      digits <= ext_imm;
    when "101" =>
       digits <= aluRes;
    when "110" =>
       digits <= memData;
     when "111" =>        
       digits <= wd;
    when others =>
      digits <= (others => '0');
  end case;
end process;
              
displaySSD: SSD port map(digits, clk, cat, an);

led(0) <= RegWrite;
led(1) <= MemtoReg;
led(2) <= MemWrite;
led(3) <= Jump;
led(4) <= Branch;
led(5) <= ALUSrc;
led(6) <= ExtOp;
led(7) <= RegDst;
led(8) <= ALUOp(0);
led(9) <= ALUOp(1);
led(10) <= ALUOp(2);

led(11) <= Br_ne;

end Behavioral;
