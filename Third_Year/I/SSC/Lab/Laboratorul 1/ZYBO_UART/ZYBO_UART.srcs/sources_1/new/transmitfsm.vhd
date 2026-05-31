--Includerea librariilor necesare
library IEEE;
--ofera definitii pentru tipuri de date precum STD_LOGIC și STD_LOGIC_VECTOR
use IEEE.STD_LOGIC_1164.ALL;
--permite operatii aritmetice pe tipul std_logic
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--entitatea pentru modulul de transmisie
entity transmitfsm is
Port (
    --Semnalul de ceas (clock), folosit pentru sincronizarea FSM-ului.
    clk: in STD_LOGIC;
    
    --Semnalul de resetare, care inițializează FSM-ul într-o stare de start.
    rst : in STD_LOGIC;
    
    --Semnalul care controlează rata baud (viteza de transmisie).
    baud_en : in STD_LOGIC;
    
    --Semnalul care permite inițierea transmisiei.
    tx_en : in STD_LOGIC;
    
    --Datele de transmis, pe 8 biți (STD_LOGIC_VECTOR (7 downto 0)).
    tx_data : in STD_LOGIC_VECTOR (7 downto 0);
    
    --Ieșirea serială, ce transmite datele bit cu bit.
    tx : out STD_LOGIC;
    
    --Ieșire care indică dacă transmisia este gata să înceapă.
    tx_rdy : out STD_LOGIC);
end transmitfsm;

architecture Behavioral of transmitfsm is
--Tip de date pentru stările FSM-ului (idle, start, bits, stop).
type state_type is (idle, start, bits, stop);

--Semnal pentru a stoca starea curentă a FSM-ului, inițializată la idle.
signal state : state_type := idle;

--Contor de biți, folosit pentru a număra biții de date transmiși (de la 0 la 7).
signal bit_cnt : STD_LOGIC_VECTOR(2 downto 0);

begin
-- FSM state transition
--Aici ar trebui implementată logica de tranziție a stărilor FSM, pe baza intrărilor clk și rst.
--Acesta este locul în care FSM-ul va trece între stările idle, start, bits și stop în funcție de
--condițiile și semnalele de intrare
process (clk, rst)
begin
--TO DO
-- De implementat tranzitia de stari a FSM-ului pe baza Figurii 1.3 de la sectiunea 1.3.2
    if rst = '1' then
        state <= idle;
    elsif rising_edge(clk) then 
        if baud_en = '1' then
            case state is
                when idle =>
                    if tx_en = '1' then
                        state <= start;
                        bit_cnt <= "000";
                    else
                        state <= idle;
                    end if;
                when start =>
                    state <= bits;
                when bits =>
                    if bit_cnt < 7 then
                        state <= bits;
                        bit_cnt <= bit_cnt + 1;
                    else
                        state <= stop;
                    end if;
                when stop =>
                    state <= idle;
                when others =>
                    state <= idle;
                    bit_cnt <= "000";
             end case;
         end if;
     end if;
end process;
-- FSM outputs
--Descrie cum se generează ieșirile (tx și tx_rdy) în funcție de starea curentă a FSM-ului
process(state, tx_data, bit_cnt)
begin
    case state is
        when idle => 
            tx <= '1'; tx_rdy <= '1';
        when start => 
            tx <= '0'; tx_rdy <= '0';
        when bits =>
            tx <= tx_data(conv_integer(bit_cnt));
            tx_rdy <= '0';
        when stop => 
            tx <= '1'; tx_rdy <= '0';
        when others => 
            tx <= 'X'; tx_rdy <= 'X';
    end case;
end process;
end Behavioral;