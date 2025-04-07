library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity EX is
    Port ( rd1 : in STD_LOGIC_VECTOR (31 downto 0);
           aluSrc : in STD_LOGIC;
           rd2 : in STD_LOGIC_VECTOR (31 downto 0);
           ext_imm : in STD_LOGIC_VECTOR (31 downto 0);
           sa : in STD_LOGIC_VECTOR (4 downto 0);
           func : in STD_LOGIC_VECTOR (5 downto 0);
           aluOp : in STD_LOGIC_VECTOR (2 downto 0);
           pc : in STD_LOGIC_VECTOR (31 downto 0);
           rt: in STD_LOGIC_VECTOR(4 downto 0);
           rd: in STD_LOGIC_VECTOR(4 downto 0);
           RegDst: in STD_LOGIC;
           zero : out STD_LOGIC;
           aluRes : out STD_LOGIC_VECTOR (31 downto 0);
           branchAdress : out STD_LOGIC_VECTOR (31 downto 0);
           rWA: out STD_LOGIC_VECTOR(4 downto 0)
           );
end EX;

architecture Behavioral of EX is

signal aluCtrl: STD_LOGIC_VECTOR(2 downto 0);
signal ALUIn2, result: std_logic_vector(31 downto 0);

begin

ALUControl: process(aluOp, func)
begin
    case aluOp is
        when "000" =>
            case func is
            when "000000" => aluCtrl <= "000";--(+)
            when "000001" => aluCtrl <= "001";--(-)
            when "000010" => aluCtrl <= "101";--(<<|)
            when "000011" => aluCtrl <= "110";--(>>|)
            when "100000" => aluCtrl <= "010";--(&)
            when "100001" => aluCtrl <= "011";--(|)
            when "100010" => aluCtrl <= "100";--(^)
            when "010000" => aluCtrl <= "111";--(<)
            when others => aluCtrl <= (others=>'X');
            end case;
        when "001" => aluCtrl <= "000";--(+)
        when "010" => aluCtrl <= "001";--(-)
        when "011" => aluCtrl <= "011";--(|)
        when others => aluCtrl <= (others=>'X');
     end case;
end process;

ALUIn2 <= rd2 when aluSrc = '0' else ext_imm;

process(rd1, ALUIn2, aluCtrl, sa)
begin
    case aluCtrl is
        when "000" => result <= rd1 + ALUIn2;
        when "001" => result <= rd1 - ALUIn2;
        when "010" => result <= rd1 and ALUIn2;
        when "011" => result <= rd1 or ALUIn2;
        when "100" => result <= rd1 xor ALUIn2;
        when "101" => result <= to_stdlogicvector(to_bitvector(ALUIn2) sll conv_integer(sa));
        when "110" => result <= to_stdlogicvector(to_bitvector(ALUIn2) srl conv_integer(sa));
        when "111" => 
            if signed(rd1) < signed(ALUIn2) then 
                result <= X"00000001"; 
            else 
                result <= X"00000000"; 
            end if;       
         when others => result <= (others=>'X');
    end case;
end process;

aluRes <= result;
zero <= '1' when result = 0 else '0';
branchAdress <= (ext_imm(29 downto 0)& "00") + pc;

rWA <= rt when RegDst = '0' else rd;

end Behavioral;