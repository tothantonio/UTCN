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
           PC_4 : in STD_LOGIC_VECTOR (31 downto 0);
           RegDst: in STD_LOGIC;
           Zero : out STD_LOGIC;
           aluRes : out STD_LOGIC_VECTOR (31 downto 0);
           BranchAddress : out STD_LOGIC_VECTOR (31 downto 0)
           );
end EX;

architecture Behavioral of EX is

signal aluCtrl: STD_LOGIC_VECTOR(2 downto 0);
signal B, result: std_logic_vector(31 downto 0);

begin

ALUControl: process(aluOp, func)
begin
    case aluOp is
        when "000" =>
            case func is
            when "000000" => aluCtrl <= "000";--(+)
            when "000001" => aluCtrl <= "001";--(-)
            when "000010" => aluCtrl <= "010";--(|)
            when "000011" => aluCtrl <= "111";--(<)
            when "000100" => aluCtrl <= "011";--(&)
            when others => aluCtrl <= (others=>'X');
            end case;
        when "001" => aluCtrl <= "000";--(+)
        when "010" => aluCtrl <= "001";--(-)
        when "011" => aluCtrl <= "010";--(|)
        when "100" => aluCtrl <= "011";--(&)
        when others => aluCtrl <= (others=>'X');
     end case;
end process;

B <= rd2 when aluSrc = '0' else ext_imm;

process(rd1, B, aluCtrl,sa)
begin
    case aluCtrl is
        when "000" => result <= rd1 + B;
        when "001" => result <= rd1 - B;
        when "010" => result <= rd1 or B;
        when "011" => result <= rd1 and B;
        when "111" => 
            if signed(rd1) < signed(B) then 
                result <= X"00000001"; 
            else 
                result <= X"00000000"; 
            end if;       
         when others => result <= (others=>'X');
    end case;
end process;

aluRes <= result;
Zero <= '1' when result = 0 else '0';
BranchAddress <= PC_4 + (ext_imm(29 downto 0)& "00");

end Behavioral;
