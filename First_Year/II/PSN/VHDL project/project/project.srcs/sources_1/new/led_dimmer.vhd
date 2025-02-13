library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entitatea principala care include toate modurile si afisajul
entity Main_Controller is
    Port ( clk : in STD_LOGIC;
           switches : in STD_LOGIC_VECTOR (7 downto 0);
           mode_select : in STD_LOGIC_VECTOR (1 downto 0);
           time_interval : in STD_LOGIC_VECTOR (2 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0);
           anodes : out STD_LOGIC_VECTOR(3 downto 0);
           cathodes : out STD_LOGIC_VECTOR(6 downto 0));
end Main_Controller;

architecture Behavioral of Main_Controller is
        
    component Manual_Mode is
        Port (
            switches : in STD_LOGIC_VECTOR (7 downto 0); 
            led_output : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component Test_Mode is
        Port ( clk : in STD_LOGIC;
               led_output : out STD_LOGIC_VECTOR (7 downto 0)); 
    end component;

    component Auto_Mode is
       Port ( clk : in STD_LOGIC;
               time_interval : in STD_LOGIC_VECTOR(2 downto 0); 
               led_output : out STD_LOGIC_VECTOR (7 downto 0)); 
    end component;

    component Seven_Segment_Display is
        Port ( clk : in STD_LOGIC;
               mode : in STD_LOGIC_VECTOR (1 downto 0);
               anodes : out STD_LOGIC_VECTOR (3 downto 0);
               cathodes : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    -- Semnale intermediare
     signal led_manual : STD_LOGIC_VECTOR (7 downto 0);
     signal led_test : STD_LOGIC_VECTOR (7 downto 0);
     signal led_auto : STD_LOGIC_VECTOR (7 downto 0);
     
        begin
         
         manual_inst : Manual_Mode port map(
             switches => switches,
             led_output => led_manual
         );
     
         test_inst : Test_Mode port map(
             clk => clk,
             led_output => led_test
         );
     
         auto_inst : Auto_Mode port map(
             clk => clk,
             time_interval => time_interval,
             led_output => led_auto
         );
     
        display_inst : Seven_Segment_Display port map(
              clk => clk,
              mode => mode_select,
              anodes => anodes,
              cathodes => cathodes
         );
                  
        control_logic : process(clk)
        begin
            if rising_edge(clk) then
                case mode_select is
                    when "00" =>
                        led <= led_manual;
                    when "01" =>
                        led <= led_test;
                    when "10" =>
                        led <= led_auto;
                    when others =>
                        led <= (others => '0');
                end case;
            end if;
        end process;
     end Behavioral;
