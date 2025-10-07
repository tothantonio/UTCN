--includerea librariilor necesare rularii proiectului
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--creerea entitatii top si includerea elementelor hardware de pe placa
--aceste elemente trebuie sa fie definite in fisierul de constrangeri XDC cu acelasi nume
entity top is
Port (
    clk : in STD_LOGIC; -- semnalul de ceas provenit de la placa
    
    led : out std_logic_vector(3 downto 0); --cele 4 leduri ale placii
    
    sw : in std_logic_vector(3 downto 0); --cele 4 switchuri ale placii
    
    btn : in std_logic_vector(3 downto 0);--butoanele placii
    
    rx : in STD_LOGIC;--portul de rx necesar comunicarii UART
    
    tx : out STD_LOGIC --portul de tx necesar comunicarii UART
    );
end top;

--arhitectura componentei top
architecture Behavioral of top is

--maparea componentei mono-pulse generator
component MPG is
Port ( en : out STD_LOGIC;
input : in STD_LOGIC;
clock : in STD_LOGIC);
end component;

--maparea componentei de transmitere
component transmitfsm
Port ( 
    clk: in STD_LOGIC;
    rst : in STD_LOGIC;
    baud_en : in STD_LOGIC;
    tx_en : in STD_LOGIC;
    tx_data : in STD_LOGIC_VECTOR (7 downto 0);
    tx : out STD_LOGIC;
    tx_rdy : out STD_LOGIC);
end component;

-- * maparea componentei de receptare
component receivefsm
Port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    baud_en : in STD_LOGIC;
    rx : in STD_LOGIC;
    rx_data : out STD_LOGIC_VECTOR (7 downto 0);    
    rx_rdy : out STD_LOGIC);
end component;

--Semnalele baud_en și baud_en_x16 controlează sincronizarea transmiterii și recepției la un
--anumit baud rate. baud_en este pentru transmisie, iar baud_en_x16 este valoarea
--esantionata la o rata mai mare care este utilizata in recepție pentru a creste acuratetea.
signal baud_en, baud_en_x16 : std_logic;

--Controlează inițierea și procesul de transmisie serială. tx_rdy semnalizează când datele sunt gata de transmisie, iar tx_start inițiază transmisia.
signal tx_start, tx_en, tx_rdy, tx_rdy1: std_logic;

--Controlează procesul de recepție. rx_rdy indică momentul în care datele au fost recepționate, iar rx_rdy1 este o versiune întârziată cu un ciclu a acestuia pentru sincronizare
signal rx_rdy, rx_rdy1 : STD_LOGIC;

--Semnalele cnt și cnt_x16 sunt contoare pentru a număra ciclurile de ceas, utilizate in
--generarea semnalelor de baud rate pentru transmisie si receptie (baud_en și baud_en_x16).
signal cnt : STD_LOGIC_VECTOR(14 downto 0) := (others => '0');
signal cnt_x16 : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');

--Semnalele tx_reg și rx_reg sunt registre de 24 de biți pentru stocarea datelor transmise și recepționate
signal tx_reg, rx_reg : STD_LOGIC_VECTOR(23 downto 0);

--Semnalele tx_digit și rx_digit stochează câte 6 biți din datele transmise sau recepționate, corespunzând unui digit.
signal tx_digit, rx_digit : STD_LOGIC_VECTOR(5 downto 0);

--Semnalele tx_data și rx_data stochează datele de transmisie și recepție în format ASCII, fiecare de 8 biți
signal tx_data : STD_LOGIC_VECTOR(7 downto 0);
signal rx_data : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

--Semnalele tx_digit_cnt și rx_digit_cnt sunt contoare pentru a ține evidența digit-urilor transmise sau recepționate (câte 2 biți, deoarece sunt 4 digiti în total).
-- ** ne limiteaza doar la 4 caractere
-- pentru a creste dimensiunea, insa tot am avea o dimensiune fixa -> nu e cel mai ok
-- ca in C, primul caracter care e transmis sa fie lungimea mesajului, iar mai apoi receptorul stie cate caractere urmeaza
-- 
signal tx_digit_cnt : STD_LOGIC_VECTOR(1 downto 0); -- as putea modifica pana la 8 biti sa fie pana la 255 de caractere
signal rx_digit_cnt : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

--Semnalul en activează inițierea transmisiei si este generat de MPG
signal en: STD_LOGIC;

--Semnalul transmitionData stochează datele care urmează a fi transmise sau recepționate.
signal transmitionData : std_logic_vector(23 downto 0);

-- * Semnalele baud_limit si baud_limit_x16 reprezinta ciclurile de ceas pentru transmisie respectiv receptare
signal baud_limit: STD_LOGIC_VECTOR(14 downto 0) := (others => '0');
signal baud_limit_x16: STD_LOGIC_VECTOR(10 downto 0) := (others => '0');


begin
--maparea mono pulse generatorului la butonul 0 pentru a elimina fenomenul de debuncing
--iesirea en este folosita pentru a initializa transmisia
monopulse1: MPG port map(en, btn(0), clk);
-- *************** UART Tx ***************
--initiaza procedura de transmitere de date cand butonul este apasat
process(clk)
begin
    if rising_edge(clk) then
    tx_start <= en;
    end if;
end process;

-- *5. Modul pentru a selecta din mai multe baud rate-uri prestabilite:
-- 4800, 57600, 115200, 128000 pentru transmisie si receptie
-- folosim switchurile 2 si 3

-- Trebuie sa calculez nr de cicluri de ceas pt fiecare baud rate, pentru transmisie
-- 125,000,000 / 4800 - 1 = 26041
-- 125,000,000 / 57600 - 1 = 2169
-- 125,000,000 / 115200 - 1 = 1084
-- 125,000,000 / 128000 - 1 = 976

-- pentru receptare:
-- 125,000,000 / (4800 * 16) - 1 = 1627
-- 125,000,000 / (57600 * 16) - 1 = 135
-- 125,000,000 / (115200 * 16) - 1 = 67
-- 125,000,000 / (128000 * 16) - 1 = 60

--proces pentru transmisie
process(sw)
begin
    case sw(3 downto 2) is
        when "00" =>
            baud_limit <= "110010110101001";  -- 26041
        when "01" =>  
            baud_limit <= "000100001111001";  -- 2169
        when "10" =>  
            baud_limit <= "000010000111100";  -- 1084
        when "11" =>
            baud_limit <= "000001111010000";  -- 976
        when others =>
            baud_limit <= "110010110101001";  -- Default: 4800
    end case;
end process;

--proces pentru receptie
process(sw)
begin
    case sw(3 downto 2) is
        when "00" => 
            baud_limit_x16 <= "11001011011";  -- 1627
        when "01" =>  
            baud_limit_x16 <= "00010000111";  -- 135
        when "10" =>  
            baud_limit_x16 <= "00001000011";  -- 67
        when "11" =>  
            baud_limit_x16 <= "00000111100";  -- 60
        when others =>
            baud_limit_x16 <= "11001011011";  -- Default: 4800
    end case;
end process;

-- Acest proces generează semnalul baud_en pentru un ceas de 125 MHz. Contorul cnt se
-- incrementează la fiecare ciclu de ceas și resetează atunci când atinge valoarea #Numar,
-- care determină frecvența semnalului de baud rate.
-- baud_en este setat la '1' o dată la #Numar de cicluri de ceas.
process(clk)
begin
    -- Calcul factor de divizare pentru baud_en:
    -- Frecventa ceas: 125 MHz
    -- Baud rate: 9600
    -- Factor de divizare = 125,000,000 / 9600 = 13020.833... = 13021
    -- incepe de la 0, valoarea este 13020 (13021 - 1)
    
    --TO DO de calculat factorul de divizare (#Numar) pentru generarea semnalului baud_en
    --pentru un ceas cu frecventa de 125 Mhz
    if rising_edge(clk) then
        if cnt  = "011001011011100" then -- inlocuiesc cu baud_limit
            baud_en <= '1';
            cnt <= (others => '0');
        else
            baud_en <= '0';
            cnt <= cnt + 1;
        end if;
    end if;
end process;

--Acest proces generează semnalul tx_en care activează transmisia de date. tx_en devine '1'
-- la inițierea transmisiei (tx_start = '1') și revine la '0' atunci când transmisia este completă
--(tx_digit_cnt = 3 și baud_en = '1')
process(clk)
begin
    if rising_edge(clk) then
        if tx_start = '1' then
            tx_en <= '1';
        elsif baud_en = '1' and tx_digit_cnt = 3 then
            tx_en <= '0';
        end if;
    end if;
end process;

--Acest proces controlează contorul tx_digit_cnt, care numără cifrele din datele transmise.
--Contorul este resetat la 0 când începe transmisia (tx_start = '1') și se incrementează de
--fiecare dată când o cifra a fost transmisa (tx_rdy trece de la '0' la '1').
process(clk)
begin
    if rising_edge(clk) then
        tx_rdy1 <= tx_rdy; -- 1 clk delay
        if tx_start = '1' then
            tx_digit_cnt <= (others => '0');
        elsif tx_rdy = '1' and tx_rdy1 = '0' then
            tx_digit_cnt <= tx_digit_cnt + 1;
        end if;
    end if;
end process;

--Acest proces încarcă datele din transmitionData în registrul tx_reg când tx_start devine activ
process(clk)
begin
    if rising_edge(clk) then
        if tx_start = '1' then
            tx_reg <= transmitionData;
        end if;
    end if;
end process;
--Acest segment selectează câte un digit de 6 biți din registrul tx_reg pe baza valorii lui
--tx_digit_cnt. Se utilizează un multiplexor pentru a alege care parte a datelor va fi
--transmisă
with tx_digit_cnt select
tx_digit <= tx_reg(23 downto 18) when "00",
tx_reg(17 downto 12) when "01",
tx_reg(11 downto 6) when "10",
tx_reg(5 downto 0) when "11",
(others => 'X') when others;

--Acest segment convertește digitii selectați (6 biți) din tx_digit în caractere ASCII
--corespunzătoare (tx_data) pentru transmisie. Aceasta permite trimiterea caracterelor '0'
--până la '9' și 'A' până la 'Z' 

with tx_digit select
tx_data <= x"30" when "000000", -- '0'
x"31" when "000001", -- '1'
x"32" when "000010", -- '2'
x"33" when "000011", -- '3'
x"34" when "000100", -- '4'
x"35" when "000101", -- '5'
x"36" when "000110", -- '6'
x"37" when "000111", -- '7'
x"38" when "001000", -- '8'
x"39" when "001001", -- '9'
x"41" when "001010", -- 'A'
x"42" when "001011", -- 'B'
x"43" when "001100", -- 'C'
x"44" when "001101", -- 'D'
x"45" when "001110", -- 'E'
x"46" when "001111", -- 'F'
x"47" when "010000", -- 'G'
x"48" when "010001", -- 'H'
x"49" when "010010", -- 'I'
x"4A" when "010011", -- 'J'
x"4B" when "010100", -- 'K'
x"4C" when "010101", -- 'L'
x"4D" when "010110", -- 'M'
x"4E" when "010111", -- 'N'
x"4F" when "011000", -- 'O'
x"50" when "011001", -- 'P'
x"51" when "011010", -- 'Q'
x"52" when "011011", -- 'R'
x"53" when "011100", -- 'S'
x"54" when "011101", -- 'T'
x"55" when "011110", -- 'U'
x"56" when "011111", -- 'V'
x"57" when "100000", -- 'W'
x"58" when "100001", -- 'X'
x"59" when "100010", -- 'Y'
x"5A" when "100011", -- 'Z'
(others => 'X') when others;

-- transmitfsm este un modul instanțiat care implementează mașina de stări finite pentru
--transmisia serială. Parametrii includ ceasul (clk), semnalele de control (tx_en, baud_en),
--datele de transmisie (tx_data), ieșirea UART (uart_txd_out), și semnalul care indică că datele
--sunt gata de transmisie (tx_rdy)
inst_TFSM: transmitfsm port map(clk, '0', baud_en, tx_en, tx_data, tx, tx_rdy);
-- *************** UART Rx ***************
--blocul de instanțiere a unui FSM (Finite State Machine) pentru recepția datelor seriale
inst_RFSM: receivefsm port map(clk, '0', baud_en_x16, rx, rx_data, rx_rdy);

--Acest proces este responsabil cu generarea ratei supra esantionare, utilizata in receptie
--TO DO scrieti care este valoare lui #Numar2 astfel incat sa se poata genera o rata de
--supra esantionare pentru semnalul de receptive pentru un baud rate de 9600 si o
--frecventa a ceasului de 125Mhz

-- Calcul factor de divizare pentru baud_en_x16 (oversampling x16):
-- Frecventa ceas: 125 MHz
-- Baud rate: 9600
-- Oversampling: x16
-- Factor de divizare = 125,000,000 / (9600 * 16) = 125,000,000 / 153,600 = 813.802... ≈ 814
-- Cum contor incepe de la 0, valoarea este 813 (814 - 1)

process(clk)
begin
    --la fiecare muchie ascendenta a ceasului contorul cnt_x16 este incrementat
    if rising_edge(clk) then
        --Când contorul ajunge la #Numar2, semnalul baud_en_x16 este activat ('1'), indicând momentul în care se poate genera un puls pentru baud rate
        if cnt_x16 = "01100101101" then -- inlocuiesc cu baud_limit_x16
            --Semnalul baud_en_x16 este activ timp de un ciclu de ceas și se dezactivează imediat după aceea, până când contorul ajunge din nou la #Numar2
            baud_en_x16 <= '1';
            --Contorul este resetat la 0 după activarea semnalului, iar procesul se repetă
            cnt_x16 <= (others => '0');
        else
            baud_en_x16 <= '0';
            cnt_x16 <= cnt_x16 + 1;
        end if;
    end if;
end process;
--un decodificator care în funcție de valoarea ascii primită în rx_data, mapează datele primite la o valoare binară (rx_digit)
with rx_data select
rx_digit <= "000000" when x"30", -- '0'
			"000001" when x"31", -- '1'
            "000010" when x"32", -- '2'
			"000011" when x"33", -- '3'
			"000100" when x"34", -- '4'
			"000101" when x"35", -- '5'
			"000110" when x"36", -- '6'
			"000111" when x"37", -- '7'
			"001000" when x"38", -- '8'
			"001001" when x"39", -- '9'
			"001010" when x"41", -- 'A'
			"001011" when x"42", -- 'B'
			"001100" when x"43", -- 'C'
			"001101" when x"44", -- 'D'
			"001110" when x"45", -- 'E'
			"001111" when x"46", -- 'F'
			"010000" when x"47", -- 'G'
			"010001" when x"48", -- 'H'
			"010010" when x"49", -- 'I'
			"010011" when x"4A", -- 'J'
			"010100" when x"4B", -- 'K'
			"010101" when x"4C", -- 'L'
			"010110" when x"4D", -- 'M'
			"010111" when x"4E", -- 'N'
			"011000" when x"4F", -- 'O'
			"011001" when x"50", -- 'P'
			"011010" when x"51", -- 'Q'
			"011011" when x"52", -- 'R'
			"011100" when x"53", -- 'S'
			"011101" when x"54", -- 'T'
			"011110" when x"55", -- 'U'
			"011111" when x"56", -- 'V'
			"100000" when x"57", -- 'W'
			"100001" when x"58", -- 'X'
			"100010" when x"59", -- 'Y'
			"100011" when x"5A", -- 'Z'
(others => 'X') when others;
--Acest semnal continue datele finale care vor fii transmise la calculator
--Cand sw1 este 1 se transmit un sir de 4 caractere constante
--Cand sw1 este 0 se transmite ultima valoare receptionata de modulul de receptie
transmitionData <= B"010110_010110_011001_000001" when sw(1) = '1' else rx_reg;
--Detectează când o nouă valoare (rx_digit) a fost recepționată prin UART (semnalul rx_rdy)
--In scenariul nostru se receptioneaza 4 grupuri de 6 biti
process(clk)
begin
    if rising_edge(clk) then
        rx_rdy1 <= rx_rdy; -- 1 clk delay
        if rx_rdy = '1' and rx_rdy1 = '0' then
            case rx_digit_cnt is
                --Stochează secvențial bitii receptionati în registrul rx_reg, în funcție de valoarea contorului
                --rx_digit_cnt.
                when "00" => rx_reg(23 downto 18) <= rx_digit; -- 6 biți
                when "01" => rx_reg(17 downto 12) <= rx_digit;
                when "10" => rx_reg(11 downto 6) <= rx_digit;
                when "11" => rx_reg(5 downto 0) <= rx_digit;
                when others => rx_reg(5 downto 0) <= (others => 'X');
            end case;
            --Incrementarea contorului permite ca următorul digit să fie stocat în altă parte a registrului,
            --astfel încât să fie colectate patru grupuri de câte 6 biți (un total de 24 de biți)
            rx_digit_cnt <= rx_digit_cnt + 1;
        end if;
    end if;
end process;
end Behavioral;