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
           RegDst: in STD_LOGIC;
           zero : out STD_LOGIC;
           aluRes : out STD_LOGIC_VECTOR (31 downto 0);
           branchAdress : out STD_LOGIC_VECTOR (31 downto 0)
           );
end EX;

architecture Behavioral of EX is

signal aluCtrl: STD_LOGIC_VECTOR(2 downto 0);
signal aluIn2, result: std_logic_vector(31 downto 0);

begin

ALUControl: process(aluOp, func)
begin
    case aluOp is
        when "000" =>
            case func is
            when "100000" => aluCtrl <= "000";--(+)
            when "100101" => aluCtrl <= "001";--(|)
            when "101010" => aluCtrl <= "111";--(<)
            when others => aluCtrl <= (others=>'X');
            end case;
        when "001" => aluCtrl <= "000";--(+)
        when "011" => aluCtrl <= "001";--(|)
        when others => aluCtrl <= (others=>'X');
     end case;
end process;

aluIn2 <= rd2 when aluSrc = '0' else ext_imm;

process(rd1, aluIn2, aluCtrl,sa)
begin
    case aluCtrl is
        when "000" => result <= rd1 + aluIn2;
        when "001" => result <= rd1 or aluIn2;
        when "111" => 
            if signed(rd1) < signed(aluIn2) then 
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

end Behavioral;