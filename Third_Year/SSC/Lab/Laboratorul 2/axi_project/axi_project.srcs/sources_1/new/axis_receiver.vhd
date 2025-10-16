library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axis_receiver is
generic(
    TIMEOUT_N: natural := 125_000_000
);
port(
    clk            : in  std_logic;
    rst_n          : in  std_logic;            -- reset activ LOW

    -- control backpressure (ex. dintr-un switch)
    ready_en       : in  std_logic;            -- '1' = accepta date (TREADY=1), '0' = blocheaza (TREADY=0)

    -- AXI4-Stream Slave (Sink)
    s_axis_tdata   : in  std_logic_vector(7 downto 0);
    s_axis_tvalid  : in  std_logic;
    s_axis_tlast   : in  std_logic;    --pt exercitiile propuse
    raw_data       : in  std_logic;    -- l-am adaugat ca sa folosesc switch-ul 3 pentru a afisa valorile primite prin axi       
    s_axis_tready  : out std_logic;

    -- iesire către placa
    leds           : out std_logic_vector(3 downto 0);
    
    -- led de eroare (timeout)
    error_led      : out std_logic;
    
    -- led de eroare (paritate)
    parity_led     : out std_logic  
  );
end axis_receiver;

architecture Behavioral of axis_receiver is
    signal leds_r : std_logic_vector(3 downto 0) := (others => '0');
    
    signal timeout_cnt : unsigned(31 downto 0) := (others => '0');
    signal error_flag  : std_logic := '0';
    
    signal parity_error : std_logic := '0';
begin
 -- backpressure simplu: TREADY urmeaza ready_en
  s_axis_tready <= ready_en;
  
  process(clk)
  variable parity_bit : std_logic;
  begin
    if rising_edge(clk) then
      if rst_n = '0' then
        leds_r <= (others => '0');
        
        timeout_cnt <= (others => '0');
        error_flag <= '0';
        parity_error <= '0'; 
      else
        -- crestem contotul la fiecare ciclu de ceas
        if timeout_cnt < to_unsigned(TIMEOUT_N, timeout_cnt'length) then
            timeout_cnt <= timeout_cnt + 1;
        end if;
        
        -- daca atingem limita, setam flag-ul de eroare
        if timeout_cnt >= to_unsigned(TIMEOUT_N, timeout_cnt'length) then
            error_flag <= '1';
        end if;
      
        -- Lasam transferul să aiba loc DOAR la handshake: TVALID=1 și TREADY=1
        if (s_axis_tvalid = '1' and ready_en = '1') then
            timeout_cnt <= (others => '0');
            error_flag <= '0';
            
            parity_bit := s_axis_tdata(0) xor s_axis_tdata(1) xor s_axis_tdata(2) xor s_axis_tdata(3);
            
            if parity_bit /= s_axis_tdata(4) then
                parity_error <= '1';
            else
                parity_error <= '0';
            end if;
            
            if raw_data = '1' then
                leds_r <= s_axis_tdata(3 downto 0);
            else
              -- luam nibble-ul jos si adunam 1; aritmetica pe 4 biti face wrap (mod 16)
              leds_r <= std_logic_vector(unsigned(s_axis_tdata(3 downto 0)) + 1);
            end if;
        end if;
      end if;
    end if;
  end process;

  leds <= leds_r;
  error_led <= error_flag;
  parity_led <= parity_error;
end Behavioral;