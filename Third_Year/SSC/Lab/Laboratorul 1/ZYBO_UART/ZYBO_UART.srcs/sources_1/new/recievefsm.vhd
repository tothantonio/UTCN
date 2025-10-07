--includerea librariilor necesare rularii proiectului
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--declararea entitatii de primire de date
entity receivefsm is
Port (
    -- Semnal de intrare pentru ceas (clock), folosit pentru sincronizarea FSM-ului
    clk : in STD_LOGIC;
    
    -- Semnal de resetare. Când este activ ('1'), FSM-ul revine la starea inițială (idle).
    rst : in STD_LOGIC;
    
    -- Semnal de activare a baudrate-ului. Când este activ ('1'), FSM progresează la următoarea stare
    baud_en : in STD_LOGIC;
    
    -- Semnalul de intrare care primește datele seriale.
    rx : in STD_LOGIC;
    
    -- Datele recepționate sunt stocate în acest vector de 8 biți.
    rx_data : out STD_LOGIC_VECTOR (7 downto 0);
    
    -- Semnal care indică atunci când datele sunt disponibile ('1'), altfel este '0'.
    rx_rdy : out STD_LOGIC);
end receivefsm;

--arhitectura modulului
architecture Behavioral of receivefsm is
--Definirea tipului state_type, care reprezintă toate stările posibile ale FSM-ului
--Atentie NU e typo ca wait e cu 2 de 't'
type state_type is (idle, start, bits, waitt, stop);

--Semnal care ține evidența stării curente a FSM-ului, inițializat cu starea idle.
signal state : state_type := idle;

-- Un contor de 4 biți pentru a număra ciclurile ceasului în funcție de baudrate.
signal baud_cnt : STD_LOGIC_VECTOR (3 downto 0);

-- Un contor de 3 biți pentru a număra biții dintr-un octet de date.
signal bit_cnt : STD_LOGIC_VECTOR (2 downto 0);

begin
-- Tranzitia de stari a FSM-ului
process(clk, rst)
begin
    --Dacă semnalul de resetare rst este activ ('1'), FSM revine la starea idle.
    if rst = '1' then
        state <= idle;
        --Dacă nu este resetare, atunci la fiecare front crescător al ceasului (clk),
        --FSM-ul verifică dacă semnalul baud_en este activ ('1').
    elsif rising_edge(clk) then
        --Dacă baud_en este activ, FSM-ul își poate schimba starea conform logicii din case state is.
        if baud_en = '1' then
            case state is
                --TO DO
                --de implementat tranzitia de stari pentru FSM-ul de receptie pe baza Figurii 1.6 din sectiunea 1.3.3
                when idle =>
                    baud_cnt <= "0000";
                    if rx = '0' then
                        state <= start;
                    else
                        state <= idle;
                    end if;
                when start =>
                    if baud_cnt < 7 then
                        state <= start;
                        baud_cnt <= baud_cnt + 1;
                    else
                        if rx = '0' then
                            state <= bits;
                        else 
                            state <= idle;
                        end if;
                    end if;
                when bits =>
                    if baud_cnt < 15 then
                        state <= bits;
                        baud_cnt <= baud_cnt + 1;
                    else
                        rx_data(conv_integer(bit_cnt)) <= rx;
                        baud_cnt <= "0000";
                        if bit_cnt < 7 then
                            state <= bits;
                            bit_cnt <= bit_cnt + 1;
                        else
                            state <= stop;
                        end if;
                    end if;
                when stop =>
                    if baud_cnt < 15 then
                        state <= stop;
                        baud_cnt <= baud_cnt + 1;
                    else 
                        state <= waitt;
                    end if;
                when waitt =>
                    if baud_cnt < 7 then
                        state <= waitt;
                        baud_cnt <= baud_cnt + 1;
                     else
                        state <= idle;
                     end if;
                when others =>
                    state <= idle;
                    baud_cnt <= "0000";
            end case;
        end if;
    end if;
end process;
-- Iesirile FSM-ului
process (state)
begin
    -- Logica pentru setarea semnalului rx_rdy în funcție de starea curentă
    case state is
    -- idle, start, bits, stop: Setează rx_rdy la '0', indicând că nu sunt date disponibile.
        when idle => 
            rx_rdy <= '0';
        when start => 
            rx_rdy <='0';
        when bits => 
            rx_rdy <='0';
        when stop => 
            rx_rdy <='0';
        --waitt: Setează rx_rdy la '1', indicând că datele sunt disponibile și pregătite să fie citite.
        when waitt => 
            rx_rdy <='1';
        --others: Acoperă alte stări neanticipate, setând rx_rdy la un semnal nedeterminat ('X'),
        --ceea ce indică o situație de eroare sau o stare nevalidă
        when others => rx_rdy <='X';
    end case;
    --finalizarea procesului cu iesirile FSM-ului
end process;
end Behavioral;