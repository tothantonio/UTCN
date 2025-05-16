library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UC is
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
end UC;

architecture Behavioral of UC is

begin

process(Instr)
begin

RegDst <= '0';
ExtOp <= '0';
ALUSrc <= '0';
Branch <= '0';
Br_ne <= '0';
Jump <= '0';
ALUOp <= "000";
MemWrite <= '0';
MemtoReg <= '0';
RegWrite <= '0';

case Instr is
   when "000000" => --Tip R
   RegDst <= '1'; 
   RegWrite <= '1'; 
   ALUOp <= "000";
    
   when "001000" => --ADDI
   ExtOp <= '1';
   ALUSrc <= '1'; 
   RegWrite <= '1'; 
   ALUOp <= "001";
   
   when "001101" => --ORI
   ExtOp <= '1';
   ALUSrc <= '1';
   RegWrite <= '1';  
   ALUOp <= "011";
   
   when "100011" => --LW
   ExtOp <= '1';
   ALUSrc <= '1'; 
   MemtoReg <= '1'; 
   RegWrite <= '1'; 
   ALUOp <= "001";
   
   when "101011" => --SW
   ExtOp <= '1';
   ALUSrc <= '1'; 
   MemWrite <= '1'; 
   ALUOp <= "001";        
    
   when "000100" => --BEQ
   ExtOp <= '1'; 
   Branch <= '1'; 
   ALUOp <= "010";    
   
   when "000101" => --BNE
   ExtOp <= '1'; 
   Br_ne <= '1';  
   ALUOp <= "010";                   
   
   when "000010" => --JUMP
   Jump <= '1';
   
   when others => 
   RegDst <= '0'; 
   ExtOp <= '0'; 
   ALUSrc <= '0'; 
   Branch <= '0'; 
   Br_ne <= '0'; 
   Jump <= '0'; 
   ALUOp <= "000"; 
   MemWrite <= '0'; 
   MemtoReg <= '0'; 
   RegWrite <= '0';
   
end case;
end process;

end Behavioral;