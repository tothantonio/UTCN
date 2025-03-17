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

--component REGFILE is
--Port ( clk : in std_logic;
--         ra1 : in std_logic_vector(4 downto 0);
--         ra2 : in std_logic_vector(4 downto 0);
--         wa  : in std_logic_vector(4 downto 0);
--         wd  : in std_logic_vector(31 downto 0);
--         regwr : in std_logic;
--         rd1 : out std_logic_vector(31 downto 0);
--         rd2 : out std_logic_vector(31 downto 0)
--         );
--end component;

component RAM is
Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           we : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (5 downto 0);
           di : in STD_LOGIC_VECTOR (31 downto 0);
           do : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal cnt: std_logic_vector(5 downto 0) := (others => '0');
signal en: std_logic := '0';
signal digits: std_logic_vector(31 downto 0) := (others => '0');
--signal regwr : std_logic := '0';
signal rst : std_logic := '0';
signal we : std_logic := '0';
type memory is array(0 to 31) of std_logic_vector(31 downto 0);
signal rom : memory := (others => "0");

--signal rd1 : std_logic_vector(31 downto 0) := (others => '0');
--signal rd2 : std_logic_vector(31 downto 0) := (others => '0');

--signal a: std_logic_vector(31 downto 0) := (others => '0');
--signal b: std_logic_vector(31 downto 0) := (others => '0');
--signal res: std_logic_vector(31 downto 0) := (others => '0');


begin

conectareMPG1: MPG port map(clk, btn(0), en);
conectareMPG2: MPG port map(clk, btn(1), we);
conectareMPG3: MPG port map(clk, btn(2), rst);

--led(7 downto 0) <= sw(7 downto 0);

--counterTask1:
--process(clk)
--begin
--    if rising_edge(clk) then
--        if en = '1' then
--            if sw(0) = '0' then
--                cnt <= cnt + 1;
--            else cnt <= cnt - 1;
--            end if;
--        end if;
--    end if;
--end process;

--counterTask2:
--process(clk)
--begin
--    if rising_edge(clk) then
--        if en = '1' then
--            cnt <= cnt + 1;
--        end if;
--    end if; 
--end process;

--mux4x1:
--process(cnt)
--begin
 --   case cnt is
 --           when "00" => a <= x"0000000" & sw(3 downto 0);
 --                        b <= x"0000000" & sw(7 downto 4);
 --                        res <= a + b;
 --           when "01" => a <= x"0000000" & sw(3 downto 0);
 --                        b <= x"0000000" & sw(7 downto 4);
 --                        res <= a - b;
 --           when "10" => res <= x"00000" & "00" & sw(7 downto 0) & "00";
 --           when "11" => res <= x"000000" & "00" & sw(7 downto 2);
 --           when others => res <= x"00000000";
 --       end case;
     
 --    if res = 0 then
 --       led(8) <= '1';
 --    else led(8) <= '0';
 --     end if;
--end process;

--digits <= res;
counter:
process(clk, rst)
begin
    if rst = '1' then
        cnt <= "000000";    
    elsif rising_edge(clk) and en = '1' then
            cnt <= cnt + 1;
    end if;
end process;

--digits <= ROM(conv_integer (cnt));
--digits <= rd1 + rd2;

--conectareREGFILE: REGFILE port map (clk, cnt, cnt, cnt, digits, regwr, rd1, rd2);
conectareRAM : RAM port map(clk, '1', we, cnt, digits, digits);
digits <= digits(29 downto 0) & "00";
conectareSSD:SSD port map(digits, clk, cat, an);

end Behavioral;
