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

signal func: std_logic_vector (5 downto 0);
signal sa: std_logic_vector (4 downto 0);
signal en, rst: std_logic := '0';
signal output, Instruction, PC, rd1, rd2, wd, ext_imm, branchAdress, aluRes, aluResOut, memData, JumpAddress : std_logic_vector(31 downto 0);
signal RegDst, ExtOp, ALUSrc, Branch, Jump, MemWrite, MemtoReg, RegWrite, zero, PCSrc, Br_ne: std_logic;
signal ALUOp: std_logic_vector(2 downto 0);

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
           pc : in STD_LOGIC_VECTOR (31 downto 0);
           zero : out STD_LOGIC;
           aluRes : out STD_LOGIC_VECTOR (31 downto 0);
           branchAdress : out STD_LOGIC_VECTOR (31 downto 0));
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

begin

connectMPG1: MPG port map(clk, btn(0), en);
connectMPG2: MPG port map(clk, btn(1), rst);
connectIFetch: IFetch port map(clk, Jump, JumpAddress, PCSrc, BranchAdress, en, rst, Instruction, PC);
connectSSD: SSD port map(output, clk, cat, an);
connectUC: UC port map(Instruction(31 downto 26), RegDst, ExtOp, ALUSrc, Branch, Jump, ALUOp, MemWrite, MemtoReg, RegWrite, Br_ne);
connectID: ID port map(clk, RegWrite, Instruction(25 downto 0), RegDst, en, ExtOp, rd1, rd2, wd, ext_imm, func, sa);
connectEX: EX port map(rd1, aluSrc, rd2, ext_imm, sa, func, aluOp, pc, zero , aluRes, branchAdress);
connectMEM: mem port map(MemWrite, aluRes, rd2, clk, en, memData, aluResOut);

JumpAddress <= (Instruction(25 downto 0) & "00") & PC(31 downto 28);
PCSrc <= (Branch and zero) or (not(zero) and Br_ne);

wd <= aluResOut when MemtoReg = '0' else memData;

process(sw(7 downto 5), Instruction, PC, rd1, rd2, ext_imm, aluRes, memData, wd)
begin
  case sw(7 downto 5) is 
    when "000" =>
      output <= Instruction;
    when "001" =>
      output <= PC;
    when "010" =>
      output <= rd1;
    when "011" =>
      output <= rd2;
    when "100" =>
      output <= ext_imm;
    when "101" =>
       output <= aluRes;
    when "110" =>
       output <= memData;
     when "111" =>        
       output <= wd;
    when others =>
      output <= (others => '0');
  end case;
end process;

led(11) <= Br_ne;
led(10) <= ALUOp(2);
led(9) <= ALUOp(1);
led(8) <= ALUOp(0);
led(7) <= RegDst;
led(6) <= ExtOp;
led(5) <= ALUSrc;
led(4) <= Branch;
led(3) <= Jump;
led(2) <= MemWrite;
led(1) <= MemtoReg;
led(0) <= RegWrite;

end Behavioral;
