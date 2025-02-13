library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VHDL_MOORE_FSM_Sequence_Detector is
port (
 clock: in std_logic; --- clock signal
 reset: in std_logic; -- reset input
 sequence_in: in std_logic; -- binary sequence input
 detector_out: out std_logic -- output of the VHDL sequence detector
);
end VHDL_MOORE_FSM_Sequence_Detector;

architecture Behavioral of VHDL_MOORE_FSM_Sequence_Detector is
type MOORE_FSM is (Zero, One, OneZero, OneZeroZero, OneZeroZeroOne);
signal current_state, next_state: MOORE_FSM;

begin
-- Sequential memory of the VHDL MOORE FSM Sequence Detector
process(clock,reset)
begin
 if(reset='1') then
  current_state <= Zero;
 elsif(rising_edge(clock)) then
  current_state <= next_state;
 end if;
end process;
-- Next state logic of the VHDL MOORE FSM Sequence Detector
-- Combinational logic
process(current_state,sequence_in)
begin
 case(current_state) is
 when Zero =>
  if(sequence_in='1') then
   -- "1"
   next_state <= One;
  else
   next_state <= Zero;
  end if;
 when One =>
  if(sequence_in='0') then
   -- "10"
   next_state <= OneZero;
  else
   next_state <= One;
  end if;  
 when OneZero => 
  if(sequence_in='0') then
   -- "100"
   next_state <= OneZeroZero;
  else
   next_state <= One;
  end if;  
 when OneZeroZero =>
  if(sequence_in='1') then
   -- "1001"
   next_state <= OneZeroZeroOne;
  else
   next_state <= Zero;
  end if; 
 when OneZeroZeroOne =>
  if(sequence_in='1') then
   next_state <= One;
  else
   next_state <= OneZero;
  end if;
 end case;
end process;
-- Output logic of the VHDL MOORE FSM Sequence Detector
process(current_state)
begin 
 case current_state is
 when Zero =>
  detector_out <= '0';
 when One =>
  detector_out <= '0'; 
 when OneZero => 
  detector_out <= '0'; 
 when OneZeroZero =>
  detector_out <= '0'; 
 when OneZeroZeroOne =>
  detector_out <= '1';
 end case;
end process;
end Behavioral;