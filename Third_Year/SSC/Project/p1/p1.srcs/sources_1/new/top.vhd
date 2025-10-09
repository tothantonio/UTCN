----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2025 04:01:51 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_succesiv is
generic (n:natural:=4);
  Port (
  x, y:in std_logic_vector(n - 1 downto 0);
  t_in:in std_logic;
  s:out std_logic_vector(n - 1 downto 0);
  t_out:out std_logic
  );
end add_succesiv;

architecture Behavioral of add_succesiv is

type tip_culoare is (rosu, galben, albastru);
signal cul, cul_urm: tip_culoare;
signal T: std_logic_vector(n downto 0);

begin

-- #1
--l1:process(a,b)
--begin
--    if a = b then
--        res <= '0';
--    elsif a < b then
--        res <= '1';
--    else 
--        res <= 'x';
--    end if;
--end process;

--#2
--process(cul)
--begin
--    case cul is:
--        when rosu =>
--            cul_urm <= galben;
--        when galben =>
--            cul_urm <= albastru;
--        when albastru =>
--            cul_urm <= rosu;
--        when others => nu e obligatoriu pt ca cul poate lua doar tip_culoare
--    end case;
--end process;

--#3
--process()
--variable cnt:integer:=0;
--begin
--    wait until clk = '1';
--        while nivel = '1' loop
--            cnt := cnt + 1;
--        wait until clk = '0';
--        end loop;
--end process;

--#4
--for i in 1 to 10 loop
--    pp(i) <= i * i;
--end loop;

--for i in integer range 1 to 10 loop

--#5
--l4:loop
--    a:=a+1;
--    exit l4 when a > 31;
--  end loop l4;

--#6
--p <= a and b;
--with s select
--    output_mux <=   a when "00",
--                    b when "01",
--                    c when "10",
--                    d when "11",
--                    p when others;

--#7 add_succesiv
T(0) <= t_in;
gen: for i in 0 to n - 1 generate
        s(i) <= x(i) xor y(i) xor T(i);
        T(i+1) <= (x(i) and y(i)) or (x(i) and T(i)) or (y(i) and T(i));
end generate;
t_out <= T(n);

add:entity WORK.add_succesiv
generic map(n => 8)
port map(x => x, y => y, t_in => t_in, s => s, t_out => t_out);

end Behavioral;
