-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Thu Apr 25 09:22:57 2024
-- Host        : DESKTOP-845QQM1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {D:/VHDL
--               project/project/project.sim/sim_1/synth/func/Test_Mode_func_synth.vhd}
-- Design      : Test_Mode
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Test_Mode is
  port (
    clk : in STD_LOGIC;
    led_output : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Test_Mode : entity is true;
end Test_Mode;

architecture STRUCTURE of Test_Mode is
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal \counters[0]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counters[0][0]_i_2_n_0\ : STD_LOGIC;
  signal \counters[0][0]_i_3_n_0\ : STD_LOGIC;
  signal \counters[0][0]_i_4_n_0\ : STD_LOGIC;
  signal \counters[0][0]_i_5_n_0\ : STD_LOGIC;
  signal \counters[0][0]_i_6_n_0\ : STD_LOGIC;
  signal \counters[0][0]_i_7_n_0\ : STD_LOGIC;
  signal \counters[0][0]_i_8_n_0\ : STD_LOGIC;
  signal \counters[0][12]_i_2_n_0\ : STD_LOGIC;
  signal \counters[0][12]_i_3_n_0\ : STD_LOGIC;
  signal \counters[0][12]_i_4_n_0\ : STD_LOGIC;
  signal \counters[0][12]_i_5_n_0\ : STD_LOGIC;
  signal \counters[0][16]_i_2_n_0\ : STD_LOGIC;
  signal \counters[0][16]_i_3_n_0\ : STD_LOGIC;
  signal \counters[0][16]_i_4_n_0\ : STD_LOGIC;
  signal \counters[0][16]_i_5_n_0\ : STD_LOGIC;
  signal \counters[0][20]_i_2_n_0\ : STD_LOGIC;
  signal \counters[0][20]_i_3_n_0\ : STD_LOGIC;
  signal \counters[0][20]_i_4_n_0\ : STD_LOGIC;
  signal \counters[0][20]_i_5_n_0\ : STD_LOGIC;
  signal \counters[0][24]_i_2_n_0\ : STD_LOGIC;
  signal \counters[0][24]_i_3_n_0\ : STD_LOGIC;
  signal \counters[0][24]_i_4_n_0\ : STD_LOGIC;
  signal \counters[0][24]_i_5_n_0\ : STD_LOGIC;
  signal \counters[0][28]_i_2_n_0\ : STD_LOGIC;
  signal \counters[0][28]_i_3_n_0\ : STD_LOGIC;
  signal \counters[0][28]_i_4_n_0\ : STD_LOGIC;
  signal \counters[0][28]_i_5_n_0\ : STD_LOGIC;
  signal \counters[0][30]_i_1_n_0\ : STD_LOGIC;
  signal \counters[0][30]_i_3_n_0\ : STD_LOGIC;
  signal \counters[0][30]_i_4_n_0\ : STD_LOGIC;
  signal \counters[0][4]_i_2_n_0\ : STD_LOGIC;
  signal \counters[0][4]_i_3_n_0\ : STD_LOGIC;
  signal \counters[0][4]_i_4_n_0\ : STD_LOGIC;
  signal \counters[0][4]_i_5_n_0\ : STD_LOGIC;
  signal \counters[0][8]_i_2_n_0\ : STD_LOGIC;
  signal \counters[0][8]_i_3_n_0\ : STD_LOGIC;
  signal \counters[0][8]_i_4_n_0\ : STD_LOGIC;
  signal \counters[0][8]_i_5_n_0\ : STD_LOGIC;
  signal \counters[1][0]_i_1_n_0\ : STD_LOGIC;
  signal \counters[1][12]_i_2_n_0\ : STD_LOGIC;
  signal \counters[1][12]_i_3_n_0\ : STD_LOGIC;
  signal \counters[1][12]_i_4_n_0\ : STD_LOGIC;
  signal \counters[1][12]_i_5_n_0\ : STD_LOGIC;
  signal \counters[1][16]_i_2_n_0\ : STD_LOGIC;
  signal \counters[1][16]_i_3_n_0\ : STD_LOGIC;
  signal \counters[1][16]_i_4_n_0\ : STD_LOGIC;
  signal \counters[1][16]_i_5_n_0\ : STD_LOGIC;
  signal \counters[1][20]_i_2_n_0\ : STD_LOGIC;
  signal \counters[1][20]_i_3_n_0\ : STD_LOGIC;
  signal \counters[1][20]_i_4_n_0\ : STD_LOGIC;
  signal \counters[1][20]_i_5_n_0\ : STD_LOGIC;
  signal \counters[1][24]_i_2_n_0\ : STD_LOGIC;
  signal \counters[1][24]_i_3_n_0\ : STD_LOGIC;
  signal \counters[1][24]_i_4_n_0\ : STD_LOGIC;
  signal \counters[1][24]_i_5_n_0\ : STD_LOGIC;
  signal \counters[1][28]_i_2_n_0\ : STD_LOGIC;
  signal \counters[1][28]_i_3_n_0\ : STD_LOGIC;
  signal \counters[1][28]_i_4_n_0\ : STD_LOGIC;
  signal \counters[1][28]_i_5_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_10_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_11_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_12_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_1_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_3_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_4_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_5_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_6_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_7_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_8_n_0\ : STD_LOGIC;
  signal \counters[1][30]_i_9_n_0\ : STD_LOGIC;
  signal \counters[1][4]_i_2_n_0\ : STD_LOGIC;
  signal \counters[1][4]_i_3_n_0\ : STD_LOGIC;
  signal \counters[1][4]_i_4_n_0\ : STD_LOGIC;
  signal \counters[1][4]_i_5_n_0\ : STD_LOGIC;
  signal \counters[1][8]_i_2_n_0\ : STD_LOGIC;
  signal \counters[1][8]_i_3_n_0\ : STD_LOGIC;
  signal \counters[1][8]_i_4_n_0\ : STD_LOGIC;
  signal \counters[1][8]_i_5_n_0\ : STD_LOGIC;
  signal \counters[2]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counters[2][0]_i_2_n_0\ : STD_LOGIC;
  signal \counters[2][0]_i_3_n_0\ : STD_LOGIC;
  signal \counters[2][0]_i_4_n_0\ : STD_LOGIC;
  signal \counters[2][0]_i_5_n_0\ : STD_LOGIC;
  signal \counters[2][0]_i_6_n_0\ : STD_LOGIC;
  signal \counters[2][0]_i_7_n_0\ : STD_LOGIC;
  signal \counters[2][0]_i_8_n_0\ : STD_LOGIC;
  signal \counters[2][12]_i_2_n_0\ : STD_LOGIC;
  signal \counters[2][12]_i_3_n_0\ : STD_LOGIC;
  signal \counters[2][12]_i_4_n_0\ : STD_LOGIC;
  signal \counters[2][12]_i_5_n_0\ : STD_LOGIC;
  signal \counters[2][16]_i_2_n_0\ : STD_LOGIC;
  signal \counters[2][16]_i_3_n_0\ : STD_LOGIC;
  signal \counters[2][16]_i_4_n_0\ : STD_LOGIC;
  signal \counters[2][16]_i_5_n_0\ : STD_LOGIC;
  signal \counters[2][20]_i_2_n_0\ : STD_LOGIC;
  signal \counters[2][20]_i_3_n_0\ : STD_LOGIC;
  signal \counters[2][20]_i_4_n_0\ : STD_LOGIC;
  signal \counters[2][20]_i_5_n_0\ : STD_LOGIC;
  signal \counters[2][24]_i_2_n_0\ : STD_LOGIC;
  signal \counters[2][24]_i_3_n_0\ : STD_LOGIC;
  signal \counters[2][24]_i_4_n_0\ : STD_LOGIC;
  signal \counters[2][24]_i_5_n_0\ : STD_LOGIC;
  signal \counters[2][28]_i_2_n_0\ : STD_LOGIC;
  signal \counters[2][28]_i_3_n_0\ : STD_LOGIC;
  signal \counters[2][28]_i_4_n_0\ : STD_LOGIC;
  signal \counters[2][28]_i_5_n_0\ : STD_LOGIC;
  signal \counters[2][30]_i_1_n_0\ : STD_LOGIC;
  signal \counters[2][30]_i_3_n_0\ : STD_LOGIC;
  signal \counters[2][30]_i_4_n_0\ : STD_LOGIC;
  signal \counters[2][4]_i_2_n_0\ : STD_LOGIC;
  signal \counters[2][4]_i_3_n_0\ : STD_LOGIC;
  signal \counters[2][4]_i_4_n_0\ : STD_LOGIC;
  signal \counters[2][4]_i_5_n_0\ : STD_LOGIC;
  signal \counters[2][8]_i_2_n_0\ : STD_LOGIC;
  signal \counters[2][8]_i_3_n_0\ : STD_LOGIC;
  signal \counters[2][8]_i_4_n_0\ : STD_LOGIC;
  signal \counters[2][8]_i_5_n_0\ : STD_LOGIC;
  signal \counters[3]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counters[3][0]_i_2_n_0\ : STD_LOGIC;
  signal \counters[3][0]_i_3_n_0\ : STD_LOGIC;
  signal \counters[3][0]_i_4_n_0\ : STD_LOGIC;
  signal \counters[3][0]_i_5_n_0\ : STD_LOGIC;
  signal \counters[3][0]_i_6_n_0\ : STD_LOGIC;
  signal \counters[3][0]_i_7_n_0\ : STD_LOGIC;
  signal \counters[3][0]_i_8_n_0\ : STD_LOGIC;
  signal \counters[3][12]_i_2_n_0\ : STD_LOGIC;
  signal \counters[3][12]_i_3_n_0\ : STD_LOGIC;
  signal \counters[3][12]_i_4_n_0\ : STD_LOGIC;
  signal \counters[3][12]_i_5_n_0\ : STD_LOGIC;
  signal \counters[3][16]_i_2_n_0\ : STD_LOGIC;
  signal \counters[3][16]_i_3_n_0\ : STD_LOGIC;
  signal \counters[3][16]_i_4_n_0\ : STD_LOGIC;
  signal \counters[3][16]_i_5_n_0\ : STD_LOGIC;
  signal \counters[3][20]_i_2_n_0\ : STD_LOGIC;
  signal \counters[3][20]_i_3_n_0\ : STD_LOGIC;
  signal \counters[3][20]_i_4_n_0\ : STD_LOGIC;
  signal \counters[3][20]_i_5_n_0\ : STD_LOGIC;
  signal \counters[3][24]_i_2_n_0\ : STD_LOGIC;
  signal \counters[3][24]_i_3_n_0\ : STD_LOGIC;
  signal \counters[3][24]_i_4_n_0\ : STD_LOGIC;
  signal \counters[3][24]_i_5_n_0\ : STD_LOGIC;
  signal \counters[3][28]_i_2_n_0\ : STD_LOGIC;
  signal \counters[3][28]_i_3_n_0\ : STD_LOGIC;
  signal \counters[3][28]_i_4_n_0\ : STD_LOGIC;
  signal \counters[3][28]_i_5_n_0\ : STD_LOGIC;
  signal \counters[3][30]_i_1_n_0\ : STD_LOGIC;
  signal \counters[3][30]_i_3_n_0\ : STD_LOGIC;
  signal \counters[3][30]_i_4_n_0\ : STD_LOGIC;
  signal \counters[3][4]_i_2_n_0\ : STD_LOGIC;
  signal \counters[3][4]_i_3_n_0\ : STD_LOGIC;
  signal \counters[3][4]_i_4_n_0\ : STD_LOGIC;
  signal \counters[3][4]_i_5_n_0\ : STD_LOGIC;
  signal \counters[3][8]_i_2_n_0\ : STD_LOGIC;
  signal \counters[3][8]_i_3_n_0\ : STD_LOGIC;
  signal \counters[3][8]_i_4_n_0\ : STD_LOGIC;
  signal \counters[3][8]_i_5_n_0\ : STD_LOGIC;
  signal \counters[4]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counters[4][0]_i_2_n_0\ : STD_LOGIC;
  signal \counters[4][0]_i_3_n_0\ : STD_LOGIC;
  signal \counters[4][0]_i_4_n_0\ : STD_LOGIC;
  signal \counters[4][0]_i_5_n_0\ : STD_LOGIC;
  signal \counters[4][0]_i_6_n_0\ : STD_LOGIC;
  signal \counters[4][0]_i_7_n_0\ : STD_LOGIC;
  signal \counters[4][0]_i_8_n_0\ : STD_LOGIC;
  signal \counters[4][12]_i_2_n_0\ : STD_LOGIC;
  signal \counters[4][12]_i_3_n_0\ : STD_LOGIC;
  signal \counters[4][12]_i_4_n_0\ : STD_LOGIC;
  signal \counters[4][12]_i_5_n_0\ : STD_LOGIC;
  signal \counters[4][16]_i_2_n_0\ : STD_LOGIC;
  signal \counters[4][16]_i_3_n_0\ : STD_LOGIC;
  signal \counters[4][16]_i_4_n_0\ : STD_LOGIC;
  signal \counters[4][16]_i_5_n_0\ : STD_LOGIC;
  signal \counters[4][20]_i_2_n_0\ : STD_LOGIC;
  signal \counters[4][20]_i_3_n_0\ : STD_LOGIC;
  signal \counters[4][20]_i_4_n_0\ : STD_LOGIC;
  signal \counters[4][20]_i_5_n_0\ : STD_LOGIC;
  signal \counters[4][24]_i_2_n_0\ : STD_LOGIC;
  signal \counters[4][24]_i_3_n_0\ : STD_LOGIC;
  signal \counters[4][24]_i_4_n_0\ : STD_LOGIC;
  signal \counters[4][24]_i_5_n_0\ : STD_LOGIC;
  signal \counters[4][28]_i_2_n_0\ : STD_LOGIC;
  signal \counters[4][28]_i_3_n_0\ : STD_LOGIC;
  signal \counters[4][28]_i_4_n_0\ : STD_LOGIC;
  signal \counters[4][28]_i_5_n_0\ : STD_LOGIC;
  signal \counters[4][30]_i_1_n_0\ : STD_LOGIC;
  signal \counters[4][30]_i_3_n_0\ : STD_LOGIC;
  signal \counters[4][30]_i_4_n_0\ : STD_LOGIC;
  signal \counters[4][4]_i_2_n_0\ : STD_LOGIC;
  signal \counters[4][4]_i_3_n_0\ : STD_LOGIC;
  signal \counters[4][4]_i_4_n_0\ : STD_LOGIC;
  signal \counters[4][4]_i_5_n_0\ : STD_LOGIC;
  signal \counters[4][8]_i_2_n_0\ : STD_LOGIC;
  signal \counters[4][8]_i_3_n_0\ : STD_LOGIC;
  signal \counters[4][8]_i_4_n_0\ : STD_LOGIC;
  signal \counters[4][8]_i_5_n_0\ : STD_LOGIC;
  signal \counters[5]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counters[5][0]_i_2_n_0\ : STD_LOGIC;
  signal \counters[5][0]_i_3_n_0\ : STD_LOGIC;
  signal \counters[5][0]_i_4_n_0\ : STD_LOGIC;
  signal \counters[5][0]_i_5_n_0\ : STD_LOGIC;
  signal \counters[5][0]_i_6_n_0\ : STD_LOGIC;
  signal \counters[5][0]_i_7_n_0\ : STD_LOGIC;
  signal \counters[5][12]_i_2_n_0\ : STD_LOGIC;
  signal \counters[5][12]_i_3_n_0\ : STD_LOGIC;
  signal \counters[5][12]_i_4_n_0\ : STD_LOGIC;
  signal \counters[5][12]_i_5_n_0\ : STD_LOGIC;
  signal \counters[5][16]_i_2_n_0\ : STD_LOGIC;
  signal \counters[5][16]_i_3_n_0\ : STD_LOGIC;
  signal \counters[5][16]_i_4_n_0\ : STD_LOGIC;
  signal \counters[5][16]_i_5_n_0\ : STD_LOGIC;
  signal \counters[5][20]_i_2_n_0\ : STD_LOGIC;
  signal \counters[5][20]_i_3_n_0\ : STD_LOGIC;
  signal \counters[5][20]_i_4_n_0\ : STD_LOGIC;
  signal \counters[5][20]_i_5_n_0\ : STD_LOGIC;
  signal \counters[5][24]_i_2_n_0\ : STD_LOGIC;
  signal \counters[5][24]_i_3_n_0\ : STD_LOGIC;
  signal \counters[5][24]_i_4_n_0\ : STD_LOGIC;
  signal \counters[5][24]_i_5_n_0\ : STD_LOGIC;
  signal \counters[5][28]_i_2_n_0\ : STD_LOGIC;
  signal \counters[5][28]_i_3_n_0\ : STD_LOGIC;
  signal \counters[5][28]_i_4_n_0\ : STD_LOGIC;
  signal \counters[5][28]_i_5_n_0\ : STD_LOGIC;
  signal \counters[5][30]_i_1_n_0\ : STD_LOGIC;
  signal \counters[5][30]_i_3_n_0\ : STD_LOGIC;
  signal \counters[5][30]_i_4_n_0\ : STD_LOGIC;
  signal \counters[5][4]_i_2_n_0\ : STD_LOGIC;
  signal \counters[5][4]_i_3_n_0\ : STD_LOGIC;
  signal \counters[5][4]_i_4_n_0\ : STD_LOGIC;
  signal \counters[5][4]_i_5_n_0\ : STD_LOGIC;
  signal \counters[5][8]_i_2_n_0\ : STD_LOGIC;
  signal \counters[5][8]_i_3_n_0\ : STD_LOGIC;
  signal \counters[5][8]_i_4_n_0\ : STD_LOGIC;
  signal \counters[5][8]_i_5_n_0\ : STD_LOGIC;
  signal \counters[6]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counters[6][0]_i_2_n_0\ : STD_LOGIC;
  signal \counters[6][0]_i_3_n_0\ : STD_LOGIC;
  signal \counters[6][0]_i_4_n_0\ : STD_LOGIC;
  signal \counters[6][0]_i_5_n_0\ : STD_LOGIC;
  signal \counters[6][0]_i_6_n_0\ : STD_LOGIC;
  signal \counters[6][0]_i_7_n_0\ : STD_LOGIC;
  signal \counters[6][0]_i_8_n_0\ : STD_LOGIC;
  signal \counters[6][12]_i_2_n_0\ : STD_LOGIC;
  signal \counters[6][12]_i_3_n_0\ : STD_LOGIC;
  signal \counters[6][12]_i_4_n_0\ : STD_LOGIC;
  signal \counters[6][12]_i_5_n_0\ : STD_LOGIC;
  signal \counters[6][16]_i_2_n_0\ : STD_LOGIC;
  signal \counters[6][16]_i_3_n_0\ : STD_LOGIC;
  signal \counters[6][16]_i_4_n_0\ : STD_LOGIC;
  signal \counters[6][16]_i_5_n_0\ : STD_LOGIC;
  signal \counters[6][20]_i_2_n_0\ : STD_LOGIC;
  signal \counters[6][20]_i_3_n_0\ : STD_LOGIC;
  signal \counters[6][20]_i_4_n_0\ : STD_LOGIC;
  signal \counters[6][20]_i_5_n_0\ : STD_LOGIC;
  signal \counters[6][24]_i_2_n_0\ : STD_LOGIC;
  signal \counters[6][24]_i_3_n_0\ : STD_LOGIC;
  signal \counters[6][24]_i_4_n_0\ : STD_LOGIC;
  signal \counters[6][24]_i_5_n_0\ : STD_LOGIC;
  signal \counters[6][28]_i_2_n_0\ : STD_LOGIC;
  signal \counters[6][28]_i_3_n_0\ : STD_LOGIC;
  signal \counters[6][28]_i_4_n_0\ : STD_LOGIC;
  signal \counters[6][28]_i_5_n_0\ : STD_LOGIC;
  signal \counters[6][30]_i_1_n_0\ : STD_LOGIC;
  signal \counters[6][30]_i_3_n_0\ : STD_LOGIC;
  signal \counters[6][30]_i_4_n_0\ : STD_LOGIC;
  signal \counters[6][4]_i_2_n_0\ : STD_LOGIC;
  signal \counters[6][4]_i_3_n_0\ : STD_LOGIC;
  signal \counters[6][4]_i_4_n_0\ : STD_LOGIC;
  signal \counters[6][4]_i_5_n_0\ : STD_LOGIC;
  signal \counters[6][8]_i_2_n_0\ : STD_LOGIC;
  signal \counters[6][8]_i_3_n_0\ : STD_LOGIC;
  signal \counters[6][8]_i_4_n_0\ : STD_LOGIC;
  signal \counters[6][8]_i_5_n_0\ : STD_LOGIC;
  signal \counters[7]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counters[7][0]_i_2_n_0\ : STD_LOGIC;
  signal \counters[7][0]_i_3_n_0\ : STD_LOGIC;
  signal \counters[7][0]_i_4_n_0\ : STD_LOGIC;
  signal \counters[7][0]_i_5_n_0\ : STD_LOGIC;
  signal \counters[7][0]_i_6_n_0\ : STD_LOGIC;
  signal \counters[7][0]_i_7_n_0\ : STD_LOGIC;
  signal \counters[7][12]_i_2_n_0\ : STD_LOGIC;
  signal \counters[7][12]_i_3_n_0\ : STD_LOGIC;
  signal \counters[7][12]_i_4_n_0\ : STD_LOGIC;
  signal \counters[7][12]_i_5_n_0\ : STD_LOGIC;
  signal \counters[7][16]_i_2_n_0\ : STD_LOGIC;
  signal \counters[7][16]_i_3_n_0\ : STD_LOGIC;
  signal \counters[7][16]_i_4_n_0\ : STD_LOGIC;
  signal \counters[7][16]_i_5_n_0\ : STD_LOGIC;
  signal \counters[7][20]_i_2_n_0\ : STD_LOGIC;
  signal \counters[7][20]_i_3_n_0\ : STD_LOGIC;
  signal \counters[7][20]_i_4_n_0\ : STD_LOGIC;
  signal \counters[7][20]_i_5_n_0\ : STD_LOGIC;
  signal \counters[7][24]_i_2_n_0\ : STD_LOGIC;
  signal \counters[7][24]_i_3_n_0\ : STD_LOGIC;
  signal \counters[7][24]_i_4_n_0\ : STD_LOGIC;
  signal \counters[7][24]_i_5_n_0\ : STD_LOGIC;
  signal \counters[7][28]_i_2_n_0\ : STD_LOGIC;
  signal \counters[7][28]_i_3_n_0\ : STD_LOGIC;
  signal \counters[7][28]_i_4_n_0\ : STD_LOGIC;
  signal \counters[7][28]_i_5_n_0\ : STD_LOGIC;
  signal \counters[7][30]_i_1_n_0\ : STD_LOGIC;
  signal \counters[7][30]_i_3_n_0\ : STD_LOGIC;
  signal \counters[7][30]_i_4_n_0\ : STD_LOGIC;
  signal \counters[7][4]_i_2_n_0\ : STD_LOGIC;
  signal \counters[7][4]_i_3_n_0\ : STD_LOGIC;
  signal \counters[7][4]_i_4_n_0\ : STD_LOGIC;
  signal \counters[7][4]_i_5_n_0\ : STD_LOGIC;
  signal \counters[7][8]_i_2_n_0\ : STD_LOGIC;
  signal \counters[7][8]_i_3_n_0\ : STD_LOGIC;
  signal \counters[7][8]_i_4_n_0\ : STD_LOGIC;
  signal \counters[7][8]_i_5_n_0\ : STD_LOGIC;
  signal \counters_reg[0][12]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[0][12]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[0][12]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[0][12]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[0][16]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[0][16]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[0][16]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[0][16]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[0][20]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[0][20]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[0][20]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[0][20]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[0][24]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[0][24]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[0][24]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[0][24]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[0][28]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[0][28]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[0][28]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[0][28]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[0][30]_i_2_n_3\ : STD_LOGIC;
  signal \counters_reg[0][4]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[0][4]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[0][4]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[0][4]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[0][8]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[0][8]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[0][8]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[0][8]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[0]__0\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \counters_reg[1][12]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[1][12]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[1][12]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[1][12]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[1][12]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[1][12]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[1][12]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[1][12]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[1][16]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[1][16]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[1][16]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[1][16]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[1][16]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[1][16]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[1][16]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[1][16]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[1][20]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[1][20]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[1][20]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[1][20]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[1][20]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[1][20]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[1][20]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[1][20]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[1][24]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[1][24]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[1][24]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[1][24]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[1][24]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[1][24]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[1][24]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[1][24]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[1][28]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[1][28]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[1][28]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[1][28]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[1][28]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[1][28]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[1][28]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[1][28]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[1][30]_i_2_n_3\ : STD_LOGIC;
  signal \counters_reg[1][30]_i_2_n_6\ : STD_LOGIC;
  signal \counters_reg[1][30]_i_2_n_7\ : STD_LOGIC;
  signal \counters_reg[1][4]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[1][4]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[1][4]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[1][4]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[1][4]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[1][4]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[1][4]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[1][4]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[1][8]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[1][8]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[1][8]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[1][8]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[1][8]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[1][8]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[1][8]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[1][8]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[1]__0\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \counters_reg[2][12]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[2][12]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[2][12]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[2][12]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[2][12]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[2][12]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[2][12]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[2][12]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[2][16]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[2][16]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[2][16]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[2][16]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[2][16]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[2][16]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[2][16]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[2][16]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[2][20]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[2][20]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[2][20]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[2][20]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[2][20]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[2][20]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[2][20]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[2][20]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[2][24]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[2][24]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[2][24]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[2][24]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[2][24]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[2][24]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[2][24]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[2][24]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[2][28]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[2][28]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[2][28]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[2][28]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[2][28]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[2][28]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[2][28]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[2][28]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[2][30]_i_2_n_3\ : STD_LOGIC;
  signal \counters_reg[2][30]_i_2_n_6\ : STD_LOGIC;
  signal \counters_reg[2][30]_i_2_n_7\ : STD_LOGIC;
  signal \counters_reg[2][4]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[2][4]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[2][4]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[2][4]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[2][4]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[2][4]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[2][4]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[2][4]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[2][8]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[2][8]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[2][8]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[2][8]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[2][8]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[2][8]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[2][8]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[2][8]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[2]__0\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \counters_reg[3][12]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[3][12]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[3][12]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[3][12]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[3][12]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[3][12]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[3][12]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[3][12]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[3][16]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[3][16]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[3][16]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[3][16]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[3][16]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[3][16]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[3][16]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[3][16]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[3][20]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[3][20]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[3][20]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[3][20]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[3][20]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[3][20]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[3][20]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[3][20]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[3][24]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[3][24]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[3][24]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[3][24]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[3][24]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[3][24]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[3][24]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[3][24]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[3][28]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[3][28]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[3][28]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[3][28]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[3][28]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[3][28]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[3][28]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[3][28]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[3][30]_i_2_n_3\ : STD_LOGIC;
  signal \counters_reg[3][30]_i_2_n_6\ : STD_LOGIC;
  signal \counters_reg[3][30]_i_2_n_7\ : STD_LOGIC;
  signal \counters_reg[3][4]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[3][4]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[3][4]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[3][4]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[3][4]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[3][4]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[3][4]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[3][4]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[3][8]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[3][8]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[3][8]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[3][8]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[3][8]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[3][8]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[3][8]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[3][8]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[3]__0\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \counters_reg[4][12]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[4][12]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[4][12]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[4][12]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[4][12]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[4][12]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[4][12]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[4][12]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[4][16]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[4][16]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[4][16]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[4][16]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[4][16]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[4][16]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[4][16]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[4][16]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[4][20]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[4][20]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[4][20]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[4][20]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[4][20]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[4][20]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[4][20]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[4][20]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[4][24]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[4][24]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[4][24]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[4][24]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[4][24]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[4][24]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[4][24]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[4][24]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[4][28]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[4][28]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[4][28]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[4][28]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[4][28]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[4][28]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[4][28]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[4][28]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[4][30]_i_2_n_3\ : STD_LOGIC;
  signal \counters_reg[4][30]_i_2_n_6\ : STD_LOGIC;
  signal \counters_reg[4][30]_i_2_n_7\ : STD_LOGIC;
  signal \counters_reg[4][4]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[4][4]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[4][4]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[4][4]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[4][4]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[4][4]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[4][4]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[4][4]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[4][8]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[4][8]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[4][8]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[4][8]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[4][8]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[4][8]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[4][8]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[4][8]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[4]__0\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \counters_reg[5][12]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[5][12]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[5][12]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[5][12]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[5][12]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[5][12]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[5][12]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[5][12]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[5][16]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[5][16]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[5][16]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[5][16]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[5][16]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[5][16]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[5][16]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[5][16]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[5][20]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[5][20]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[5][20]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[5][20]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[5][20]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[5][20]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[5][20]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[5][20]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[5][24]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[5][24]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[5][24]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[5][24]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[5][24]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[5][24]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[5][24]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[5][24]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[5][28]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[5][28]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[5][28]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[5][28]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[5][28]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[5][28]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[5][28]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[5][28]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[5][30]_i_2_n_3\ : STD_LOGIC;
  signal \counters_reg[5][30]_i_2_n_6\ : STD_LOGIC;
  signal \counters_reg[5][30]_i_2_n_7\ : STD_LOGIC;
  signal \counters_reg[5][4]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[5][4]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[5][4]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[5][4]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[5][4]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[5][4]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[5][4]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[5][4]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[5][8]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[5][8]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[5][8]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[5][8]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[5][8]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[5][8]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[5][8]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[5][8]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[5]__0\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \counters_reg[6][12]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[6][12]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[6][12]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[6][12]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[6][12]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[6][12]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[6][12]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[6][12]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[6][16]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[6][16]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[6][16]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[6][16]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[6][16]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[6][16]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[6][16]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[6][16]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[6][20]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[6][20]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[6][20]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[6][20]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[6][20]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[6][20]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[6][20]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[6][20]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[6][24]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[6][24]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[6][24]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[6][24]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[6][24]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[6][24]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[6][24]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[6][24]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[6][28]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[6][28]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[6][28]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[6][28]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[6][28]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[6][28]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[6][28]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[6][28]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[6][30]_i_2_n_3\ : STD_LOGIC;
  signal \counters_reg[6][30]_i_2_n_6\ : STD_LOGIC;
  signal \counters_reg[6][30]_i_2_n_7\ : STD_LOGIC;
  signal \counters_reg[6][4]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[6][4]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[6][4]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[6][4]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[6][4]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[6][4]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[6][4]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[6][4]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[6][8]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[6][8]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[6][8]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[6][8]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[6][8]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[6][8]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[6][8]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[6][8]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[6]__0\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \counters_reg[7][12]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[7][12]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[7][12]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[7][12]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[7][12]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[7][12]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[7][12]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[7][12]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[7][16]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[7][16]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[7][16]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[7][16]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[7][16]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[7][16]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[7][16]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[7][16]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[7][20]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[7][20]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[7][20]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[7][20]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[7][20]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[7][20]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[7][20]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[7][20]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[7][24]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[7][24]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[7][24]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[7][24]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[7][24]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[7][24]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[7][24]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[7][24]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[7][28]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[7][28]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[7][28]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[7][28]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[7][28]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[7][28]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[7][28]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[7][28]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[7][30]_i_2_n_3\ : STD_LOGIC;
  signal \counters_reg[7][30]_i_2_n_6\ : STD_LOGIC;
  signal \counters_reg[7][30]_i_2_n_7\ : STD_LOGIC;
  signal \counters_reg[7][4]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[7][4]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[7][4]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[7][4]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[7][4]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[7][4]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[7][4]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[7][4]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[7][8]_i_1_n_0\ : STD_LOGIC;
  signal \counters_reg[7][8]_i_1_n_1\ : STD_LOGIC;
  signal \counters_reg[7][8]_i_1_n_2\ : STD_LOGIC;
  signal \counters_reg[7][8]_i_1_n_3\ : STD_LOGIC;
  signal \counters_reg[7][8]_i_1_n_4\ : STD_LOGIC;
  signal \counters_reg[7][8]_i_1_n_5\ : STD_LOGIC;
  signal \counters_reg[7][8]_i_1_n_6\ : STD_LOGIC;
  signal \counters_reg[7][8]_i_1_n_7\ : STD_LOGIC;
  signal \counters_reg[7]__0\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 30 downto 1 );
  signal led_output_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal pwm_values : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal pwm_values0 : STD_LOGIC;
  signal \pwm_values[0]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_values[0]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_values[0]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_values[0]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_values[0]_i_6_n_0\ : STD_LOGIC;
  signal \pwm_values[0]_i_7_n_0\ : STD_LOGIC;
  signal \pwm_values[1]_i_10_n_0\ : STD_LOGIC;
  signal \pwm_values[1]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_values[1]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_values[1]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_values[1]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_values[1]_i_6_n_0\ : STD_LOGIC;
  signal \pwm_values[1]_i_7_n_0\ : STD_LOGIC;
  signal \pwm_values[1]_i_8_n_0\ : STD_LOGIC;
  signal \pwm_values[1]_i_9_n_0\ : STD_LOGIC;
  signal \pwm_values[2]_i_10_n_0\ : STD_LOGIC;
  signal \pwm_values[2]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_values[2]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_values[2]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_values[2]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_values[2]_i_6_n_0\ : STD_LOGIC;
  signal \pwm_values[2]_i_7_n_0\ : STD_LOGIC;
  signal \pwm_values[2]_i_8_n_0\ : STD_LOGIC;
  signal \pwm_values[2]_i_9_n_0\ : STD_LOGIC;
  signal \pwm_values[3]_i_10_n_0\ : STD_LOGIC;
  signal \pwm_values[3]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_values[3]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_values[3]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_values[3]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_values[3]_i_6_n_0\ : STD_LOGIC;
  signal \pwm_values[3]_i_7_n_0\ : STD_LOGIC;
  signal \pwm_values[3]_i_8_n_0\ : STD_LOGIC;
  signal \pwm_values[3]_i_9_n_0\ : STD_LOGIC;
  signal \pwm_values[4]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_values[4]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_values[4]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_values[4]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_values[4]_i_6_n_0\ : STD_LOGIC;
  signal \pwm_values[4]_i_7_n_0\ : STD_LOGIC;
  signal \pwm_values[4]_i_8_n_0\ : STD_LOGIC;
  signal \pwm_values[5]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_values[5]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_values[5]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_values[5]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_values[5]_i_6_n_0\ : STD_LOGIC;
  signal \pwm_values[5]_i_7_n_0\ : STD_LOGIC;
  signal \pwm_values[5]_i_8_n_0\ : STD_LOGIC;
  signal \pwm_values[5]_i_9_n_0\ : STD_LOGIC;
  signal \pwm_values[6]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_values[6]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_values[6]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_values[6]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_values[6]_i_6_n_0\ : STD_LOGIC;
  signal \pwm_values[6]_i_7_n_0\ : STD_LOGIC;
  signal \pwm_values[7]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_values[7]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_values[7]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_values[7]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_values[7]_i_6_n_0\ : STD_LOGIC;
  signal \pwm_values[7]_i_7_n_0\ : STD_LOGIC;
  signal \NLW_counters_reg[0][30]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counters_reg[0][30]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counters_reg[1][30]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counters_reg[1][30]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counters_reg[2][30]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counters_reg[2][30]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counters_reg[3][30]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counters_reg[3][30]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counters_reg[4][30]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counters_reg[4][30]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counters_reg[5][30]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counters_reg[5][30]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counters_reg[6][30]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counters_reg[6][30]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counters_reg[7][30]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counters_reg[7][30]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counters[0][0]_i_6\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counters[0][0]_i_7\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counters[1][0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \counters[1][30]_i_10\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \counters[1][30]_i_12\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \counters[1][30]_i_6\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counters[1][30]_i_9\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \counters[2][0]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counters[3][0]_i_5\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \counters[3][0]_i_8\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counters[4][0]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counters[6][0]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \counters[7][0]_i_6\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \pwm_values[0]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \pwm_values[0]_i_6\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \pwm_values[1]_i_10\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \pwm_values[1]_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \pwm_values[1]_i_7\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \pwm_values[2]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \pwm_values[2]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \pwm_values[2]_i_6\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \pwm_values[2]_i_8\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \pwm_values[2]_i_9\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \pwm_values[3]_i_10\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \pwm_values[3]_i_8\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \pwm_values[4]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pwm_values[4]_i_6\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pwm_values[4]_i_7\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \pwm_values[5]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \pwm_values[5]_i_8\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \pwm_values[6]_i_6\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \pwm_values[7]_i_6\ : label is "soft_lutpair6";
begin
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
\counters[0][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFE"
    )
        port map (
      I0 => \counters[0][0]_i_2_n_0\,
      I1 => \counters[0][0]_i_3_n_0\,
      I2 => \counters[0][0]_i_4_n_0\,
      I3 => \counters[0][0]_i_5_n_0\,
      I4 => \counters[0][0]_i_6_n_0\,
      I5 => \counters_reg[0]__0\(0),
      O => \counters[0]\(0)
    );
\counters[0][0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDFFF"
    )
        port map (
      I0 => \counters_reg[0]__0\(11),
      I1 => \counters_reg[0]__0\(28),
      I2 => \counters_reg[0]__0\(29),
      I3 => \counters_reg[0]__0\(19),
      I4 => \counters_reg[0]__0\(15),
      O => \counters[0][0]_i_2_n_0\
    );
\counters[0][0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \counters_reg[0]__0\(18),
      I1 => \counters_reg[0]__0\(17),
      I2 => \counters_reg[0]__0\(16),
      O => \counters[0][0]_i_3_n_0\
    );
\counters[0][0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \counters_reg[0]__0\(24),
      I1 => \counters_reg[0]__0\(23),
      I2 => \counters_reg[0]__0\(26),
      I3 => \counters_reg[0]__0\(25),
      O => \counters[0][0]_i_4_n_0\
    );
\counters[0][0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => \counters_reg[0]__0\(22),
      I1 => \counters_reg[0]__0\(27),
      I2 => \counters_reg[0]__0\(20),
      I3 => \counters_reg[0]__0\(21),
      I4 => \counters[0][0]_i_7_n_0\,
      O => \counters[0][0]_i_5_n_0\
    );
\counters[0][0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \counters[0][0]_i_8_n_0\,
      I1 => \counters_reg[0]__0\(6),
      I2 => \counters_reg[0]__0\(7),
      I3 => \counters_reg[0]__0\(4),
      I4 => \counters_reg[0]__0\(5),
      O => \counters[0][0]_i_6_n_0\
    );
\counters[0][0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \counters_reg[0]__0\(14),
      I1 => \counters_reg[0]__0\(30),
      I2 => \counters_reg[0]__0\(12),
      I3 => \counters_reg[0]__0\(13),
      I4 => \counters_reg[0]__0\(10),
      O => \counters[0][0]_i_7_n_0\
    );
\counters[0][0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \counters_reg[0]__0\(1),
      I1 => \counters_reg[0]__0\(8),
      I2 => \counters_reg[0]__0\(9),
      I3 => \counters_reg[0]__0\(3),
      I4 => \counters_reg[0]__0\(2),
      O => \counters[0][0]_i_8_n_0\
    );
\counters[0][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(12),
      O => \counters[0][12]_i_2_n_0\
    );
\counters[0][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(11),
      O => \counters[0][12]_i_3_n_0\
    );
\counters[0][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(10),
      O => \counters[0][12]_i_4_n_0\
    );
\counters[0][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(9),
      O => \counters[0][12]_i_5_n_0\
    );
\counters[0][16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(16),
      O => \counters[0][16]_i_2_n_0\
    );
\counters[0][16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(15),
      O => \counters[0][16]_i_3_n_0\
    );
\counters[0][16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(14),
      O => \counters[0][16]_i_4_n_0\
    );
\counters[0][16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(13),
      O => \counters[0][16]_i_5_n_0\
    );
\counters[0][20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(20),
      O => \counters[0][20]_i_2_n_0\
    );
\counters[0][20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(19),
      O => \counters[0][20]_i_3_n_0\
    );
\counters[0][20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(18),
      O => \counters[0][20]_i_4_n_0\
    );
\counters[0][20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(17),
      O => \counters[0][20]_i_5_n_0\
    );
\counters[0][24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(24),
      O => \counters[0][24]_i_2_n_0\
    );
\counters[0][24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(23),
      O => \counters[0][24]_i_3_n_0\
    );
\counters[0][24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(22),
      O => \counters[0][24]_i_4_n_0\
    );
\counters[0][24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(21),
      O => \counters[0][24]_i_5_n_0\
    );
\counters[0][28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(28),
      O => \counters[0][28]_i_2_n_0\
    );
\counters[0][28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(27),
      O => \counters[0][28]_i_3_n_0\
    );
\counters[0][28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(26),
      O => \counters[0][28]_i_4_n_0\
    );
\counters[0][28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(25),
      O => \counters[0][28]_i_5_n_0\
    );
\counters[0][30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \counters[0][0]_i_2_n_0\,
      I1 => \counters[0][0]_i_3_n_0\,
      I2 => \counters[0][0]_i_4_n_0\,
      I3 => \counters[0][0]_i_5_n_0\,
      I4 => \counters[0][0]_i_6_n_0\,
      I5 => \counters_reg[0]__0\(0),
      O => \counters[0][30]_i_1_n_0\
    );
\counters[0][30]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(30),
      O => \counters[0][30]_i_3_n_0\
    );
\counters[0][30]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(29),
      O => \counters[0][30]_i_4_n_0\
    );
\counters[0][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(4),
      O => \counters[0][4]_i_2_n_0\
    );
\counters[0][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(3),
      O => \counters[0][4]_i_3_n_0\
    );
\counters[0][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(2),
      O => \counters[0][4]_i_4_n_0\
    );
\counters[0][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(1),
      O => \counters[0][4]_i_5_n_0\
    );
\counters[0][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(8),
      O => \counters[0][8]_i_2_n_0\
    );
\counters[0][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(7),
      O => \counters[0][8]_i_3_n_0\
    );
\counters[0][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(6),
      O => \counters[0][8]_i_4_n_0\
    );
\counters[0][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[0]__0\(5),
      O => \counters[0][8]_i_5_n_0\
    );
\counters[1][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counters_reg[1]__0\(0),
      O => \counters[1][0]_i_1_n_0\
    );
\counters[1][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(12),
      O => \counters[1][12]_i_2_n_0\
    );
\counters[1][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(11),
      O => \counters[1][12]_i_3_n_0\
    );
\counters[1][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(10),
      O => \counters[1][12]_i_4_n_0\
    );
\counters[1][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(9),
      O => \counters[1][12]_i_5_n_0\
    );
\counters[1][16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(16),
      O => \counters[1][16]_i_2_n_0\
    );
\counters[1][16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(15),
      O => \counters[1][16]_i_3_n_0\
    );
\counters[1][16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(14),
      O => \counters[1][16]_i_4_n_0\
    );
\counters[1][16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(13),
      O => \counters[1][16]_i_5_n_0\
    );
\counters[1][20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(20),
      O => \counters[1][20]_i_2_n_0\
    );
\counters[1][20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(19),
      O => \counters[1][20]_i_3_n_0\
    );
\counters[1][20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(18),
      O => \counters[1][20]_i_4_n_0\
    );
\counters[1][20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(17),
      O => \counters[1][20]_i_5_n_0\
    );
\counters[1][24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(24),
      O => \counters[1][24]_i_2_n_0\
    );
\counters[1][24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(23),
      O => \counters[1][24]_i_3_n_0\
    );
\counters[1][24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(22),
      O => \counters[1][24]_i_4_n_0\
    );
\counters[1][24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(21),
      O => \counters[1][24]_i_5_n_0\
    );
\counters[1][28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(28),
      O => \counters[1][28]_i_2_n_0\
    );
\counters[1][28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(27),
      O => \counters[1][28]_i_3_n_0\
    );
\counters[1][28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(26),
      O => \counters[1][28]_i_4_n_0\
    );
\counters[1][28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(25),
      O => \counters[1][28]_i_5_n_0\
    );
\counters[1][30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \counters[1][30]_i_3_n_0\,
      I1 => \counters[1][30]_i_4_n_0\,
      I2 => \counters[1][30]_i_5_n_0\,
      I3 => \counters[1][30]_i_6_n_0\,
      O => \counters[1][30]_i_1_n_0\
    );
\counters[1][30]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \counters_reg[1]__0\(24),
      I1 => \counters_reg[1]__0\(17),
      I2 => \counters_reg[1]__0\(22),
      I3 => \counters_reg[1]__0\(25),
      O => \counters[1][30]_i_10_n_0\
    );
\counters[1][30]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \counters_reg[1]__0\(19),
      I1 => \counters_reg[1]__0\(20),
      I2 => \counters_reg[1]__0\(29),
      I3 => \counters_reg[1]__0\(14),
      O => \counters[1][30]_i_11_n_0\
    );
\counters[1][30]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \counters_reg[1]__0\(1),
      I1 => \counters_reg[1]__0\(0),
      I2 => \counters_reg[1]__0\(3),
      I3 => \counters_reg[1]__0\(2),
      O => \counters[1][30]_i_12_n_0\
    );
\counters[1][30]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \counters_reg[1]__0\(26),
      I1 => \counters_reg[1]__0\(15),
      I2 => \counters_reg[1]__0\(7),
      I3 => \counters_reg[1]__0\(28),
      I4 => \counters[1][30]_i_9_n_0\,
      O => \counters[1][30]_i_3_n_0\
    );
\counters[1][30]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \counters_reg[1]__0\(10),
      I1 => \counters_reg[1]__0\(23),
      I2 => \counters_reg[1]__0\(11),
      I3 => \counters_reg[1]__0\(18),
      I4 => \counters[1][30]_i_10_n_0\,
      O => \counters[1][30]_i_4_n_0\
    );
\counters[1][30]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \counters_reg[1]__0\(9),
      I1 => \counters_reg[1]__0\(13),
      I2 => \counters_reg[1]__0\(27),
      I3 => \counters_reg[1]__0\(21),
      I4 => \counters[1][30]_i_11_n_0\,
      O => \counters[1][30]_i_5_n_0\
    );
\counters[1][30]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \counters[1][30]_i_12_n_0\,
      I1 => \counters_reg[1]__0\(4),
      I2 => \counters_reg[1]__0\(6),
      I3 => \counters_reg[1]__0\(5),
      O => \counters[1][30]_i_6_n_0\
    );
\counters[1][30]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(30),
      O => \counters[1][30]_i_7_n_0\
    );
\counters[1][30]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(29),
      O => \counters[1][30]_i_8_n_0\
    );
\counters[1][30]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \counters_reg[1]__0\(8),
      I1 => \counters_reg[1]__0\(16),
      I2 => \counters_reg[1]__0\(30),
      I3 => \counters_reg[1]__0\(12),
      O => \counters[1][30]_i_9_n_0\
    );
\counters[1][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(4),
      O => \counters[1][4]_i_2_n_0\
    );
\counters[1][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(3),
      O => \counters[1][4]_i_3_n_0\
    );
\counters[1][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(2),
      O => \counters[1][4]_i_4_n_0\
    );
\counters[1][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(1),
      O => \counters[1][4]_i_5_n_0\
    );
\counters[1][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(8),
      O => \counters[1][8]_i_2_n_0\
    );
\counters[1][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(7),
      O => \counters[1][8]_i_3_n_0\
    );
\counters[1][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(6),
      O => \counters[1][8]_i_4_n_0\
    );
\counters[1][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[1]__0\(5),
      O => \counters[1][8]_i_5_n_0\
    );
\counters[2][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => \counters[2][0]_i_2_n_0\,
      I1 => \counters[2][0]_i_3_n_0\,
      I2 => \counters[2][0]_i_4_n_0\,
      I3 => \counters[2][0]_i_5_n_0\,
      I4 => \counters_reg[2]__0\(0),
      O => \counters[2]\(0)
    );
\counters[2][0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters[2][0]_i_6_n_0\,
      I1 => \counters_reg[2]__0\(11),
      I2 => \counters_reg[2]__0\(12),
      I3 => \counters_reg[2]__0\(8),
      O => \counters[2][0]_i_2_n_0\
    );
\counters[2][0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters[2][0]_i_7_n_0\,
      I1 => \counters_reg[2]__0\(1),
      I2 => \counters_reg[2]__0\(6),
      I3 => \counters_reg[2]__0\(7),
      O => \counters[2][0]_i_3_n_0\
    );
\counters[2][0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \counters_reg[2]__0\(9),
      I1 => \counters_reg[2]__0\(28),
      I2 => \counters_reg[2]__0\(29),
      I3 => \counters_reg[2]__0\(22),
      I4 => \counters_reg[2]__0\(23),
      I5 => \counters_reg[2]__0\(24),
      O => \counters[2][0]_i_4_n_0\
    );
\counters[2][0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => \counters_reg[2]__0\(15),
      I1 => \counters_reg[2]__0\(14),
      I2 => \counters_reg[2]__0\(13),
      I3 => \counters_reg[2]__0\(10),
      I4 => \counters[2][0]_i_8_n_0\,
      O => \counters[2][0]_i_5_n_0\
    );
\counters[2][0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \counters_reg[2]__0\(18),
      I1 => \counters_reg[2]__0\(19),
      I2 => \counters_reg[2]__0\(20),
      I3 => \counters_reg[2]__0\(26),
      I4 => \counters_reg[2]__0\(27),
      I5 => \counters_reg[2]__0\(30),
      O => \counters[2][0]_i_6_n_0\
    );
\counters[2][0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters_reg[2]__0\(3),
      I1 => \counters_reg[2]__0\(2),
      I2 => \counters_reg[2]__0\(5),
      I3 => \counters_reg[2]__0\(4),
      O => \counters[2][0]_i_7_n_0\
    );
\counters[2][0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \counters_reg[2]__0\(17),
      I1 => \counters_reg[2]__0\(16),
      I2 => \counters_reg[2]__0\(25),
      I3 => \counters_reg[2]__0\(21),
      O => \counters[2][0]_i_8_n_0\
    );
\counters[2][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(12),
      O => \counters[2][12]_i_2_n_0\
    );
\counters[2][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(11),
      O => \counters[2][12]_i_3_n_0\
    );
\counters[2][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(10),
      O => \counters[2][12]_i_4_n_0\
    );
\counters[2][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(9),
      O => \counters[2][12]_i_5_n_0\
    );
\counters[2][16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(16),
      O => \counters[2][16]_i_2_n_0\
    );
\counters[2][16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(15),
      O => \counters[2][16]_i_3_n_0\
    );
\counters[2][16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(14),
      O => \counters[2][16]_i_4_n_0\
    );
\counters[2][16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(13),
      O => \counters[2][16]_i_5_n_0\
    );
\counters[2][20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(20),
      O => \counters[2][20]_i_2_n_0\
    );
\counters[2][20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(19),
      O => \counters[2][20]_i_3_n_0\
    );
\counters[2][20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(18),
      O => \counters[2][20]_i_4_n_0\
    );
\counters[2][20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(17),
      O => \counters[2][20]_i_5_n_0\
    );
\counters[2][24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(24),
      O => \counters[2][24]_i_2_n_0\
    );
\counters[2][24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(23),
      O => \counters[2][24]_i_3_n_0\
    );
\counters[2][24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(22),
      O => \counters[2][24]_i_4_n_0\
    );
\counters[2][24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(21),
      O => \counters[2][24]_i_5_n_0\
    );
\counters[2][28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(28),
      O => \counters[2][28]_i_2_n_0\
    );
\counters[2][28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(27),
      O => \counters[2][28]_i_3_n_0\
    );
\counters[2][28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(26),
      O => \counters[2][28]_i_4_n_0\
    );
\counters[2][28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(25),
      O => \counters[2][28]_i_5_n_0\
    );
\counters[2][30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counters[2][0]_i_2_n_0\,
      I1 => \counters[2][0]_i_3_n_0\,
      I2 => \counters[2][0]_i_4_n_0\,
      I3 => \counters[2][0]_i_5_n_0\,
      I4 => \counters_reg[2]__0\(0),
      O => \counters[2][30]_i_1_n_0\
    );
\counters[2][30]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(30),
      O => \counters[2][30]_i_3_n_0\
    );
\counters[2][30]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(29),
      O => \counters[2][30]_i_4_n_0\
    );
\counters[2][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(4),
      O => \counters[2][4]_i_2_n_0\
    );
\counters[2][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(3),
      O => \counters[2][4]_i_3_n_0\
    );
\counters[2][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(2),
      O => \counters[2][4]_i_4_n_0\
    );
\counters[2][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(1),
      O => \counters[2][4]_i_5_n_0\
    );
\counters[2][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(8),
      O => \counters[2][8]_i_2_n_0\
    );
\counters[2][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(7),
      O => \counters[2][8]_i_3_n_0\
    );
\counters[2][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(6),
      O => \counters[2][8]_i_4_n_0\
    );
\counters[2][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[2]__0\(5),
      O => \counters[2][8]_i_5_n_0\
    );
\counters[3][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
        port map (
      I0 => \counters[3][0]_i_2_n_0\,
      I1 => \counters[3][0]_i_3_n_0\,
      I2 => \counters[3][0]_i_4_n_0\,
      I3 => \counters_reg[3]__0\(0),
      O => \counters[3]\(0)
    );
\counters[3][0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => \counters_reg[3]__0\(17),
      I1 => \counters_reg[3]__0\(16),
      I2 => \counters_reg[3]__0\(15),
      I3 => \counters_reg[3]__0\(14),
      I4 => \counters[3][0]_i_5_n_0\,
      O => \counters[3][0]_i_2_n_0\
    );
\counters[3][0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF7FF"
    )
        port map (
      I0 => \counters_reg[3]__0\(26),
      I1 => \counters_reg[3]__0\(27),
      I2 => \counters_reg[3]__0\(25),
      I3 => \counters_reg[3]__0\(28),
      I4 => \counters_reg[3]__0\(7),
      I5 => \counters[3][0]_i_6_n_0\,
      O => \counters[3][0]_i_3_n_0\
    );
\counters[3][0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFBFFF"
    )
        port map (
      I0 => \counters[3][0]_i_7_n_0\,
      I1 => \counters_reg[3]__0\(10),
      I2 => \counters_reg[3]__0\(8),
      I3 => \counters_reg[3]__0\(13),
      I4 => \counters_reg[3]__0\(12),
      I5 => \counters[3][0]_i_8_n_0\,
      O => \counters[3][0]_i_4_n_0\
    );
\counters[3][0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \counters_reg[3]__0\(19),
      I1 => \counters_reg[3]__0\(18),
      I2 => \counters_reg[3]__0\(24),
      I3 => \counters_reg[3]__0\(21),
      O => \counters[3][0]_i_5_n_0\
    );
\counters[3][0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \counters_reg[3]__0\(22),
      I1 => \counters_reg[3]__0\(23),
      O => \counters[3][0]_i_6_n_0\
    );
\counters[3][0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \counters_reg[3]__0\(5),
      I1 => \counters_reg[3]__0\(6),
      I2 => \counters_reg[3]__0\(3),
      I3 => \counters_reg[3]__0\(4),
      I4 => \counters_reg[3]__0\(2),
      I5 => \counters_reg[3]__0\(1),
      O => \counters[3][0]_i_7_n_0\
    );
\counters[3][0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \counters_reg[3]__0\(11),
      I1 => \counters_reg[3]__0\(30),
      I2 => \counters_reg[3]__0\(29),
      I3 => \counters_reg[3]__0\(20),
      I4 => \counters_reg[3]__0\(9),
      O => \counters[3][0]_i_8_n_0\
    );
\counters[3][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(12),
      O => \counters[3][12]_i_2_n_0\
    );
\counters[3][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(11),
      O => \counters[3][12]_i_3_n_0\
    );
\counters[3][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(10),
      O => \counters[3][12]_i_4_n_0\
    );
\counters[3][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(9),
      O => \counters[3][12]_i_5_n_0\
    );
\counters[3][16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(16),
      O => \counters[3][16]_i_2_n_0\
    );
\counters[3][16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(15),
      O => \counters[3][16]_i_3_n_0\
    );
\counters[3][16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(14),
      O => \counters[3][16]_i_4_n_0\
    );
\counters[3][16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(13),
      O => \counters[3][16]_i_5_n_0\
    );
\counters[3][20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(20),
      O => \counters[3][20]_i_2_n_0\
    );
\counters[3][20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(19),
      O => \counters[3][20]_i_3_n_0\
    );
\counters[3][20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(18),
      O => \counters[3][20]_i_4_n_0\
    );
\counters[3][20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(17),
      O => \counters[3][20]_i_5_n_0\
    );
\counters[3][24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(24),
      O => \counters[3][24]_i_2_n_0\
    );
\counters[3][24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(23),
      O => \counters[3][24]_i_3_n_0\
    );
\counters[3][24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(22),
      O => \counters[3][24]_i_4_n_0\
    );
\counters[3][24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(21),
      O => \counters[3][24]_i_5_n_0\
    );
\counters[3][28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(28),
      O => \counters[3][28]_i_2_n_0\
    );
\counters[3][28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(27),
      O => \counters[3][28]_i_3_n_0\
    );
\counters[3][28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(26),
      O => \counters[3][28]_i_4_n_0\
    );
\counters[3][28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(25),
      O => \counters[3][28]_i_5_n_0\
    );
\counters[3][30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \counters[3][0]_i_2_n_0\,
      I1 => \counters[3][0]_i_3_n_0\,
      I2 => \counters[3][0]_i_4_n_0\,
      I3 => \counters_reg[3]__0\(0),
      O => \counters[3][30]_i_1_n_0\
    );
\counters[3][30]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(30),
      O => \counters[3][30]_i_3_n_0\
    );
\counters[3][30]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(29),
      O => \counters[3][30]_i_4_n_0\
    );
\counters[3][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(4),
      O => \counters[3][4]_i_2_n_0\
    );
\counters[3][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(3),
      O => \counters[3][4]_i_3_n_0\
    );
\counters[3][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(2),
      O => \counters[3][4]_i_4_n_0\
    );
\counters[3][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(1),
      O => \counters[3][4]_i_5_n_0\
    );
\counters[3][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(8),
      O => \counters[3][8]_i_2_n_0\
    );
\counters[3][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(7),
      O => \counters[3][8]_i_3_n_0\
    );
\counters[3][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(6),
      O => \counters[3][8]_i_4_n_0\
    );
\counters[3][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[3]__0\(5),
      O => \counters[3][8]_i_5_n_0\
    );
\counters[4][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => \counters[4][0]_i_2_n_0\,
      I1 => \counters[4][0]_i_3_n_0\,
      I2 => \counters[4][0]_i_4_n_0\,
      I3 => \counters[4][0]_i_5_n_0\,
      I4 => \counters_reg[4]__0\(0),
      O => \counters[4]\(0)
    );
\counters[4][0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBFFF"
    )
        port map (
      I0 => \counters[4][0]_i_6_n_0\,
      I1 => \counters_reg[4]__0\(17),
      I2 => \counters_reg[4]__0\(16),
      I3 => \counters_reg[4]__0\(15),
      I4 => \counters[4][0]_i_7_n_0\,
      O => \counters[4][0]_i_2_n_0\
    );
\counters[4][0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \counters_reg[4]__0\(3),
      I1 => \counters_reg[4]__0\(4),
      I2 => \counters_reg[4]__0\(1),
      I3 => \counters_reg[4]__0\(2),
      I4 => \counters[4][0]_i_8_n_0\,
      O => \counters[4][0]_i_3_n_0\
    );
\counters[4][0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \counters_reg[4]__0\(20),
      I1 => \counters_reg[4]__0\(19),
      I2 => \counters_reg[4]__0\(26),
      I3 => \counters_reg[4]__0\(21),
      O => \counters[4][0]_i_4_n_0\
    );
\counters[4][0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \counters_reg[4]__0\(12),
      I1 => \counters_reg[4]__0\(13),
      I2 => \counters_reg[4]__0\(30),
      I3 => \counters_reg[4]__0\(29),
      I4 => \counters_reg[4]__0\(11),
      I5 => \counters_reg[4]__0\(9),
      O => \counters[4][0]_i_5_n_0\
    );
\counters[4][0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDFFF"
    )
        port map (
      I0 => \counters_reg[4]__0\(10),
      I1 => \counters_reg[4]__0\(27),
      I2 => \counters_reg[4]__0\(28),
      I3 => \counters_reg[4]__0\(18),
      I4 => \counters_reg[4]__0\(14),
      O => \counters[4][0]_i_6_n_0\
    );
\counters[4][0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \counters_reg[4]__0\(23),
      I1 => \counters_reg[4]__0\(22),
      I2 => \counters_reg[4]__0\(25),
      I3 => \counters_reg[4]__0\(24),
      O => \counters[4][0]_i_7_n_0\
    );
\counters[4][0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters_reg[4]__0\(6),
      I1 => \counters_reg[4]__0\(5),
      I2 => \counters_reg[4]__0\(8),
      I3 => \counters_reg[4]__0\(7),
      O => \counters[4][0]_i_8_n_0\
    );
\counters[4][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(12),
      O => \counters[4][12]_i_2_n_0\
    );
\counters[4][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(11),
      O => \counters[4][12]_i_3_n_0\
    );
\counters[4][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(10),
      O => \counters[4][12]_i_4_n_0\
    );
\counters[4][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(9),
      O => \counters[4][12]_i_5_n_0\
    );
\counters[4][16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(16),
      O => \counters[4][16]_i_2_n_0\
    );
\counters[4][16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(15),
      O => \counters[4][16]_i_3_n_0\
    );
\counters[4][16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(14),
      O => \counters[4][16]_i_4_n_0\
    );
\counters[4][16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(13),
      O => \counters[4][16]_i_5_n_0\
    );
\counters[4][20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(20),
      O => \counters[4][20]_i_2_n_0\
    );
\counters[4][20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(19),
      O => \counters[4][20]_i_3_n_0\
    );
\counters[4][20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(18),
      O => \counters[4][20]_i_4_n_0\
    );
\counters[4][20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(17),
      O => \counters[4][20]_i_5_n_0\
    );
\counters[4][24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(24),
      O => \counters[4][24]_i_2_n_0\
    );
\counters[4][24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(23),
      O => \counters[4][24]_i_3_n_0\
    );
\counters[4][24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(22),
      O => \counters[4][24]_i_4_n_0\
    );
\counters[4][24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(21),
      O => \counters[4][24]_i_5_n_0\
    );
\counters[4][28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(28),
      O => \counters[4][28]_i_2_n_0\
    );
\counters[4][28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(27),
      O => \counters[4][28]_i_3_n_0\
    );
\counters[4][28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(26),
      O => \counters[4][28]_i_4_n_0\
    );
\counters[4][28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(25),
      O => \counters[4][28]_i_5_n_0\
    );
\counters[4][30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counters[4][0]_i_2_n_0\,
      I1 => \counters[4][0]_i_3_n_0\,
      I2 => \counters[4][0]_i_4_n_0\,
      I3 => \counters[4][0]_i_5_n_0\,
      I4 => \counters_reg[4]__0\(0),
      O => \counters[4][30]_i_1_n_0\
    );
\counters[4][30]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(30),
      O => \counters[4][30]_i_3_n_0\
    );
\counters[4][30]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(29),
      O => \counters[4][30]_i_4_n_0\
    );
\counters[4][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(4),
      O => \counters[4][4]_i_2_n_0\
    );
\counters[4][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(3),
      O => \counters[4][4]_i_3_n_0\
    );
\counters[4][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(2),
      O => \counters[4][4]_i_4_n_0\
    );
\counters[4][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(1),
      O => \counters[4][4]_i_5_n_0\
    );
\counters[4][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(8),
      O => \counters[4][8]_i_2_n_0\
    );
\counters[4][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(7),
      O => \counters[4][8]_i_3_n_0\
    );
\counters[4][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(6),
      O => \counters[4][8]_i_4_n_0\
    );
\counters[4][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[4]__0\(5),
      O => \counters[4][8]_i_5_n_0\
    );
\counters[5][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFE"
    )
        port map (
      I0 => \counters[5][0]_i_2_n_0\,
      I1 => \counters_reg[5]__0\(7),
      I2 => \counters[5][0]_i_3_n_0\,
      I3 => \counters[5][0]_i_4_n_0\,
      I4 => \counters[5][0]_i_5_n_0\,
      I5 => \counters_reg[5]__0\(0),
      O => \counters[5]\(0)
    );
\counters[5][0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \counters_reg[5]__0\(11),
      I1 => \counters_reg[5]__0\(10),
      I2 => \counters[5][0]_i_6_n_0\,
      I3 => \counters_reg[5]__0\(19),
      I4 => \counters_reg[5]__0\(18),
      I5 => \counters_reg[5]__0\(17),
      O => \counters[5][0]_i_2_n_0\
    );
\counters[5][0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \counters_reg[5]__0\(5),
      I1 => \counters_reg[5]__0\(6),
      I2 => \counters_reg[5]__0\(3),
      I3 => \counters_reg[5]__0\(4),
      I4 => \counters_reg[5]__0\(2),
      I5 => \counters_reg[5]__0\(1),
      O => \counters[5][0]_i_3_n_0\
    );
\counters[5][0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \counters_reg[5]__0\(8),
      I1 => \counters_reg[5]__0\(27),
      I2 => \counters_reg[5]__0\(28),
      I3 => \counters_reg[5]__0\(21),
      I4 => \counters_reg[5]__0\(22),
      I5 => \counters_reg[5]__0\(23),
      O => \counters[5][0]_i_4_n_0\
    );
\counters[5][0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => \counters_reg[5]__0\(14),
      I1 => \counters_reg[5]__0\(13),
      I2 => \counters_reg[5]__0\(12),
      I3 => \counters_reg[5]__0\(9),
      I4 => \counters[5][0]_i_7_n_0\,
      O => \counters[5][0]_i_5_n_0\
    );
\counters[5][0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters_reg[5]__0\(26),
      I1 => \counters_reg[5]__0\(25),
      I2 => \counters_reg[5]__0\(30),
      I3 => \counters_reg[5]__0\(29),
      O => \counters[5][0]_i_6_n_0\
    );
\counters[5][0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \counters_reg[5]__0\(16),
      I1 => \counters_reg[5]__0\(15),
      I2 => \counters_reg[5]__0\(24),
      I3 => \counters_reg[5]__0\(20),
      O => \counters[5][0]_i_7_n_0\
    );
\counters[5][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(12),
      O => \counters[5][12]_i_2_n_0\
    );
\counters[5][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(11),
      O => \counters[5][12]_i_3_n_0\
    );
\counters[5][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(10),
      O => \counters[5][12]_i_4_n_0\
    );
\counters[5][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(9),
      O => \counters[5][12]_i_5_n_0\
    );
\counters[5][16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(16),
      O => \counters[5][16]_i_2_n_0\
    );
\counters[5][16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(15),
      O => \counters[5][16]_i_3_n_0\
    );
\counters[5][16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(14),
      O => \counters[5][16]_i_4_n_0\
    );
\counters[5][16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(13),
      O => \counters[5][16]_i_5_n_0\
    );
\counters[5][20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(20),
      O => \counters[5][20]_i_2_n_0\
    );
\counters[5][20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(19),
      O => \counters[5][20]_i_3_n_0\
    );
\counters[5][20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(18),
      O => \counters[5][20]_i_4_n_0\
    );
\counters[5][20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(17),
      O => \counters[5][20]_i_5_n_0\
    );
\counters[5][24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(24),
      O => \counters[5][24]_i_2_n_0\
    );
\counters[5][24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(23),
      O => \counters[5][24]_i_3_n_0\
    );
\counters[5][24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(22),
      O => \counters[5][24]_i_4_n_0\
    );
\counters[5][24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(21),
      O => \counters[5][24]_i_5_n_0\
    );
\counters[5][28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(28),
      O => \counters[5][28]_i_2_n_0\
    );
\counters[5][28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(27),
      O => \counters[5][28]_i_3_n_0\
    );
\counters[5][28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(26),
      O => \counters[5][28]_i_4_n_0\
    );
\counters[5][28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(25),
      O => \counters[5][28]_i_5_n_0\
    );
\counters[5][30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \counters[5][0]_i_2_n_0\,
      I1 => \counters_reg[5]__0\(7),
      I2 => \counters[5][0]_i_3_n_0\,
      I3 => \counters[5][0]_i_4_n_0\,
      I4 => \counters[5][0]_i_5_n_0\,
      I5 => \counters_reg[5]__0\(0),
      O => \counters[5][30]_i_1_n_0\
    );
\counters[5][30]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(30),
      O => \counters[5][30]_i_3_n_0\
    );
\counters[5][30]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(29),
      O => \counters[5][30]_i_4_n_0\
    );
\counters[5][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(4),
      O => \counters[5][4]_i_2_n_0\
    );
\counters[5][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(3),
      O => \counters[5][4]_i_3_n_0\
    );
\counters[5][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(2),
      O => \counters[5][4]_i_4_n_0\
    );
\counters[5][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(1),
      O => \counters[5][4]_i_5_n_0\
    );
\counters[5][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(8),
      O => \counters[5][8]_i_2_n_0\
    );
\counters[5][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(7),
      O => \counters[5][8]_i_3_n_0\
    );
\counters[5][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(6),
      O => \counters[5][8]_i_4_n_0\
    );
\counters[5][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[5]__0\(5),
      O => \counters[5][8]_i_5_n_0\
    );
\counters[6][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFE"
    )
        port map (
      I0 => \counters[6][0]_i_2_n_0\,
      I1 => \counters[6][0]_i_3_n_0\,
      I2 => \counters[6][0]_i_4_n_0\,
      I3 => \counters_reg[6]__0\(8),
      I4 => \counters[6][0]_i_5_n_0\,
      I5 => \counters_reg[6]__0\(0),
      O => \counters[6]\(0)
    );
\counters[6][0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBFFF"
    )
        port map (
      I0 => \counters[6][0]_i_6_n_0\,
      I1 => \counters_reg[6]__0\(16),
      I2 => \counters_reg[6]__0\(15),
      I3 => \counters_reg[6]__0\(14),
      I4 => \counters[6][0]_i_7_n_0\,
      O => \counters[6][0]_i_2_n_0\
    );
\counters[6][0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters[6][0]_i_8_n_0\,
      I1 => \counters_reg[6]__0\(1),
      I2 => \counters_reg[6]__0\(6),
      I3 => \counters_reg[6]__0\(7),
      O => \counters[6][0]_i_3_n_0\
    );
\counters[6][0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \counters_reg[6]__0\(19),
      I1 => \counters_reg[6]__0\(18),
      I2 => \counters_reg[6]__0\(25),
      I3 => \counters_reg[6]__0\(20),
      O => \counters[6][0]_i_4_n_0\
    );
\counters[6][0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \counters_reg[6]__0\(10),
      I1 => \counters_reg[6]__0\(11),
      I2 => \counters_reg[6]__0\(12),
      I3 => \counters_reg[6]__0\(28),
      I4 => \counters_reg[6]__0\(29),
      I5 => \counters_reg[6]__0\(30),
      O => \counters[6][0]_i_5_n_0\
    );
\counters[6][0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDFFF"
    )
        port map (
      I0 => \counters_reg[6]__0\(9),
      I1 => \counters_reg[6]__0\(26),
      I2 => \counters_reg[6]__0\(27),
      I3 => \counters_reg[6]__0\(17),
      I4 => \counters_reg[6]__0\(13),
      O => \counters[6][0]_i_6_n_0\
    );
\counters[6][0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \counters_reg[6]__0\(22),
      I1 => \counters_reg[6]__0\(21),
      I2 => \counters_reg[6]__0\(24),
      I3 => \counters_reg[6]__0\(23),
      O => \counters[6][0]_i_7_n_0\
    );
\counters[6][0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters_reg[6]__0\(3),
      I1 => \counters_reg[6]__0\(2),
      I2 => \counters_reg[6]__0\(5),
      I3 => \counters_reg[6]__0\(4),
      O => \counters[6][0]_i_8_n_0\
    );
\counters[6][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(12),
      O => \counters[6][12]_i_2_n_0\
    );
\counters[6][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(11),
      O => \counters[6][12]_i_3_n_0\
    );
\counters[6][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(10),
      O => \counters[6][12]_i_4_n_0\
    );
\counters[6][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(9),
      O => \counters[6][12]_i_5_n_0\
    );
\counters[6][16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(16),
      O => \counters[6][16]_i_2_n_0\
    );
\counters[6][16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(15),
      O => \counters[6][16]_i_3_n_0\
    );
\counters[6][16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(14),
      O => \counters[6][16]_i_4_n_0\
    );
\counters[6][16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(13),
      O => \counters[6][16]_i_5_n_0\
    );
\counters[6][20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(20),
      O => \counters[6][20]_i_2_n_0\
    );
\counters[6][20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(19),
      O => \counters[6][20]_i_3_n_0\
    );
\counters[6][20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(18),
      O => \counters[6][20]_i_4_n_0\
    );
\counters[6][20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(17),
      O => \counters[6][20]_i_5_n_0\
    );
\counters[6][24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(24),
      O => \counters[6][24]_i_2_n_0\
    );
\counters[6][24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(23),
      O => \counters[6][24]_i_3_n_0\
    );
\counters[6][24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(22),
      O => \counters[6][24]_i_4_n_0\
    );
\counters[6][24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(21),
      O => \counters[6][24]_i_5_n_0\
    );
\counters[6][28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(28),
      O => \counters[6][28]_i_2_n_0\
    );
\counters[6][28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(27),
      O => \counters[6][28]_i_3_n_0\
    );
\counters[6][28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(26),
      O => \counters[6][28]_i_4_n_0\
    );
\counters[6][28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(25),
      O => \counters[6][28]_i_5_n_0\
    );
\counters[6][30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \counters[6][0]_i_2_n_0\,
      I1 => \counters[6][0]_i_3_n_0\,
      I2 => \counters[6][0]_i_4_n_0\,
      I3 => \counters_reg[6]__0\(8),
      I4 => \counters[6][0]_i_5_n_0\,
      I5 => \counters_reg[6]__0\(0),
      O => \counters[6][30]_i_1_n_0\
    );
\counters[6][30]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(30),
      O => \counters[6][30]_i_3_n_0\
    );
\counters[6][30]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(29),
      O => \counters[6][30]_i_4_n_0\
    );
\counters[6][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(4),
      O => \counters[6][4]_i_2_n_0\
    );
\counters[6][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(3),
      O => \counters[6][4]_i_3_n_0\
    );
\counters[6][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(2),
      O => \counters[6][4]_i_4_n_0\
    );
\counters[6][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(1),
      O => \counters[6][4]_i_5_n_0\
    );
\counters[6][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(8),
      O => \counters[6][8]_i_2_n_0\
    );
\counters[6][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(7),
      O => \counters[6][8]_i_3_n_0\
    );
\counters[6][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(6),
      O => \counters[6][8]_i_4_n_0\
    );
\counters[6][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[6]__0\(5),
      O => \counters[6][8]_i_5_n_0\
    );
\counters[7][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFE"
    )
        port map (
      I0 => \counters[7][0]_i_2_n_0\,
      I1 => \counters[7][0]_i_3_n_0\,
      I2 => \counters[7][0]_i_4_n_0\,
      I3 => \counters[7][0]_i_5_n_0\,
      I4 => \counters[7][0]_i_6_n_0\,
      I5 => \counters_reg[7]__0\(0),
      O => \counters[7]\(0)
    );
\counters[7][0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDFFF"
    )
        port map (
      I0 => \counters_reg[7]__0\(8),
      I1 => \counters_reg[7]__0\(25),
      I2 => \counters_reg[7]__0\(26),
      I3 => \counters_reg[7]__0\(16),
      I4 => \counters_reg[7]__0\(12),
      O => \counters[7][0]_i_2_n_0\
    );
\counters[7][0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \counters_reg[7]__0\(15),
      I1 => \counters_reg[7]__0\(14),
      I2 => \counters_reg[7]__0\(13),
      O => \counters[7][0]_i_3_n_0\
    );
\counters[7][0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \counters_reg[7]__0\(21),
      I1 => \counters_reg[7]__0\(20),
      I2 => \counters_reg[7]__0\(23),
      I3 => \counters_reg[7]__0\(22),
      O => \counters[7][0]_i_4_n_0\
    );
\counters[7][0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => \counters_reg[7]__0\(19),
      I1 => \counters_reg[7]__0\(24),
      I2 => \counters_reg[7]__0\(17),
      I3 => \counters_reg[7]__0\(18),
      I4 => \counters[7][0]_i_7_n_0\,
      O => \counters[7][0]_i_5_n_0\
    );
\counters[7][0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \pwm_values[7]_i_4_n_0\,
      I1 => \counters_reg[7]__0\(11),
      I2 => \counters_reg[7]__0\(10),
      I3 => \counters_reg[7]__0\(9),
      I4 => \counters_reg[7]__0\(7),
      O => \counters[7][0]_i_6_n_0\
    );
\counters[7][0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \counters_reg[7]__0\(5),
      I1 => \counters_reg[7]__0\(6),
      I2 => \counters_reg[7]__0\(3),
      I3 => \counters_reg[7]__0\(4),
      I4 => \counters_reg[7]__0\(2),
      I5 => \counters_reg[7]__0\(1),
      O => \counters[7][0]_i_7_n_0\
    );
\counters[7][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(12),
      O => \counters[7][12]_i_2_n_0\
    );
\counters[7][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(11),
      O => \counters[7][12]_i_3_n_0\
    );
\counters[7][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(10),
      O => \counters[7][12]_i_4_n_0\
    );
\counters[7][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(9),
      O => \counters[7][12]_i_5_n_0\
    );
\counters[7][16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(16),
      O => \counters[7][16]_i_2_n_0\
    );
\counters[7][16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(15),
      O => \counters[7][16]_i_3_n_0\
    );
\counters[7][16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(14),
      O => \counters[7][16]_i_4_n_0\
    );
\counters[7][16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(13),
      O => \counters[7][16]_i_5_n_0\
    );
\counters[7][20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(20),
      O => \counters[7][20]_i_2_n_0\
    );
\counters[7][20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(19),
      O => \counters[7][20]_i_3_n_0\
    );
\counters[7][20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(18),
      O => \counters[7][20]_i_4_n_0\
    );
\counters[7][20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(17),
      O => \counters[7][20]_i_5_n_0\
    );
\counters[7][24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(24),
      O => \counters[7][24]_i_2_n_0\
    );
\counters[7][24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(23),
      O => \counters[7][24]_i_3_n_0\
    );
\counters[7][24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(22),
      O => \counters[7][24]_i_4_n_0\
    );
\counters[7][24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(21),
      O => \counters[7][24]_i_5_n_0\
    );
\counters[7][28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(28),
      O => \counters[7][28]_i_2_n_0\
    );
\counters[7][28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(27),
      O => \counters[7][28]_i_3_n_0\
    );
\counters[7][28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(26),
      O => \counters[7][28]_i_4_n_0\
    );
\counters[7][28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(25),
      O => \counters[7][28]_i_5_n_0\
    );
\counters[7][30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \counters[7][0]_i_2_n_0\,
      I1 => \counters[7][0]_i_3_n_0\,
      I2 => \counters[7][0]_i_4_n_0\,
      I3 => \counters[7][0]_i_5_n_0\,
      I4 => \counters[7][0]_i_6_n_0\,
      I5 => \counters_reg[7]__0\(0),
      O => \counters[7][30]_i_1_n_0\
    );
\counters[7][30]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(30),
      O => \counters[7][30]_i_3_n_0\
    );
\counters[7][30]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(29),
      O => \counters[7][30]_i_4_n_0\
    );
\counters[7][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(4),
      O => \counters[7][4]_i_2_n_0\
    );
\counters[7][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(3),
      O => \counters[7][4]_i_3_n_0\
    );
\counters[7][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(2),
      O => \counters[7][4]_i_4_n_0\
    );
\counters[7][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(1),
      O => \counters[7][4]_i_5_n_0\
    );
\counters[7][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(8),
      O => \counters[7][8]_i_2_n_0\
    );
\counters[7][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(7),
      O => \counters[7][8]_i_3_n_0\
    );
\counters[7][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(6),
      O => \counters[7][8]_i_4_n_0\
    );
\counters[7][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counters_reg[7]__0\(5),
      O => \counters[7][8]_i_5_n_0\
    );
\counters_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters[0]\(0),
      Q => \counters_reg[0]__0\(0),
      R => '0'
    );
\counters_reg[0][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(10),
      Q => \counters_reg[0]__0\(10),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(11),
      Q => \counters_reg[0]__0\(11),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(12),
      Q => \counters_reg[0]__0\(12),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[0][8]_i_1_n_0\,
      CO(3) => \counters_reg[0][12]_i_1_n_0\,
      CO(2) => \counters_reg[0][12]_i_1_n_1\,
      CO(1) => \counters_reg[0][12]_i_1_n_2\,
      CO(0) => \counters_reg[0][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3) => \counters[0][12]_i_2_n_0\,
      S(2) => \counters[0][12]_i_3_n_0\,
      S(1) => \counters[0][12]_i_4_n_0\,
      S(0) => \counters[0][12]_i_5_n_0\
    );
\counters_reg[0][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(13),
      Q => \counters_reg[0]__0\(13),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(14),
      Q => \counters_reg[0]__0\(14),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(15),
      Q => \counters_reg[0]__0\(15),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(16),
      Q => \counters_reg[0]__0\(16),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[0][12]_i_1_n_0\,
      CO(3) => \counters_reg[0][16]_i_1_n_0\,
      CO(2) => \counters_reg[0][16]_i_1_n_1\,
      CO(1) => \counters_reg[0][16]_i_1_n_2\,
      CO(0) => \counters_reg[0][16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3) => \counters[0][16]_i_2_n_0\,
      S(2) => \counters[0][16]_i_3_n_0\,
      S(1) => \counters[0][16]_i_4_n_0\,
      S(0) => \counters[0][16]_i_5_n_0\
    );
\counters_reg[0][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(17),
      Q => \counters_reg[0]__0\(17),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(18),
      Q => \counters_reg[0]__0\(18),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(19),
      Q => \counters_reg[0]__0\(19),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(1),
      Q => \counters_reg[0]__0\(1),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(20),
      Q => \counters_reg[0]__0\(20),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[0][16]_i_1_n_0\,
      CO(3) => \counters_reg[0][20]_i_1_n_0\,
      CO(2) => \counters_reg[0][20]_i_1_n_1\,
      CO(1) => \counters_reg[0][20]_i_1_n_2\,
      CO(0) => \counters_reg[0][20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3) => \counters[0][20]_i_2_n_0\,
      S(2) => \counters[0][20]_i_3_n_0\,
      S(1) => \counters[0][20]_i_4_n_0\,
      S(0) => \counters[0][20]_i_5_n_0\
    );
\counters_reg[0][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(21),
      Q => \counters_reg[0]__0\(21),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(22),
      Q => \counters_reg[0]__0\(22),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(23),
      Q => \counters_reg[0]__0\(23),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(24),
      Q => \counters_reg[0]__0\(24),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[0][20]_i_1_n_0\,
      CO(3) => \counters_reg[0][24]_i_1_n_0\,
      CO(2) => \counters_reg[0][24]_i_1_n_1\,
      CO(1) => \counters_reg[0][24]_i_1_n_2\,
      CO(0) => \counters_reg[0][24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3) => \counters[0][24]_i_2_n_0\,
      S(2) => \counters[0][24]_i_3_n_0\,
      S(1) => \counters[0][24]_i_4_n_0\,
      S(0) => \counters[0][24]_i_5_n_0\
    );
\counters_reg[0][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(25),
      Q => \counters_reg[0]__0\(25),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(26),
      Q => \counters_reg[0]__0\(26),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(27),
      Q => \counters_reg[0]__0\(27),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(28),
      Q => \counters_reg[0]__0\(28),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[0][24]_i_1_n_0\,
      CO(3) => \counters_reg[0][28]_i_1_n_0\,
      CO(2) => \counters_reg[0][28]_i_1_n_1\,
      CO(1) => \counters_reg[0][28]_i_1_n_2\,
      CO(0) => \counters_reg[0][28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3) => \counters[0][28]_i_2_n_0\,
      S(2) => \counters[0][28]_i_3_n_0\,
      S(1) => \counters[0][28]_i_4_n_0\,
      S(0) => \counters[0][28]_i_5_n_0\
    );
\counters_reg[0][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(29),
      Q => \counters_reg[0]__0\(29),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(2),
      Q => \counters_reg[0]__0\(2),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(30),
      Q => \counters_reg[0]__0\(30),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][30]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[0][28]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counters_reg[0][30]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counters_reg[0][30]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counters_reg[0][30]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => data0(30 downto 29),
      S(3 downto 2) => B"00",
      S(1) => \counters[0][30]_i_3_n_0\,
      S(0) => \counters[0][30]_i_4_n_0\
    );
\counters_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(3),
      Q => \counters_reg[0]__0\(3),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(4),
      Q => \counters_reg[0]__0\(4),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counters_reg[0][4]_i_1_n_0\,
      CO(2) => \counters_reg[0][4]_i_1_n_1\,
      CO(1) => \counters_reg[0][4]_i_1_n_2\,
      CO(0) => \counters_reg[0][4]_i_1_n_3\,
      CYINIT => \counters_reg[0]__0\(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3) => \counters[0][4]_i_2_n_0\,
      S(2) => \counters[0][4]_i_3_n_0\,
      S(1) => \counters[0][4]_i_4_n_0\,
      S(0) => \counters[0][4]_i_5_n_0\
    );
\counters_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(5),
      Q => \counters_reg[0]__0\(5),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(6),
      Q => \counters_reg[0]__0\(6),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(7),
      Q => \counters_reg[0]__0\(7),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(8),
      Q => \counters_reg[0]__0\(8),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[0][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[0][4]_i_1_n_0\,
      CO(3) => \counters_reg[0][8]_i_1_n_0\,
      CO(2) => \counters_reg[0][8]_i_1_n_1\,
      CO(1) => \counters_reg[0][8]_i_1_n_2\,
      CO(0) => \counters_reg[0][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3) => \counters[0][8]_i_2_n_0\,
      S(2) => \counters[0][8]_i_3_n_0\,
      S(1) => \counters[0][8]_i_4_n_0\,
      S(0) => \counters[0][8]_i_5_n_0\
    );
\counters_reg[0][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => data0(9),
      Q => \counters_reg[0]__0\(9),
      R => \counters[0][30]_i_1_n_0\
    );
\counters_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters[1][0]_i_1_n_0\,
      Q => \counters_reg[1]__0\(0),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][12]_i_1_n_6\,
      Q => \counters_reg[1]__0\(10),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][12]_i_1_n_5\,
      Q => \counters_reg[1]__0\(11),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][12]_i_1_n_4\,
      Q => \counters_reg[1]__0\(12),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[1][8]_i_1_n_0\,
      CO(3) => \counters_reg[1][12]_i_1_n_0\,
      CO(2) => \counters_reg[1][12]_i_1_n_1\,
      CO(1) => \counters_reg[1][12]_i_1_n_2\,
      CO(0) => \counters_reg[1][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[1][12]_i_1_n_4\,
      O(2) => \counters_reg[1][12]_i_1_n_5\,
      O(1) => \counters_reg[1][12]_i_1_n_6\,
      O(0) => \counters_reg[1][12]_i_1_n_7\,
      S(3) => \counters[1][12]_i_2_n_0\,
      S(2) => \counters[1][12]_i_3_n_0\,
      S(1) => \counters[1][12]_i_4_n_0\,
      S(0) => \counters[1][12]_i_5_n_0\
    );
\counters_reg[1][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][16]_i_1_n_7\,
      Q => \counters_reg[1]__0\(13),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][16]_i_1_n_6\,
      Q => \counters_reg[1]__0\(14),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][16]_i_1_n_5\,
      Q => \counters_reg[1]__0\(15),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][16]_i_1_n_4\,
      Q => \counters_reg[1]__0\(16),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[1][12]_i_1_n_0\,
      CO(3) => \counters_reg[1][16]_i_1_n_0\,
      CO(2) => \counters_reg[1][16]_i_1_n_1\,
      CO(1) => \counters_reg[1][16]_i_1_n_2\,
      CO(0) => \counters_reg[1][16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[1][16]_i_1_n_4\,
      O(2) => \counters_reg[1][16]_i_1_n_5\,
      O(1) => \counters_reg[1][16]_i_1_n_6\,
      O(0) => \counters_reg[1][16]_i_1_n_7\,
      S(3) => \counters[1][16]_i_2_n_0\,
      S(2) => \counters[1][16]_i_3_n_0\,
      S(1) => \counters[1][16]_i_4_n_0\,
      S(0) => \counters[1][16]_i_5_n_0\
    );
\counters_reg[1][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][20]_i_1_n_7\,
      Q => \counters_reg[1]__0\(17),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][20]_i_1_n_6\,
      Q => \counters_reg[1]__0\(18),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][20]_i_1_n_5\,
      Q => \counters_reg[1]__0\(19),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][4]_i_1_n_7\,
      Q => \counters_reg[1]__0\(1),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][20]_i_1_n_4\,
      Q => \counters_reg[1]__0\(20),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[1][16]_i_1_n_0\,
      CO(3) => \counters_reg[1][20]_i_1_n_0\,
      CO(2) => \counters_reg[1][20]_i_1_n_1\,
      CO(1) => \counters_reg[1][20]_i_1_n_2\,
      CO(0) => \counters_reg[1][20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[1][20]_i_1_n_4\,
      O(2) => \counters_reg[1][20]_i_1_n_5\,
      O(1) => \counters_reg[1][20]_i_1_n_6\,
      O(0) => \counters_reg[1][20]_i_1_n_7\,
      S(3) => \counters[1][20]_i_2_n_0\,
      S(2) => \counters[1][20]_i_3_n_0\,
      S(1) => \counters[1][20]_i_4_n_0\,
      S(0) => \counters[1][20]_i_5_n_0\
    );
\counters_reg[1][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][24]_i_1_n_7\,
      Q => \counters_reg[1]__0\(21),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][24]_i_1_n_6\,
      Q => \counters_reg[1]__0\(22),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][24]_i_1_n_5\,
      Q => \counters_reg[1]__0\(23),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][24]_i_1_n_4\,
      Q => \counters_reg[1]__0\(24),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[1][20]_i_1_n_0\,
      CO(3) => \counters_reg[1][24]_i_1_n_0\,
      CO(2) => \counters_reg[1][24]_i_1_n_1\,
      CO(1) => \counters_reg[1][24]_i_1_n_2\,
      CO(0) => \counters_reg[1][24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[1][24]_i_1_n_4\,
      O(2) => \counters_reg[1][24]_i_1_n_5\,
      O(1) => \counters_reg[1][24]_i_1_n_6\,
      O(0) => \counters_reg[1][24]_i_1_n_7\,
      S(3) => \counters[1][24]_i_2_n_0\,
      S(2) => \counters[1][24]_i_3_n_0\,
      S(1) => \counters[1][24]_i_4_n_0\,
      S(0) => \counters[1][24]_i_5_n_0\
    );
\counters_reg[1][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][28]_i_1_n_7\,
      Q => \counters_reg[1]__0\(25),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][28]_i_1_n_6\,
      Q => \counters_reg[1]__0\(26),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][28]_i_1_n_5\,
      Q => \counters_reg[1]__0\(27),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][28]_i_1_n_4\,
      Q => \counters_reg[1]__0\(28),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[1][24]_i_1_n_0\,
      CO(3) => \counters_reg[1][28]_i_1_n_0\,
      CO(2) => \counters_reg[1][28]_i_1_n_1\,
      CO(1) => \counters_reg[1][28]_i_1_n_2\,
      CO(0) => \counters_reg[1][28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[1][28]_i_1_n_4\,
      O(2) => \counters_reg[1][28]_i_1_n_5\,
      O(1) => \counters_reg[1][28]_i_1_n_6\,
      O(0) => \counters_reg[1][28]_i_1_n_7\,
      S(3) => \counters[1][28]_i_2_n_0\,
      S(2) => \counters[1][28]_i_3_n_0\,
      S(1) => \counters[1][28]_i_4_n_0\,
      S(0) => \counters[1][28]_i_5_n_0\
    );
\counters_reg[1][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][30]_i_2_n_7\,
      Q => \counters_reg[1]__0\(29),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][4]_i_1_n_6\,
      Q => \counters_reg[1]__0\(2),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][30]_i_2_n_6\,
      Q => \counters_reg[1]__0\(30),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][30]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[1][28]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counters_reg[1][30]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counters_reg[1][30]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counters_reg[1][30]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1) => \counters_reg[1][30]_i_2_n_6\,
      O(0) => \counters_reg[1][30]_i_2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \counters[1][30]_i_7_n_0\,
      S(0) => \counters[1][30]_i_8_n_0\
    );
\counters_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][4]_i_1_n_5\,
      Q => \counters_reg[1]__0\(3),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][4]_i_1_n_4\,
      Q => \counters_reg[1]__0\(4),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counters_reg[1][4]_i_1_n_0\,
      CO(2) => \counters_reg[1][4]_i_1_n_1\,
      CO(1) => \counters_reg[1][4]_i_1_n_2\,
      CO(0) => \counters_reg[1][4]_i_1_n_3\,
      CYINIT => \counters_reg[1]__0\(0),
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[1][4]_i_1_n_4\,
      O(2) => \counters_reg[1][4]_i_1_n_5\,
      O(1) => \counters_reg[1][4]_i_1_n_6\,
      O(0) => \counters_reg[1][4]_i_1_n_7\,
      S(3) => \counters[1][4]_i_2_n_0\,
      S(2) => \counters[1][4]_i_3_n_0\,
      S(1) => \counters[1][4]_i_4_n_0\,
      S(0) => \counters[1][4]_i_5_n_0\
    );
\counters_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][8]_i_1_n_7\,
      Q => \counters_reg[1]__0\(5),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][8]_i_1_n_6\,
      Q => \counters_reg[1]__0\(6),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][8]_i_1_n_5\,
      Q => \counters_reg[1]__0\(7),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][8]_i_1_n_4\,
      Q => \counters_reg[1]__0\(8),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[1][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[1][4]_i_1_n_0\,
      CO(3) => \counters_reg[1][8]_i_1_n_0\,
      CO(2) => \counters_reg[1][8]_i_1_n_1\,
      CO(1) => \counters_reg[1][8]_i_1_n_2\,
      CO(0) => \counters_reg[1][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[1][8]_i_1_n_4\,
      O(2) => \counters_reg[1][8]_i_1_n_5\,
      O(1) => \counters_reg[1][8]_i_1_n_6\,
      O(0) => \counters_reg[1][8]_i_1_n_7\,
      S(3) => \counters[1][8]_i_2_n_0\,
      S(2) => \counters[1][8]_i_3_n_0\,
      S(1) => \counters[1][8]_i_4_n_0\,
      S(0) => \counters[1][8]_i_5_n_0\
    );
\counters_reg[1][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[1][12]_i_1_n_7\,
      Q => \counters_reg[1]__0\(9),
      R => \counters[1][30]_i_1_n_0\
    );
\counters_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters[2]\(0),
      Q => \counters_reg[2]__0\(0),
      R => '0'
    );
\counters_reg[2][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][12]_i_1_n_6\,
      Q => \counters_reg[2]__0\(10),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][12]_i_1_n_5\,
      Q => \counters_reg[2]__0\(11),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][12]_i_1_n_4\,
      Q => \counters_reg[2]__0\(12),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[2][8]_i_1_n_0\,
      CO(3) => \counters_reg[2][12]_i_1_n_0\,
      CO(2) => \counters_reg[2][12]_i_1_n_1\,
      CO(1) => \counters_reg[2][12]_i_1_n_2\,
      CO(0) => \counters_reg[2][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[2][12]_i_1_n_4\,
      O(2) => \counters_reg[2][12]_i_1_n_5\,
      O(1) => \counters_reg[2][12]_i_1_n_6\,
      O(0) => \counters_reg[2][12]_i_1_n_7\,
      S(3) => \counters[2][12]_i_2_n_0\,
      S(2) => \counters[2][12]_i_3_n_0\,
      S(1) => \counters[2][12]_i_4_n_0\,
      S(0) => \counters[2][12]_i_5_n_0\
    );
\counters_reg[2][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][16]_i_1_n_7\,
      Q => \counters_reg[2]__0\(13),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][16]_i_1_n_6\,
      Q => \counters_reg[2]__0\(14),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][16]_i_1_n_5\,
      Q => \counters_reg[2]__0\(15),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][16]_i_1_n_4\,
      Q => \counters_reg[2]__0\(16),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[2][12]_i_1_n_0\,
      CO(3) => \counters_reg[2][16]_i_1_n_0\,
      CO(2) => \counters_reg[2][16]_i_1_n_1\,
      CO(1) => \counters_reg[2][16]_i_1_n_2\,
      CO(0) => \counters_reg[2][16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[2][16]_i_1_n_4\,
      O(2) => \counters_reg[2][16]_i_1_n_5\,
      O(1) => \counters_reg[2][16]_i_1_n_6\,
      O(0) => \counters_reg[2][16]_i_1_n_7\,
      S(3) => \counters[2][16]_i_2_n_0\,
      S(2) => \counters[2][16]_i_3_n_0\,
      S(1) => \counters[2][16]_i_4_n_0\,
      S(0) => \counters[2][16]_i_5_n_0\
    );
\counters_reg[2][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][20]_i_1_n_7\,
      Q => \counters_reg[2]__0\(17),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][20]_i_1_n_6\,
      Q => \counters_reg[2]__0\(18),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][20]_i_1_n_5\,
      Q => \counters_reg[2]__0\(19),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][4]_i_1_n_7\,
      Q => \counters_reg[2]__0\(1),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][20]_i_1_n_4\,
      Q => \counters_reg[2]__0\(20),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[2][16]_i_1_n_0\,
      CO(3) => \counters_reg[2][20]_i_1_n_0\,
      CO(2) => \counters_reg[2][20]_i_1_n_1\,
      CO(1) => \counters_reg[2][20]_i_1_n_2\,
      CO(0) => \counters_reg[2][20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[2][20]_i_1_n_4\,
      O(2) => \counters_reg[2][20]_i_1_n_5\,
      O(1) => \counters_reg[2][20]_i_1_n_6\,
      O(0) => \counters_reg[2][20]_i_1_n_7\,
      S(3) => \counters[2][20]_i_2_n_0\,
      S(2) => \counters[2][20]_i_3_n_0\,
      S(1) => \counters[2][20]_i_4_n_0\,
      S(0) => \counters[2][20]_i_5_n_0\
    );
\counters_reg[2][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][24]_i_1_n_7\,
      Q => \counters_reg[2]__0\(21),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][24]_i_1_n_6\,
      Q => \counters_reg[2]__0\(22),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][24]_i_1_n_5\,
      Q => \counters_reg[2]__0\(23),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][24]_i_1_n_4\,
      Q => \counters_reg[2]__0\(24),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[2][20]_i_1_n_0\,
      CO(3) => \counters_reg[2][24]_i_1_n_0\,
      CO(2) => \counters_reg[2][24]_i_1_n_1\,
      CO(1) => \counters_reg[2][24]_i_1_n_2\,
      CO(0) => \counters_reg[2][24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[2][24]_i_1_n_4\,
      O(2) => \counters_reg[2][24]_i_1_n_5\,
      O(1) => \counters_reg[2][24]_i_1_n_6\,
      O(0) => \counters_reg[2][24]_i_1_n_7\,
      S(3) => \counters[2][24]_i_2_n_0\,
      S(2) => \counters[2][24]_i_3_n_0\,
      S(1) => \counters[2][24]_i_4_n_0\,
      S(0) => \counters[2][24]_i_5_n_0\
    );
\counters_reg[2][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][28]_i_1_n_7\,
      Q => \counters_reg[2]__0\(25),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][28]_i_1_n_6\,
      Q => \counters_reg[2]__0\(26),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][28]_i_1_n_5\,
      Q => \counters_reg[2]__0\(27),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][28]_i_1_n_4\,
      Q => \counters_reg[2]__0\(28),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[2][24]_i_1_n_0\,
      CO(3) => \counters_reg[2][28]_i_1_n_0\,
      CO(2) => \counters_reg[2][28]_i_1_n_1\,
      CO(1) => \counters_reg[2][28]_i_1_n_2\,
      CO(0) => \counters_reg[2][28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[2][28]_i_1_n_4\,
      O(2) => \counters_reg[2][28]_i_1_n_5\,
      O(1) => \counters_reg[2][28]_i_1_n_6\,
      O(0) => \counters_reg[2][28]_i_1_n_7\,
      S(3) => \counters[2][28]_i_2_n_0\,
      S(2) => \counters[2][28]_i_3_n_0\,
      S(1) => \counters[2][28]_i_4_n_0\,
      S(0) => \counters[2][28]_i_5_n_0\
    );
\counters_reg[2][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][30]_i_2_n_7\,
      Q => \counters_reg[2]__0\(29),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][4]_i_1_n_6\,
      Q => \counters_reg[2]__0\(2),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][30]_i_2_n_6\,
      Q => \counters_reg[2]__0\(30),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][30]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[2][28]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counters_reg[2][30]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counters_reg[2][30]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counters_reg[2][30]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1) => \counters_reg[2][30]_i_2_n_6\,
      O(0) => \counters_reg[2][30]_i_2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \counters[2][30]_i_3_n_0\,
      S(0) => \counters[2][30]_i_4_n_0\
    );
\counters_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][4]_i_1_n_5\,
      Q => \counters_reg[2]__0\(3),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][4]_i_1_n_4\,
      Q => \counters_reg[2]__0\(4),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counters_reg[2][4]_i_1_n_0\,
      CO(2) => \counters_reg[2][4]_i_1_n_1\,
      CO(1) => \counters_reg[2][4]_i_1_n_2\,
      CO(0) => \counters_reg[2][4]_i_1_n_3\,
      CYINIT => \counters_reg[2]__0\(0),
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[2][4]_i_1_n_4\,
      O(2) => \counters_reg[2][4]_i_1_n_5\,
      O(1) => \counters_reg[2][4]_i_1_n_6\,
      O(0) => \counters_reg[2][4]_i_1_n_7\,
      S(3) => \counters[2][4]_i_2_n_0\,
      S(2) => \counters[2][4]_i_3_n_0\,
      S(1) => \counters[2][4]_i_4_n_0\,
      S(0) => \counters[2][4]_i_5_n_0\
    );
\counters_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][8]_i_1_n_7\,
      Q => \counters_reg[2]__0\(5),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][8]_i_1_n_6\,
      Q => \counters_reg[2]__0\(6),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][8]_i_1_n_5\,
      Q => \counters_reg[2]__0\(7),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][8]_i_1_n_4\,
      Q => \counters_reg[2]__0\(8),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[2][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[2][4]_i_1_n_0\,
      CO(3) => \counters_reg[2][8]_i_1_n_0\,
      CO(2) => \counters_reg[2][8]_i_1_n_1\,
      CO(1) => \counters_reg[2][8]_i_1_n_2\,
      CO(0) => \counters_reg[2][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[2][8]_i_1_n_4\,
      O(2) => \counters_reg[2][8]_i_1_n_5\,
      O(1) => \counters_reg[2][8]_i_1_n_6\,
      O(0) => \counters_reg[2][8]_i_1_n_7\,
      S(3) => \counters[2][8]_i_2_n_0\,
      S(2) => \counters[2][8]_i_3_n_0\,
      S(1) => \counters[2][8]_i_4_n_0\,
      S(0) => \counters[2][8]_i_5_n_0\
    );
\counters_reg[2][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[2][12]_i_1_n_7\,
      Q => \counters_reg[2]__0\(9),
      R => \counters[2][30]_i_1_n_0\
    );
\counters_reg[3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters[3]\(0),
      Q => \counters_reg[3]__0\(0),
      R => '0'
    );
\counters_reg[3][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][12]_i_1_n_6\,
      Q => \counters_reg[3]__0\(10),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][12]_i_1_n_5\,
      Q => \counters_reg[3]__0\(11),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][12]_i_1_n_4\,
      Q => \counters_reg[3]__0\(12),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[3][8]_i_1_n_0\,
      CO(3) => \counters_reg[3][12]_i_1_n_0\,
      CO(2) => \counters_reg[3][12]_i_1_n_1\,
      CO(1) => \counters_reg[3][12]_i_1_n_2\,
      CO(0) => \counters_reg[3][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[3][12]_i_1_n_4\,
      O(2) => \counters_reg[3][12]_i_1_n_5\,
      O(1) => \counters_reg[3][12]_i_1_n_6\,
      O(0) => \counters_reg[3][12]_i_1_n_7\,
      S(3) => \counters[3][12]_i_2_n_0\,
      S(2) => \counters[3][12]_i_3_n_0\,
      S(1) => \counters[3][12]_i_4_n_0\,
      S(0) => \counters[3][12]_i_5_n_0\
    );
\counters_reg[3][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][16]_i_1_n_7\,
      Q => \counters_reg[3]__0\(13),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][16]_i_1_n_6\,
      Q => \counters_reg[3]__0\(14),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][16]_i_1_n_5\,
      Q => \counters_reg[3]__0\(15),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][16]_i_1_n_4\,
      Q => \counters_reg[3]__0\(16),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[3][12]_i_1_n_0\,
      CO(3) => \counters_reg[3][16]_i_1_n_0\,
      CO(2) => \counters_reg[3][16]_i_1_n_1\,
      CO(1) => \counters_reg[3][16]_i_1_n_2\,
      CO(0) => \counters_reg[3][16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[3][16]_i_1_n_4\,
      O(2) => \counters_reg[3][16]_i_1_n_5\,
      O(1) => \counters_reg[3][16]_i_1_n_6\,
      O(0) => \counters_reg[3][16]_i_1_n_7\,
      S(3) => \counters[3][16]_i_2_n_0\,
      S(2) => \counters[3][16]_i_3_n_0\,
      S(1) => \counters[3][16]_i_4_n_0\,
      S(0) => \counters[3][16]_i_5_n_0\
    );
\counters_reg[3][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][20]_i_1_n_7\,
      Q => \counters_reg[3]__0\(17),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][20]_i_1_n_6\,
      Q => \counters_reg[3]__0\(18),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][20]_i_1_n_5\,
      Q => \counters_reg[3]__0\(19),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][4]_i_1_n_7\,
      Q => \counters_reg[3]__0\(1),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][20]_i_1_n_4\,
      Q => \counters_reg[3]__0\(20),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[3][16]_i_1_n_0\,
      CO(3) => \counters_reg[3][20]_i_1_n_0\,
      CO(2) => \counters_reg[3][20]_i_1_n_1\,
      CO(1) => \counters_reg[3][20]_i_1_n_2\,
      CO(0) => \counters_reg[3][20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[3][20]_i_1_n_4\,
      O(2) => \counters_reg[3][20]_i_1_n_5\,
      O(1) => \counters_reg[3][20]_i_1_n_6\,
      O(0) => \counters_reg[3][20]_i_1_n_7\,
      S(3) => \counters[3][20]_i_2_n_0\,
      S(2) => \counters[3][20]_i_3_n_0\,
      S(1) => \counters[3][20]_i_4_n_0\,
      S(0) => \counters[3][20]_i_5_n_0\
    );
\counters_reg[3][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][24]_i_1_n_7\,
      Q => \counters_reg[3]__0\(21),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][24]_i_1_n_6\,
      Q => \counters_reg[3]__0\(22),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][24]_i_1_n_5\,
      Q => \counters_reg[3]__0\(23),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][24]_i_1_n_4\,
      Q => \counters_reg[3]__0\(24),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[3][20]_i_1_n_0\,
      CO(3) => \counters_reg[3][24]_i_1_n_0\,
      CO(2) => \counters_reg[3][24]_i_1_n_1\,
      CO(1) => \counters_reg[3][24]_i_1_n_2\,
      CO(0) => \counters_reg[3][24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[3][24]_i_1_n_4\,
      O(2) => \counters_reg[3][24]_i_1_n_5\,
      O(1) => \counters_reg[3][24]_i_1_n_6\,
      O(0) => \counters_reg[3][24]_i_1_n_7\,
      S(3) => \counters[3][24]_i_2_n_0\,
      S(2) => \counters[3][24]_i_3_n_0\,
      S(1) => \counters[3][24]_i_4_n_0\,
      S(0) => \counters[3][24]_i_5_n_0\
    );
\counters_reg[3][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][28]_i_1_n_7\,
      Q => \counters_reg[3]__0\(25),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][28]_i_1_n_6\,
      Q => \counters_reg[3]__0\(26),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][28]_i_1_n_5\,
      Q => \counters_reg[3]__0\(27),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][28]_i_1_n_4\,
      Q => \counters_reg[3]__0\(28),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[3][24]_i_1_n_0\,
      CO(3) => \counters_reg[3][28]_i_1_n_0\,
      CO(2) => \counters_reg[3][28]_i_1_n_1\,
      CO(1) => \counters_reg[3][28]_i_1_n_2\,
      CO(0) => \counters_reg[3][28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[3][28]_i_1_n_4\,
      O(2) => \counters_reg[3][28]_i_1_n_5\,
      O(1) => \counters_reg[3][28]_i_1_n_6\,
      O(0) => \counters_reg[3][28]_i_1_n_7\,
      S(3) => \counters[3][28]_i_2_n_0\,
      S(2) => \counters[3][28]_i_3_n_0\,
      S(1) => \counters[3][28]_i_4_n_0\,
      S(0) => \counters[3][28]_i_5_n_0\
    );
\counters_reg[3][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][30]_i_2_n_7\,
      Q => \counters_reg[3]__0\(29),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][4]_i_1_n_6\,
      Q => \counters_reg[3]__0\(2),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][30]_i_2_n_6\,
      Q => \counters_reg[3]__0\(30),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][30]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[3][28]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counters_reg[3][30]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counters_reg[3][30]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counters_reg[3][30]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1) => \counters_reg[3][30]_i_2_n_6\,
      O(0) => \counters_reg[3][30]_i_2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \counters[3][30]_i_3_n_0\,
      S(0) => \counters[3][30]_i_4_n_0\
    );
\counters_reg[3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][4]_i_1_n_5\,
      Q => \counters_reg[3]__0\(3),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][4]_i_1_n_4\,
      Q => \counters_reg[3]__0\(4),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counters_reg[3][4]_i_1_n_0\,
      CO(2) => \counters_reg[3][4]_i_1_n_1\,
      CO(1) => \counters_reg[3][4]_i_1_n_2\,
      CO(0) => \counters_reg[3][4]_i_1_n_3\,
      CYINIT => \counters_reg[3]__0\(0),
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[3][4]_i_1_n_4\,
      O(2) => \counters_reg[3][4]_i_1_n_5\,
      O(1) => \counters_reg[3][4]_i_1_n_6\,
      O(0) => \counters_reg[3][4]_i_1_n_7\,
      S(3) => \counters[3][4]_i_2_n_0\,
      S(2) => \counters[3][4]_i_3_n_0\,
      S(1) => \counters[3][4]_i_4_n_0\,
      S(0) => \counters[3][4]_i_5_n_0\
    );
\counters_reg[3][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][8]_i_1_n_7\,
      Q => \counters_reg[3]__0\(5),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][8]_i_1_n_6\,
      Q => \counters_reg[3]__0\(6),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][8]_i_1_n_5\,
      Q => \counters_reg[3]__0\(7),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][8]_i_1_n_4\,
      Q => \counters_reg[3]__0\(8),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[3][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[3][4]_i_1_n_0\,
      CO(3) => \counters_reg[3][8]_i_1_n_0\,
      CO(2) => \counters_reg[3][8]_i_1_n_1\,
      CO(1) => \counters_reg[3][8]_i_1_n_2\,
      CO(0) => \counters_reg[3][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[3][8]_i_1_n_4\,
      O(2) => \counters_reg[3][8]_i_1_n_5\,
      O(1) => \counters_reg[3][8]_i_1_n_6\,
      O(0) => \counters_reg[3][8]_i_1_n_7\,
      S(3) => \counters[3][8]_i_2_n_0\,
      S(2) => \counters[3][8]_i_3_n_0\,
      S(1) => \counters[3][8]_i_4_n_0\,
      S(0) => \counters[3][8]_i_5_n_0\
    );
\counters_reg[3][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[3][12]_i_1_n_7\,
      Q => \counters_reg[3]__0\(9),
      R => \counters[3][30]_i_1_n_0\
    );
\counters_reg[4][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters[4]\(0),
      Q => \counters_reg[4]__0\(0),
      R => '0'
    );
\counters_reg[4][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][12]_i_1_n_6\,
      Q => \counters_reg[4]__0\(10),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][12]_i_1_n_5\,
      Q => \counters_reg[4]__0\(11),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][12]_i_1_n_4\,
      Q => \counters_reg[4]__0\(12),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[4][8]_i_1_n_0\,
      CO(3) => \counters_reg[4][12]_i_1_n_0\,
      CO(2) => \counters_reg[4][12]_i_1_n_1\,
      CO(1) => \counters_reg[4][12]_i_1_n_2\,
      CO(0) => \counters_reg[4][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[4][12]_i_1_n_4\,
      O(2) => \counters_reg[4][12]_i_1_n_5\,
      O(1) => \counters_reg[4][12]_i_1_n_6\,
      O(0) => \counters_reg[4][12]_i_1_n_7\,
      S(3) => \counters[4][12]_i_2_n_0\,
      S(2) => \counters[4][12]_i_3_n_0\,
      S(1) => \counters[4][12]_i_4_n_0\,
      S(0) => \counters[4][12]_i_5_n_0\
    );
\counters_reg[4][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][16]_i_1_n_7\,
      Q => \counters_reg[4]__0\(13),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][16]_i_1_n_6\,
      Q => \counters_reg[4]__0\(14),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][16]_i_1_n_5\,
      Q => \counters_reg[4]__0\(15),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][16]_i_1_n_4\,
      Q => \counters_reg[4]__0\(16),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[4][12]_i_1_n_0\,
      CO(3) => \counters_reg[4][16]_i_1_n_0\,
      CO(2) => \counters_reg[4][16]_i_1_n_1\,
      CO(1) => \counters_reg[4][16]_i_1_n_2\,
      CO(0) => \counters_reg[4][16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[4][16]_i_1_n_4\,
      O(2) => \counters_reg[4][16]_i_1_n_5\,
      O(1) => \counters_reg[4][16]_i_1_n_6\,
      O(0) => \counters_reg[4][16]_i_1_n_7\,
      S(3) => \counters[4][16]_i_2_n_0\,
      S(2) => \counters[4][16]_i_3_n_0\,
      S(1) => \counters[4][16]_i_4_n_0\,
      S(0) => \counters[4][16]_i_5_n_0\
    );
\counters_reg[4][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][20]_i_1_n_7\,
      Q => \counters_reg[4]__0\(17),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][20]_i_1_n_6\,
      Q => \counters_reg[4]__0\(18),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][20]_i_1_n_5\,
      Q => \counters_reg[4]__0\(19),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][4]_i_1_n_7\,
      Q => \counters_reg[4]__0\(1),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][20]_i_1_n_4\,
      Q => \counters_reg[4]__0\(20),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[4][16]_i_1_n_0\,
      CO(3) => \counters_reg[4][20]_i_1_n_0\,
      CO(2) => \counters_reg[4][20]_i_1_n_1\,
      CO(1) => \counters_reg[4][20]_i_1_n_2\,
      CO(0) => \counters_reg[4][20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[4][20]_i_1_n_4\,
      O(2) => \counters_reg[4][20]_i_1_n_5\,
      O(1) => \counters_reg[4][20]_i_1_n_6\,
      O(0) => \counters_reg[4][20]_i_1_n_7\,
      S(3) => \counters[4][20]_i_2_n_0\,
      S(2) => \counters[4][20]_i_3_n_0\,
      S(1) => \counters[4][20]_i_4_n_0\,
      S(0) => \counters[4][20]_i_5_n_0\
    );
\counters_reg[4][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][24]_i_1_n_7\,
      Q => \counters_reg[4]__0\(21),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][24]_i_1_n_6\,
      Q => \counters_reg[4]__0\(22),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][24]_i_1_n_5\,
      Q => \counters_reg[4]__0\(23),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][24]_i_1_n_4\,
      Q => \counters_reg[4]__0\(24),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[4][20]_i_1_n_0\,
      CO(3) => \counters_reg[4][24]_i_1_n_0\,
      CO(2) => \counters_reg[4][24]_i_1_n_1\,
      CO(1) => \counters_reg[4][24]_i_1_n_2\,
      CO(0) => \counters_reg[4][24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[4][24]_i_1_n_4\,
      O(2) => \counters_reg[4][24]_i_1_n_5\,
      O(1) => \counters_reg[4][24]_i_1_n_6\,
      O(0) => \counters_reg[4][24]_i_1_n_7\,
      S(3) => \counters[4][24]_i_2_n_0\,
      S(2) => \counters[4][24]_i_3_n_0\,
      S(1) => \counters[4][24]_i_4_n_0\,
      S(0) => \counters[4][24]_i_5_n_0\
    );
\counters_reg[4][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][28]_i_1_n_7\,
      Q => \counters_reg[4]__0\(25),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][28]_i_1_n_6\,
      Q => \counters_reg[4]__0\(26),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][28]_i_1_n_5\,
      Q => \counters_reg[4]__0\(27),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][28]_i_1_n_4\,
      Q => \counters_reg[4]__0\(28),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[4][24]_i_1_n_0\,
      CO(3) => \counters_reg[4][28]_i_1_n_0\,
      CO(2) => \counters_reg[4][28]_i_1_n_1\,
      CO(1) => \counters_reg[4][28]_i_1_n_2\,
      CO(0) => \counters_reg[4][28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[4][28]_i_1_n_4\,
      O(2) => \counters_reg[4][28]_i_1_n_5\,
      O(1) => \counters_reg[4][28]_i_1_n_6\,
      O(0) => \counters_reg[4][28]_i_1_n_7\,
      S(3) => \counters[4][28]_i_2_n_0\,
      S(2) => \counters[4][28]_i_3_n_0\,
      S(1) => \counters[4][28]_i_4_n_0\,
      S(0) => \counters[4][28]_i_5_n_0\
    );
\counters_reg[4][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][30]_i_2_n_7\,
      Q => \counters_reg[4]__0\(29),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][4]_i_1_n_6\,
      Q => \counters_reg[4]__0\(2),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][30]_i_2_n_6\,
      Q => \counters_reg[4]__0\(30),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][30]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[4][28]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counters_reg[4][30]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counters_reg[4][30]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counters_reg[4][30]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1) => \counters_reg[4][30]_i_2_n_6\,
      O(0) => \counters_reg[4][30]_i_2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \counters[4][30]_i_3_n_0\,
      S(0) => \counters[4][30]_i_4_n_0\
    );
\counters_reg[4][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][4]_i_1_n_5\,
      Q => \counters_reg[4]__0\(3),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][4]_i_1_n_4\,
      Q => \counters_reg[4]__0\(4),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counters_reg[4][4]_i_1_n_0\,
      CO(2) => \counters_reg[4][4]_i_1_n_1\,
      CO(1) => \counters_reg[4][4]_i_1_n_2\,
      CO(0) => \counters_reg[4][4]_i_1_n_3\,
      CYINIT => \counters_reg[4]__0\(0),
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[4][4]_i_1_n_4\,
      O(2) => \counters_reg[4][4]_i_1_n_5\,
      O(1) => \counters_reg[4][4]_i_1_n_6\,
      O(0) => \counters_reg[4][4]_i_1_n_7\,
      S(3) => \counters[4][4]_i_2_n_0\,
      S(2) => \counters[4][4]_i_3_n_0\,
      S(1) => \counters[4][4]_i_4_n_0\,
      S(0) => \counters[4][4]_i_5_n_0\
    );
\counters_reg[4][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][8]_i_1_n_7\,
      Q => \counters_reg[4]__0\(5),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][8]_i_1_n_6\,
      Q => \counters_reg[4]__0\(6),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][8]_i_1_n_5\,
      Q => \counters_reg[4]__0\(7),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][8]_i_1_n_4\,
      Q => \counters_reg[4]__0\(8),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[4][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[4][4]_i_1_n_0\,
      CO(3) => \counters_reg[4][8]_i_1_n_0\,
      CO(2) => \counters_reg[4][8]_i_1_n_1\,
      CO(1) => \counters_reg[4][8]_i_1_n_2\,
      CO(0) => \counters_reg[4][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[4][8]_i_1_n_4\,
      O(2) => \counters_reg[4][8]_i_1_n_5\,
      O(1) => \counters_reg[4][8]_i_1_n_6\,
      O(0) => \counters_reg[4][8]_i_1_n_7\,
      S(3) => \counters[4][8]_i_2_n_0\,
      S(2) => \counters[4][8]_i_3_n_0\,
      S(1) => \counters[4][8]_i_4_n_0\,
      S(0) => \counters[4][8]_i_5_n_0\
    );
\counters_reg[4][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[4][12]_i_1_n_7\,
      Q => \counters_reg[4]__0\(9),
      R => \counters[4][30]_i_1_n_0\
    );
\counters_reg[5][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters[5]\(0),
      Q => \counters_reg[5]__0\(0),
      R => '0'
    );
\counters_reg[5][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][12]_i_1_n_6\,
      Q => \counters_reg[5]__0\(10),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][12]_i_1_n_5\,
      Q => \counters_reg[5]__0\(11),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][12]_i_1_n_4\,
      Q => \counters_reg[5]__0\(12),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[5][8]_i_1_n_0\,
      CO(3) => \counters_reg[5][12]_i_1_n_0\,
      CO(2) => \counters_reg[5][12]_i_1_n_1\,
      CO(1) => \counters_reg[5][12]_i_1_n_2\,
      CO(0) => \counters_reg[5][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[5][12]_i_1_n_4\,
      O(2) => \counters_reg[5][12]_i_1_n_5\,
      O(1) => \counters_reg[5][12]_i_1_n_6\,
      O(0) => \counters_reg[5][12]_i_1_n_7\,
      S(3) => \counters[5][12]_i_2_n_0\,
      S(2) => \counters[5][12]_i_3_n_0\,
      S(1) => \counters[5][12]_i_4_n_0\,
      S(0) => \counters[5][12]_i_5_n_0\
    );
\counters_reg[5][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][16]_i_1_n_7\,
      Q => \counters_reg[5]__0\(13),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][16]_i_1_n_6\,
      Q => \counters_reg[5]__0\(14),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][16]_i_1_n_5\,
      Q => \counters_reg[5]__0\(15),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][16]_i_1_n_4\,
      Q => \counters_reg[5]__0\(16),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[5][12]_i_1_n_0\,
      CO(3) => \counters_reg[5][16]_i_1_n_0\,
      CO(2) => \counters_reg[5][16]_i_1_n_1\,
      CO(1) => \counters_reg[5][16]_i_1_n_2\,
      CO(0) => \counters_reg[5][16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[5][16]_i_1_n_4\,
      O(2) => \counters_reg[5][16]_i_1_n_5\,
      O(1) => \counters_reg[5][16]_i_1_n_6\,
      O(0) => \counters_reg[5][16]_i_1_n_7\,
      S(3) => \counters[5][16]_i_2_n_0\,
      S(2) => \counters[5][16]_i_3_n_0\,
      S(1) => \counters[5][16]_i_4_n_0\,
      S(0) => \counters[5][16]_i_5_n_0\
    );
\counters_reg[5][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][20]_i_1_n_7\,
      Q => \counters_reg[5]__0\(17),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][20]_i_1_n_6\,
      Q => \counters_reg[5]__0\(18),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][20]_i_1_n_5\,
      Q => \counters_reg[5]__0\(19),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][4]_i_1_n_7\,
      Q => \counters_reg[5]__0\(1),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][20]_i_1_n_4\,
      Q => \counters_reg[5]__0\(20),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[5][16]_i_1_n_0\,
      CO(3) => \counters_reg[5][20]_i_1_n_0\,
      CO(2) => \counters_reg[5][20]_i_1_n_1\,
      CO(1) => \counters_reg[5][20]_i_1_n_2\,
      CO(0) => \counters_reg[5][20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[5][20]_i_1_n_4\,
      O(2) => \counters_reg[5][20]_i_1_n_5\,
      O(1) => \counters_reg[5][20]_i_1_n_6\,
      O(0) => \counters_reg[5][20]_i_1_n_7\,
      S(3) => \counters[5][20]_i_2_n_0\,
      S(2) => \counters[5][20]_i_3_n_0\,
      S(1) => \counters[5][20]_i_4_n_0\,
      S(0) => \counters[5][20]_i_5_n_0\
    );
\counters_reg[5][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][24]_i_1_n_7\,
      Q => \counters_reg[5]__0\(21),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][24]_i_1_n_6\,
      Q => \counters_reg[5]__0\(22),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][24]_i_1_n_5\,
      Q => \counters_reg[5]__0\(23),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][24]_i_1_n_4\,
      Q => \counters_reg[5]__0\(24),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[5][20]_i_1_n_0\,
      CO(3) => \counters_reg[5][24]_i_1_n_0\,
      CO(2) => \counters_reg[5][24]_i_1_n_1\,
      CO(1) => \counters_reg[5][24]_i_1_n_2\,
      CO(0) => \counters_reg[5][24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[5][24]_i_1_n_4\,
      O(2) => \counters_reg[5][24]_i_1_n_5\,
      O(1) => \counters_reg[5][24]_i_1_n_6\,
      O(0) => \counters_reg[5][24]_i_1_n_7\,
      S(3) => \counters[5][24]_i_2_n_0\,
      S(2) => \counters[5][24]_i_3_n_0\,
      S(1) => \counters[5][24]_i_4_n_0\,
      S(0) => \counters[5][24]_i_5_n_0\
    );
\counters_reg[5][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][28]_i_1_n_7\,
      Q => \counters_reg[5]__0\(25),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][28]_i_1_n_6\,
      Q => \counters_reg[5]__0\(26),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][28]_i_1_n_5\,
      Q => \counters_reg[5]__0\(27),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][28]_i_1_n_4\,
      Q => \counters_reg[5]__0\(28),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[5][24]_i_1_n_0\,
      CO(3) => \counters_reg[5][28]_i_1_n_0\,
      CO(2) => \counters_reg[5][28]_i_1_n_1\,
      CO(1) => \counters_reg[5][28]_i_1_n_2\,
      CO(0) => \counters_reg[5][28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[5][28]_i_1_n_4\,
      O(2) => \counters_reg[5][28]_i_1_n_5\,
      O(1) => \counters_reg[5][28]_i_1_n_6\,
      O(0) => \counters_reg[5][28]_i_1_n_7\,
      S(3) => \counters[5][28]_i_2_n_0\,
      S(2) => \counters[5][28]_i_3_n_0\,
      S(1) => \counters[5][28]_i_4_n_0\,
      S(0) => \counters[5][28]_i_5_n_0\
    );
\counters_reg[5][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][30]_i_2_n_7\,
      Q => \counters_reg[5]__0\(29),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][4]_i_1_n_6\,
      Q => \counters_reg[5]__0\(2),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][30]_i_2_n_6\,
      Q => \counters_reg[5]__0\(30),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][30]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[5][28]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counters_reg[5][30]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counters_reg[5][30]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counters_reg[5][30]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1) => \counters_reg[5][30]_i_2_n_6\,
      O(0) => \counters_reg[5][30]_i_2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \counters[5][30]_i_3_n_0\,
      S(0) => \counters[5][30]_i_4_n_0\
    );
\counters_reg[5][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][4]_i_1_n_5\,
      Q => \counters_reg[5]__0\(3),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][4]_i_1_n_4\,
      Q => \counters_reg[5]__0\(4),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counters_reg[5][4]_i_1_n_0\,
      CO(2) => \counters_reg[5][4]_i_1_n_1\,
      CO(1) => \counters_reg[5][4]_i_1_n_2\,
      CO(0) => \counters_reg[5][4]_i_1_n_3\,
      CYINIT => \counters_reg[5]__0\(0),
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[5][4]_i_1_n_4\,
      O(2) => \counters_reg[5][4]_i_1_n_5\,
      O(1) => \counters_reg[5][4]_i_1_n_6\,
      O(0) => \counters_reg[5][4]_i_1_n_7\,
      S(3) => \counters[5][4]_i_2_n_0\,
      S(2) => \counters[5][4]_i_3_n_0\,
      S(1) => \counters[5][4]_i_4_n_0\,
      S(0) => \counters[5][4]_i_5_n_0\
    );
\counters_reg[5][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][8]_i_1_n_7\,
      Q => \counters_reg[5]__0\(5),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][8]_i_1_n_6\,
      Q => \counters_reg[5]__0\(6),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][8]_i_1_n_5\,
      Q => \counters_reg[5]__0\(7),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][8]_i_1_n_4\,
      Q => \counters_reg[5]__0\(8),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[5][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[5][4]_i_1_n_0\,
      CO(3) => \counters_reg[5][8]_i_1_n_0\,
      CO(2) => \counters_reg[5][8]_i_1_n_1\,
      CO(1) => \counters_reg[5][8]_i_1_n_2\,
      CO(0) => \counters_reg[5][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[5][8]_i_1_n_4\,
      O(2) => \counters_reg[5][8]_i_1_n_5\,
      O(1) => \counters_reg[5][8]_i_1_n_6\,
      O(0) => \counters_reg[5][8]_i_1_n_7\,
      S(3) => \counters[5][8]_i_2_n_0\,
      S(2) => \counters[5][8]_i_3_n_0\,
      S(1) => \counters[5][8]_i_4_n_0\,
      S(0) => \counters[5][8]_i_5_n_0\
    );
\counters_reg[5][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[5][12]_i_1_n_7\,
      Q => \counters_reg[5]__0\(9),
      R => \counters[5][30]_i_1_n_0\
    );
\counters_reg[6][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters[6]\(0),
      Q => \counters_reg[6]__0\(0),
      R => '0'
    );
\counters_reg[6][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][12]_i_1_n_6\,
      Q => \counters_reg[6]__0\(10),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][12]_i_1_n_5\,
      Q => \counters_reg[6]__0\(11),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][12]_i_1_n_4\,
      Q => \counters_reg[6]__0\(12),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[6][8]_i_1_n_0\,
      CO(3) => \counters_reg[6][12]_i_1_n_0\,
      CO(2) => \counters_reg[6][12]_i_1_n_1\,
      CO(1) => \counters_reg[6][12]_i_1_n_2\,
      CO(0) => \counters_reg[6][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[6][12]_i_1_n_4\,
      O(2) => \counters_reg[6][12]_i_1_n_5\,
      O(1) => \counters_reg[6][12]_i_1_n_6\,
      O(0) => \counters_reg[6][12]_i_1_n_7\,
      S(3) => \counters[6][12]_i_2_n_0\,
      S(2) => \counters[6][12]_i_3_n_0\,
      S(1) => \counters[6][12]_i_4_n_0\,
      S(0) => \counters[6][12]_i_5_n_0\
    );
\counters_reg[6][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][16]_i_1_n_7\,
      Q => \counters_reg[6]__0\(13),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][16]_i_1_n_6\,
      Q => \counters_reg[6]__0\(14),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][16]_i_1_n_5\,
      Q => \counters_reg[6]__0\(15),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][16]_i_1_n_4\,
      Q => \counters_reg[6]__0\(16),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[6][12]_i_1_n_0\,
      CO(3) => \counters_reg[6][16]_i_1_n_0\,
      CO(2) => \counters_reg[6][16]_i_1_n_1\,
      CO(1) => \counters_reg[6][16]_i_1_n_2\,
      CO(0) => \counters_reg[6][16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[6][16]_i_1_n_4\,
      O(2) => \counters_reg[6][16]_i_1_n_5\,
      O(1) => \counters_reg[6][16]_i_1_n_6\,
      O(0) => \counters_reg[6][16]_i_1_n_7\,
      S(3) => \counters[6][16]_i_2_n_0\,
      S(2) => \counters[6][16]_i_3_n_0\,
      S(1) => \counters[6][16]_i_4_n_0\,
      S(0) => \counters[6][16]_i_5_n_0\
    );
\counters_reg[6][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][20]_i_1_n_7\,
      Q => \counters_reg[6]__0\(17),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][20]_i_1_n_6\,
      Q => \counters_reg[6]__0\(18),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][20]_i_1_n_5\,
      Q => \counters_reg[6]__0\(19),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][4]_i_1_n_7\,
      Q => \counters_reg[6]__0\(1),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][20]_i_1_n_4\,
      Q => \counters_reg[6]__0\(20),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[6][16]_i_1_n_0\,
      CO(3) => \counters_reg[6][20]_i_1_n_0\,
      CO(2) => \counters_reg[6][20]_i_1_n_1\,
      CO(1) => \counters_reg[6][20]_i_1_n_2\,
      CO(0) => \counters_reg[6][20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[6][20]_i_1_n_4\,
      O(2) => \counters_reg[6][20]_i_1_n_5\,
      O(1) => \counters_reg[6][20]_i_1_n_6\,
      O(0) => \counters_reg[6][20]_i_1_n_7\,
      S(3) => \counters[6][20]_i_2_n_0\,
      S(2) => \counters[6][20]_i_3_n_0\,
      S(1) => \counters[6][20]_i_4_n_0\,
      S(0) => \counters[6][20]_i_5_n_0\
    );
\counters_reg[6][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][24]_i_1_n_7\,
      Q => \counters_reg[6]__0\(21),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][24]_i_1_n_6\,
      Q => \counters_reg[6]__0\(22),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][24]_i_1_n_5\,
      Q => \counters_reg[6]__0\(23),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][24]_i_1_n_4\,
      Q => \counters_reg[6]__0\(24),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[6][20]_i_1_n_0\,
      CO(3) => \counters_reg[6][24]_i_1_n_0\,
      CO(2) => \counters_reg[6][24]_i_1_n_1\,
      CO(1) => \counters_reg[6][24]_i_1_n_2\,
      CO(0) => \counters_reg[6][24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[6][24]_i_1_n_4\,
      O(2) => \counters_reg[6][24]_i_1_n_5\,
      O(1) => \counters_reg[6][24]_i_1_n_6\,
      O(0) => \counters_reg[6][24]_i_1_n_7\,
      S(3) => \counters[6][24]_i_2_n_0\,
      S(2) => \counters[6][24]_i_3_n_0\,
      S(1) => \counters[6][24]_i_4_n_0\,
      S(0) => \counters[6][24]_i_5_n_0\
    );
\counters_reg[6][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][28]_i_1_n_7\,
      Q => \counters_reg[6]__0\(25),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][28]_i_1_n_6\,
      Q => \counters_reg[6]__0\(26),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][28]_i_1_n_5\,
      Q => \counters_reg[6]__0\(27),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][28]_i_1_n_4\,
      Q => \counters_reg[6]__0\(28),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[6][24]_i_1_n_0\,
      CO(3) => \counters_reg[6][28]_i_1_n_0\,
      CO(2) => \counters_reg[6][28]_i_1_n_1\,
      CO(1) => \counters_reg[6][28]_i_1_n_2\,
      CO(0) => \counters_reg[6][28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[6][28]_i_1_n_4\,
      O(2) => \counters_reg[6][28]_i_1_n_5\,
      O(1) => \counters_reg[6][28]_i_1_n_6\,
      O(0) => \counters_reg[6][28]_i_1_n_7\,
      S(3) => \counters[6][28]_i_2_n_0\,
      S(2) => \counters[6][28]_i_3_n_0\,
      S(1) => \counters[6][28]_i_4_n_0\,
      S(0) => \counters[6][28]_i_5_n_0\
    );
\counters_reg[6][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][30]_i_2_n_7\,
      Q => \counters_reg[6]__0\(29),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][4]_i_1_n_6\,
      Q => \counters_reg[6]__0\(2),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][30]_i_2_n_6\,
      Q => \counters_reg[6]__0\(30),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][30]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[6][28]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counters_reg[6][30]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counters_reg[6][30]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counters_reg[6][30]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1) => \counters_reg[6][30]_i_2_n_6\,
      O(0) => \counters_reg[6][30]_i_2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \counters[6][30]_i_3_n_0\,
      S(0) => \counters[6][30]_i_4_n_0\
    );
\counters_reg[6][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][4]_i_1_n_5\,
      Q => \counters_reg[6]__0\(3),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][4]_i_1_n_4\,
      Q => \counters_reg[6]__0\(4),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counters_reg[6][4]_i_1_n_0\,
      CO(2) => \counters_reg[6][4]_i_1_n_1\,
      CO(1) => \counters_reg[6][4]_i_1_n_2\,
      CO(0) => \counters_reg[6][4]_i_1_n_3\,
      CYINIT => \counters_reg[6]__0\(0),
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[6][4]_i_1_n_4\,
      O(2) => \counters_reg[6][4]_i_1_n_5\,
      O(1) => \counters_reg[6][4]_i_1_n_6\,
      O(0) => \counters_reg[6][4]_i_1_n_7\,
      S(3) => \counters[6][4]_i_2_n_0\,
      S(2) => \counters[6][4]_i_3_n_0\,
      S(1) => \counters[6][4]_i_4_n_0\,
      S(0) => \counters[6][4]_i_5_n_0\
    );
\counters_reg[6][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][8]_i_1_n_7\,
      Q => \counters_reg[6]__0\(5),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][8]_i_1_n_6\,
      Q => \counters_reg[6]__0\(6),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][8]_i_1_n_5\,
      Q => \counters_reg[6]__0\(7),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][8]_i_1_n_4\,
      Q => \counters_reg[6]__0\(8),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[6][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[6][4]_i_1_n_0\,
      CO(3) => \counters_reg[6][8]_i_1_n_0\,
      CO(2) => \counters_reg[6][8]_i_1_n_1\,
      CO(1) => \counters_reg[6][8]_i_1_n_2\,
      CO(0) => \counters_reg[6][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[6][8]_i_1_n_4\,
      O(2) => \counters_reg[6][8]_i_1_n_5\,
      O(1) => \counters_reg[6][8]_i_1_n_6\,
      O(0) => \counters_reg[6][8]_i_1_n_7\,
      S(3) => \counters[6][8]_i_2_n_0\,
      S(2) => \counters[6][8]_i_3_n_0\,
      S(1) => \counters[6][8]_i_4_n_0\,
      S(0) => \counters[6][8]_i_5_n_0\
    );
\counters_reg[6][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[6][12]_i_1_n_7\,
      Q => \counters_reg[6]__0\(9),
      R => \counters[6][30]_i_1_n_0\
    );
\counters_reg[7][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters[7]\(0),
      Q => \counters_reg[7]__0\(0),
      R => '0'
    );
\counters_reg[7][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][12]_i_1_n_6\,
      Q => \counters_reg[7]__0\(10),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][12]_i_1_n_5\,
      Q => \counters_reg[7]__0\(11),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][12]_i_1_n_4\,
      Q => \counters_reg[7]__0\(12),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[7][8]_i_1_n_0\,
      CO(3) => \counters_reg[7][12]_i_1_n_0\,
      CO(2) => \counters_reg[7][12]_i_1_n_1\,
      CO(1) => \counters_reg[7][12]_i_1_n_2\,
      CO(0) => \counters_reg[7][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[7][12]_i_1_n_4\,
      O(2) => \counters_reg[7][12]_i_1_n_5\,
      O(1) => \counters_reg[7][12]_i_1_n_6\,
      O(0) => \counters_reg[7][12]_i_1_n_7\,
      S(3) => \counters[7][12]_i_2_n_0\,
      S(2) => \counters[7][12]_i_3_n_0\,
      S(1) => \counters[7][12]_i_4_n_0\,
      S(0) => \counters[7][12]_i_5_n_0\
    );
\counters_reg[7][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][16]_i_1_n_7\,
      Q => \counters_reg[7]__0\(13),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][16]_i_1_n_6\,
      Q => \counters_reg[7]__0\(14),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][16]_i_1_n_5\,
      Q => \counters_reg[7]__0\(15),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][16]_i_1_n_4\,
      Q => \counters_reg[7]__0\(16),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[7][12]_i_1_n_0\,
      CO(3) => \counters_reg[7][16]_i_1_n_0\,
      CO(2) => \counters_reg[7][16]_i_1_n_1\,
      CO(1) => \counters_reg[7][16]_i_1_n_2\,
      CO(0) => \counters_reg[7][16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[7][16]_i_1_n_4\,
      O(2) => \counters_reg[7][16]_i_1_n_5\,
      O(1) => \counters_reg[7][16]_i_1_n_6\,
      O(0) => \counters_reg[7][16]_i_1_n_7\,
      S(3) => \counters[7][16]_i_2_n_0\,
      S(2) => \counters[7][16]_i_3_n_0\,
      S(1) => \counters[7][16]_i_4_n_0\,
      S(0) => \counters[7][16]_i_5_n_0\
    );
\counters_reg[7][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][20]_i_1_n_7\,
      Q => \counters_reg[7]__0\(17),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][20]_i_1_n_6\,
      Q => \counters_reg[7]__0\(18),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][20]_i_1_n_5\,
      Q => \counters_reg[7]__0\(19),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][4]_i_1_n_7\,
      Q => \counters_reg[7]__0\(1),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][20]_i_1_n_4\,
      Q => \counters_reg[7]__0\(20),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[7][16]_i_1_n_0\,
      CO(3) => \counters_reg[7][20]_i_1_n_0\,
      CO(2) => \counters_reg[7][20]_i_1_n_1\,
      CO(1) => \counters_reg[7][20]_i_1_n_2\,
      CO(0) => \counters_reg[7][20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[7][20]_i_1_n_4\,
      O(2) => \counters_reg[7][20]_i_1_n_5\,
      O(1) => \counters_reg[7][20]_i_1_n_6\,
      O(0) => \counters_reg[7][20]_i_1_n_7\,
      S(3) => \counters[7][20]_i_2_n_0\,
      S(2) => \counters[7][20]_i_3_n_0\,
      S(1) => \counters[7][20]_i_4_n_0\,
      S(0) => \counters[7][20]_i_5_n_0\
    );
\counters_reg[7][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][24]_i_1_n_7\,
      Q => \counters_reg[7]__0\(21),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][24]_i_1_n_6\,
      Q => \counters_reg[7]__0\(22),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][24]_i_1_n_5\,
      Q => \counters_reg[7]__0\(23),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][24]_i_1_n_4\,
      Q => \counters_reg[7]__0\(24),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[7][20]_i_1_n_0\,
      CO(3) => \counters_reg[7][24]_i_1_n_0\,
      CO(2) => \counters_reg[7][24]_i_1_n_1\,
      CO(1) => \counters_reg[7][24]_i_1_n_2\,
      CO(0) => \counters_reg[7][24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[7][24]_i_1_n_4\,
      O(2) => \counters_reg[7][24]_i_1_n_5\,
      O(1) => \counters_reg[7][24]_i_1_n_6\,
      O(0) => \counters_reg[7][24]_i_1_n_7\,
      S(3) => \counters[7][24]_i_2_n_0\,
      S(2) => \counters[7][24]_i_3_n_0\,
      S(1) => \counters[7][24]_i_4_n_0\,
      S(0) => \counters[7][24]_i_5_n_0\
    );
\counters_reg[7][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][28]_i_1_n_7\,
      Q => \counters_reg[7]__0\(25),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][28]_i_1_n_6\,
      Q => \counters_reg[7]__0\(26),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][28]_i_1_n_5\,
      Q => \counters_reg[7]__0\(27),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][28]_i_1_n_4\,
      Q => \counters_reg[7]__0\(28),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[7][24]_i_1_n_0\,
      CO(3) => \counters_reg[7][28]_i_1_n_0\,
      CO(2) => \counters_reg[7][28]_i_1_n_1\,
      CO(1) => \counters_reg[7][28]_i_1_n_2\,
      CO(0) => \counters_reg[7][28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[7][28]_i_1_n_4\,
      O(2) => \counters_reg[7][28]_i_1_n_5\,
      O(1) => \counters_reg[7][28]_i_1_n_6\,
      O(0) => \counters_reg[7][28]_i_1_n_7\,
      S(3) => \counters[7][28]_i_2_n_0\,
      S(2) => \counters[7][28]_i_3_n_0\,
      S(1) => \counters[7][28]_i_4_n_0\,
      S(0) => \counters[7][28]_i_5_n_0\
    );
\counters_reg[7][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][30]_i_2_n_7\,
      Q => \counters_reg[7]__0\(29),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][4]_i_1_n_6\,
      Q => \counters_reg[7]__0\(2),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][30]_i_2_n_6\,
      Q => \counters_reg[7]__0\(30),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][30]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[7][28]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counters_reg[7][30]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counters_reg[7][30]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counters_reg[7][30]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1) => \counters_reg[7][30]_i_2_n_6\,
      O(0) => \counters_reg[7][30]_i_2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \counters[7][30]_i_3_n_0\,
      S(0) => \counters[7][30]_i_4_n_0\
    );
\counters_reg[7][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][4]_i_1_n_5\,
      Q => \counters_reg[7]__0\(3),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][4]_i_1_n_4\,
      Q => \counters_reg[7]__0\(4),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counters_reg[7][4]_i_1_n_0\,
      CO(2) => \counters_reg[7][4]_i_1_n_1\,
      CO(1) => \counters_reg[7][4]_i_1_n_2\,
      CO(0) => \counters_reg[7][4]_i_1_n_3\,
      CYINIT => \counters_reg[7]__0\(0),
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[7][4]_i_1_n_4\,
      O(2) => \counters_reg[7][4]_i_1_n_5\,
      O(1) => \counters_reg[7][4]_i_1_n_6\,
      O(0) => \counters_reg[7][4]_i_1_n_7\,
      S(3) => \counters[7][4]_i_2_n_0\,
      S(2) => \counters[7][4]_i_3_n_0\,
      S(1) => \counters[7][4]_i_4_n_0\,
      S(0) => \counters[7][4]_i_5_n_0\
    );
\counters_reg[7][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][8]_i_1_n_7\,
      Q => \counters_reg[7]__0\(5),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][8]_i_1_n_6\,
      Q => \counters_reg[7]__0\(6),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][8]_i_1_n_5\,
      Q => \counters_reg[7]__0\(7),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][8]_i_1_n_4\,
      Q => \counters_reg[7]__0\(8),
      R => \counters[7][30]_i_1_n_0\
    );
\counters_reg[7][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counters_reg[7][4]_i_1_n_0\,
      CO(3) => \counters_reg[7][8]_i_1_n_0\,
      CO(2) => \counters_reg[7][8]_i_1_n_1\,
      CO(1) => \counters_reg[7][8]_i_1_n_2\,
      CO(0) => \counters_reg[7][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counters_reg[7][8]_i_1_n_4\,
      O(2) => \counters_reg[7][8]_i_1_n_5\,
      O(1) => \counters_reg[7][8]_i_1_n_6\,
      O(0) => \counters_reg[7][8]_i_1_n_7\,
      S(3) => \counters[7][8]_i_2_n_0\,
      S(2) => \counters[7][8]_i_3_n_0\,
      S(1) => \counters[7][8]_i_4_n_0\,
      S(0) => \counters[7][8]_i_5_n_0\
    );
\counters_reg[7][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \counters_reg[7][12]_i_1_n_7\,
      Q => \counters_reg[7]__0\(9),
      R => \counters[7][30]_i_1_n_0\
    );
\led_output_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_output_OBUF(0),
      O => led_output(0)
    );
\led_output_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_output_OBUF(1),
      O => led_output(1)
    );
\led_output_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_output_OBUF(2),
      O => led_output(2)
    );
\led_output_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_output_OBUF(3),
      O => led_output(3)
    );
\led_output_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_output_OBUF(4),
      O => led_output(4)
    );
\led_output_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_output_OBUF(5),
      O => led_output(5)
    );
\led_output_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_output_OBUF(6),
      O => led_output(6)
    );
\led_output_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_output_OBUF(7),
      O => led_output(7)
    );
\led_output_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => pwm_values(0),
      Q => led_output_OBUF(0),
      R => '0'
    );
\led_output_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => pwm_values(1),
      Q => led_output_OBUF(1),
      R => '0'
    );
\led_output_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => pwm_values(2),
      Q => led_output_OBUF(2),
      R => '0'
    );
\led_output_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => pwm_values(3),
      Q => led_output_OBUF(3),
      R => '0'
    );
\led_output_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => pwm_values(4),
      Q => led_output_OBUF(4),
      R => '0'
    );
\led_output_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => pwm_values(5),
      Q => led_output_OBUF(5),
      R => '0'
    );
\led_output_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => pwm_values(6),
      Q => led_output_OBUF(6),
      R => '0'
    );
\led_output_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => pwm_values(7),
      Q => led_output_OBUF(7),
      R => '0'
    );
\pwm_values[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAABBAAFB"
    )
        port map (
      I0 => \pwm_values[0]_i_2_n_0\,
      I1 => \counters_reg[0]__0\(28),
      I2 => \pwm_values[0]_i_3_n_0\,
      I3 => \counters_reg[0]__0\(29),
      I4 => \counters_reg[0]__0\(27),
      I5 => \counters_reg[0]__0\(30),
      O => p_0_out(0)
    );
\pwm_values[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0202020202020222"
    )
        port map (
      I0 => \pwm_values[0]_i_4_n_0\,
      I1 => \pwm_values[0]_i_5_n_0\,
      I2 => \counters_reg[0]__0\(10),
      I3 => \counters_reg[0]__0\(0),
      I4 => \pwm_values[0]_i_6_n_0\,
      I5 => \counters[0][0]_i_8_n_0\,
      O => \pwm_values[0]_i_2_n_0\
    );
\pwm_values[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF4F"
    )
        port map (
      I0 => \counters_reg[0]__0\(21),
      I1 => \pwm_values[0]_i_7_n_0\,
      I2 => \counters_reg[0]__0\(22),
      I3 => \counters[0][0]_i_4_n_0\,
      O => \pwm_values[0]_i_3_n_0\
    );
\pwm_values[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counters_reg[0]__0\(11),
      I1 => \counters_reg[0]__0\(19),
      I2 => \counters_reg[0]__0\(21),
      I3 => \counters_reg[0]__0\(29),
      I4 => \counters_reg[0]__0\(27),
      O => \pwm_values[0]_i_4_n_0\
    );
\pwm_values[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters_reg[0]__0\(13),
      I1 => \counters_reg[0]__0\(12),
      I2 => \counters_reg[0]__0\(30),
      I3 => \counters_reg[0]__0\(14),
      O => \pwm_values[0]_i_5_n_0\
    );
\pwm_values[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters_reg[0]__0\(5),
      I1 => \counters_reg[0]__0\(4),
      I2 => \counters_reg[0]__0\(7),
      I3 => \counters_reg[0]__0\(6),
      O => \pwm_values[0]_i_6_n_0\
    );
\pwm_values[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"15555555FFFFFFFF"
    )
        port map (
      I0 => \counters_reg[0]__0\(19),
      I1 => \counters_reg[0]__0\(16),
      I2 => \counters_reg[0]__0\(17),
      I3 => \counters_reg[0]__0\(18),
      I4 => \counters_reg[0]__0\(15),
      I5 => \counters_reg[0]__0\(20),
      O => \pwm_values[0]_i_7_n_0\
    );
\pwm_values[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAEEFE"
    )
        port map (
      I0 => \pwm_values[1]_i_2_n_0\,
      I1 => \pwm_values[1]_i_3_n_0\,
      I2 => \pwm_values[1]_i_4_n_0\,
      I3 => \pwm_values[1]_i_5_n_0\,
      I4 => \pwm_values[1]_i_6_n_0\,
      I5 => \pwm_values[1]_i_7_n_0\,
      O => p_0_out(1)
    );
\pwm_values[1]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \counters_reg[1]__0\(16),
      I1 => \counters_reg[1]__0\(17),
      O => \pwm_values[1]_i_10_n_0\
    );
\pwm_values[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => \counters_reg[1]__0\(28),
      I1 => \counters_reg[1]__0\(26),
      I2 => \counters_reg[1]__0\(27),
      O => \pwm_values[1]_i_2_n_0\
    );
\pwm_values[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => \counters_reg[1]__0\(16),
      I1 => \counters_reg[1]__0\(17),
      I2 => \counters_reg[1]__0\(15),
      I3 => \pwm_values[1]_i_8_n_0\,
      O => \pwm_values[1]_i_3_n_0\
    );
\pwm_values[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0100"
    )
        port map (
      I0 => \counters_reg[1]__0\(5),
      I1 => \counters_reg[1]__0\(6),
      I2 => \counters_reg[1]__0\(4),
      I3 => \counters[1][30]_i_12_n_0\,
      I4 => \pwm_values[1]_i_9_n_0\,
      O => \pwm_values[1]_i_4_n_0\
    );
\pwm_values[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFE0"
    )
        port map (
      I0 => \counters_reg[1]__0\(10),
      I1 => \counters_reg[1]__0\(11),
      I2 => \counters_reg[1]__0\(12),
      I3 => \counters_reg[1]__0\(13),
      I4 => \counters_reg[1]__0\(14),
      I5 => \pwm_values[1]_i_10_n_0\,
      O => \pwm_values[1]_i_5_n_0\
    );
\pwm_values[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF80"
    )
        port map (
      I0 => \counters_reg[1]__0\(23),
      I1 => \counters_reg[1]__0\(22),
      I2 => \counters_reg[1]__0\(21),
      I3 => \counters_reg[1]__0\(27),
      I4 => \counters_reg[1]__0\(24),
      I5 => \counters_reg[1]__0\(25),
      O => \pwm_values[1]_i_6_n_0\
    );
\pwm_values[1]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \counters_reg[1]__0\(30),
      I1 => \counters_reg[1]__0\(29),
      O => \pwm_values[1]_i_7_n_0\
    );
\pwm_values[1]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \counters_reg[1]__0\(19),
      I1 => \counters_reg[1]__0\(20),
      I2 => \counters_reg[1]__0\(18),
      I3 => \counters_reg[1]__0\(23),
      I4 => \counters_reg[1]__0\(22),
      O => \pwm_values[1]_i_8_n_0\
    );
\pwm_values[1]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \counters_reg[1]__0\(7),
      I1 => \counters_reg[1]__0\(9),
      I2 => \counters_reg[1]__0\(12),
      I3 => \counters_reg[1]__0\(8),
      O => \pwm_values[1]_i_9_n_0\
    );
\pwm_values[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2202"
    )
        port map (
      I0 => \pwm_values[2]_i_2_n_0\,
      I1 => \pwm_values[2]_i_3_n_0\,
      I2 => \counters_reg[2]__0\(8),
      I3 => \pwm_values[2]_i_4_n_0\,
      I4 => \pwm_values[2]_i_5_n_0\,
      I5 => \pwm_values[2]_i_6_n_0\,
      O => p_0_out(2)
    );
\pwm_values[2]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FFF"
    )
        port map (
      I0 => \counters_reg[2]__0\(14),
      I1 => \counters_reg[2]__0\(13),
      I2 => \counters_reg[2]__0\(16),
      I3 => \counters_reg[2]__0\(15),
      O => \pwm_values[2]_i_10_n_0\
    );
\pwm_values[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counters_reg[2]__0\(10),
      I1 => \counters_reg[2]__0\(14),
      I2 => \counters_reg[2]__0\(17),
      I3 => \counters_reg[2]__0\(29),
      I4 => \counters_reg[2]__0\(25),
      O => \pwm_values[2]_i_2_n_0\
    );
\pwm_values[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \counters_reg[2]__0\(12),
      I1 => \counters_reg[2]__0\(11),
      I2 => \counters[2][0]_i_6_n_0\,
      O => \pwm_values[2]_i_3_n_0\
    );
\pwm_values[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000001FFFFFFFF"
    )
        port map (
      I0 => \counters_reg[2]__0\(0),
      I1 => \counters[2][0]_i_7_n_0\,
      I2 => \counters_reg[2]__0\(1),
      I3 => \counters_reg[2]__0\(6),
      I4 => \counters_reg[2]__0\(7),
      I5 => \counters_reg[2]__0\(9),
      O => \pwm_values[2]_i_4_n_0\
    );
\pwm_values[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222F000022220000"
    )
        port map (
      I0 => \pwm_values[2]_i_7_n_0\,
      I1 => \pwm_values[2]_i_8_n_0\,
      I2 => \counters[2][0]_i_6_n_0\,
      I3 => \counters_reg[2]__0\(17),
      I4 => \pwm_values[2]_i_9_n_0\,
      I5 => \pwm_values[2]_i_10_n_0\,
      O => \pwm_values[2]_i_5_n_0\
    );
\pwm_values[2]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \counters_reg[2]__0\(30),
      I1 => \counters_reg[2]__0\(29),
      I2 => \counters_reg[2]__0\(28),
      O => \pwm_values[2]_i_6_n_0\
    );
\pwm_values[2]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \counters_reg[2]__0\(22),
      I1 => \counters_reg[2]__0\(23),
      I2 => \counters_reg[2]__0\(24),
      I3 => \counters_reg[2]__0\(21),
      O => \pwm_values[2]_i_7_n_0\
    );
\pwm_values[2]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \counters_reg[2]__0\(30),
      I1 => \counters_reg[2]__0\(27),
      I2 => \counters_reg[2]__0\(26),
      O => \pwm_values[2]_i_8_n_0\
    );
\pwm_values[2]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counters_reg[2]__0\(25),
      I1 => \counters_reg[2]__0\(29),
      O => \pwm_values[2]_i_9_n_0\
    );
\pwm_values[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => \pwm_values[3]_i_2_n_0\,
      I1 => \pwm_values[3]_i_3_n_0\,
      I2 => \pwm_values[3]_i_4_n_0\,
      I3 => \pwm_values[3]_i_5_n_0\,
      I4 => \pwm_values[3]_i_6_n_0\,
      O => p_0_out(3)
    );
\pwm_values[3]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters_reg[3]__0\(20),
      I1 => \counters_reg[3]__0\(29),
      I2 => \counters_reg[3]__0\(30),
      I3 => \counters_reg[3]__0\(11),
      O => \pwm_values[3]_i_10_n_0\
    );
\pwm_values[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010101000101010"
    )
        port map (
      I0 => \pwm_values[3]_i_7_n_0\,
      I1 => \counters_reg[3]__0\(20),
      I2 => \pwm_values[3]_i_8_n_0\,
      I3 => \counters_reg[3]__0\(17),
      I4 => \counters_reg[3]__0\(18),
      I5 => \pwm_values[3]_i_9_n_0\,
      O => \pwm_values[3]_i_2_n_0\
    );
\pwm_values[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001010101010101"
    )
        port map (
      I0 => \pwm_values[3]_i_7_n_0\,
      I1 => \counters_reg[3]__0\(24),
      I2 => \counters_reg[3]__0\(28),
      I3 => \counters_reg[3]__0\(21),
      I4 => \counters_reg[3]__0\(22),
      I5 => \counters_reg[3]__0\(23),
      O => \pwm_values[3]_i_3_n_0\
    );
\pwm_values[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001010101010101"
    )
        port map (
      I0 => \counters_reg[3]__0\(28),
      I1 => \counters_reg[3]__0\(29),
      I2 => \counters_reg[3]__0\(30),
      I3 => \counters_reg[3]__0\(25),
      I4 => \counters_reg[3]__0\(26),
      I5 => \counters_reg[3]__0\(27),
      O => \pwm_values[3]_i_4_n_0\
    );
\pwm_values[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000001FFFFF"
    )
        port map (
      I0 => \counters_reg[3]__0\(0),
      I1 => \counters[3][0]_i_7_n_0\,
      I2 => \counters_reg[3]__0\(7),
      I3 => \counters_reg[3]__0\(8),
      I4 => \counters_reg[3]__0\(9),
      I5 => \pwm_values[3]_i_10_n_0\,
      O => \pwm_values[3]_i_5_n_0\
    );
\pwm_values[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \counters_reg[3]__0\(10),
      I1 => \counters_reg[3]__0\(14),
      I2 => \counters_reg[3]__0\(16),
      I3 => \counters_reg[3]__0\(19),
      I4 => \counters_reg[3]__0\(24),
      I5 => \counters_reg[3]__0\(28),
      O => \pwm_values[3]_i_6_n_0\
    );
\pwm_values[3]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \counters_reg[3]__0\(29),
      I1 => \counters_reg[3]__0\(30),
      O => \pwm_values[3]_i_7_n_0\
    );
\pwm_values[3]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \counters_reg[3]__0\(28),
      I1 => \counters_reg[3]__0\(24),
      I2 => \counters_reg[3]__0\(19),
      O => \pwm_values[3]_i_8_n_0\
    );
\pwm_values[3]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000557F"
    )
        port map (
      I0 => \counters_reg[3]__0\(15),
      I1 => \counters_reg[3]__0\(13),
      I2 => \counters_reg[3]__0\(12),
      I3 => \counters_reg[3]__0\(14),
      I4 => \counters_reg[3]__0\(16),
      O => \pwm_values[3]_i_9_n_0\
    );
\pwm_values[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAABBAAFB"
    )
        port map (
      I0 => \pwm_values[4]_i_2_n_0\,
      I1 => \counters_reg[4]__0\(27),
      I2 => \pwm_values[4]_i_3_n_0\,
      I3 => \counters_reg[4]__0\(28),
      I4 => \counters_reg[4]__0\(26),
      I5 => \pwm_values[4]_i_4_n_0\,
      O => p_0_out(4)
    );
\pwm_values[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0202020202020222"
    )
        port map (
      I0 => \pwm_values[4]_i_5_n_0\,
      I1 => \pwm_values[4]_i_6_n_0\,
      I2 => \counters_reg[4]__0\(9),
      I3 => \counters_reg[4]__0\(0),
      I4 => \counters[4][0]_i_8_n_0\,
      I5 => \pwm_values[4]_i_7_n_0\,
      O => \pwm_values[4]_i_2_n_0\
    );
\pwm_values[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF4F"
    )
        port map (
      I0 => \counters_reg[4]__0\(20),
      I1 => \pwm_values[4]_i_8_n_0\,
      I2 => \counters_reg[4]__0\(21),
      I3 => \counters[4][0]_i_7_n_0\,
      O => \pwm_values[4]_i_3_n_0\
    );
\pwm_values[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \counters_reg[4]__0\(29),
      I1 => \counters_reg[4]__0\(30),
      O => \pwm_values[4]_i_4_n_0\
    );
\pwm_values[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counters_reg[4]__0\(10),
      I1 => \counters_reg[4]__0\(18),
      I2 => \counters_reg[4]__0\(20),
      I3 => \counters_reg[4]__0\(28),
      I4 => \counters_reg[4]__0\(26),
      O => \pwm_values[4]_i_5_n_0\
    );
\pwm_values[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \counters_reg[4]__0\(11),
      I1 => \counters_reg[4]__0\(29),
      I2 => \counters_reg[4]__0\(30),
      I3 => \counters_reg[4]__0\(13),
      I4 => \counters_reg[4]__0\(12),
      O => \pwm_values[4]_i_6_n_0\
    );
\pwm_values[4]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters_reg[4]__0\(2),
      I1 => \counters_reg[4]__0\(1),
      I2 => \counters_reg[4]__0\(4),
      I3 => \counters_reg[4]__0\(3),
      O => \pwm_values[4]_i_7_n_0\
    );
\pwm_values[4]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"15555555FFFFFFFF"
    )
        port map (
      I0 => \counters_reg[4]__0\(18),
      I1 => \counters_reg[4]__0\(15),
      I2 => \counters_reg[4]__0\(16),
      I3 => \counters_reg[4]__0\(17),
      I4 => \counters_reg[4]__0\(14),
      I5 => \counters_reg[4]__0\(19),
      O => \pwm_values[4]_i_8_n_0\
    );
\pwm_values[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2202"
    )
        port map (
      I0 => \pwm_values[5]_i_2_n_0\,
      I1 => \counters[5][0]_i_2_n_0\,
      I2 => \counters_reg[5]__0\(7),
      I3 => \pwm_values[5]_i_3_n_0\,
      I4 => \pwm_values[5]_i_4_n_0\,
      I5 => \pwm_values[5]_i_5_n_0\,
      O => p_0_out(5)
    );
\pwm_values[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counters_reg[5]__0\(9),
      I1 => \counters_reg[5]__0\(13),
      I2 => \counters_reg[5]__0\(16),
      I3 => \counters_reg[5]__0\(28),
      I4 => \counters_reg[5]__0\(24),
      O => \pwm_values[5]_i_2_n_0\
    );
\pwm_values[5]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => \counters_reg[5]__0\(0),
      I1 => \counters[5][0]_i_3_n_0\,
      I2 => \counters_reg[5]__0\(8),
      O => \pwm_values[5]_i_3_n_0\
    );
\pwm_values[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0B00000A0A0000"
    )
        port map (
      I0 => \pwm_values[5]_i_6_n_0\,
      I1 => \pwm_values[5]_i_7_n_0\,
      I2 => \counters[5][0]_i_6_n_0\,
      I3 => \counters_reg[5]__0\(16),
      I4 => \pwm_values[5]_i_8_n_0\,
      I5 => \pwm_values[5]_i_9_n_0\,
      O => \pwm_values[5]_i_4_n_0\
    );
\pwm_values[5]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \counters_reg[5]__0\(28),
      I1 => \counters_reg[5]__0\(27),
      I2 => \counters_reg[5]__0\(30),
      I3 => \counters_reg[5]__0\(29),
      O => \pwm_values[5]_i_5_n_0\
    );
\pwm_values[5]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \counters_reg[5]__0\(21),
      I1 => \counters_reg[5]__0\(22),
      I2 => \counters_reg[5]__0\(23),
      I3 => \counters_reg[5]__0\(20),
      O => \pwm_values[5]_i_6_n_0\
    );
\pwm_values[5]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \counters_reg[5]__0\(19),
      I1 => \counters_reg[5]__0\(18),
      I2 => \counters_reg[5]__0\(17),
      O => \pwm_values[5]_i_7_n_0\
    );
\pwm_values[5]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counters_reg[5]__0\(24),
      I1 => \counters_reg[5]__0\(28),
      O => \pwm_values[5]_i_8_n_0\
    );
\pwm_values[5]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FFF"
    )
        port map (
      I0 => \counters_reg[5]__0\(13),
      I1 => \counters_reg[5]__0\(12),
      I2 => \counters_reg[5]__0\(15),
      I3 => \counters_reg[5]__0\(14),
      O => \pwm_values[5]_i_9_n_0\
    );
\pwm_values[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAABBAAFB"
    )
        port map (
      I0 => \pwm_values[6]_i_2_n_0\,
      I1 => \counters_reg[6]__0\(26),
      I2 => \pwm_values[6]_i_3_n_0\,
      I3 => \counters_reg[6]__0\(27),
      I4 => \counters_reg[6]__0\(25),
      I5 => \pwm_values[6]_i_4_n_0\,
      O => p_0_out(6)
    );
\pwm_values[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0202020202020222"
    )
        port map (
      I0 => \pwm_values[6]_i_5_n_0\,
      I1 => \counters[6][0]_i_5_n_0\,
      I2 => \counters_reg[6]__0\(8),
      I3 => \counters_reg[6]__0\(0),
      I4 => \pwm_values[6]_i_6_n_0\,
      I5 => \counters[6][0]_i_8_n_0\,
      O => \pwm_values[6]_i_2_n_0\
    );
\pwm_values[6]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF4F"
    )
        port map (
      I0 => \counters_reg[6]__0\(19),
      I1 => \pwm_values[6]_i_7_n_0\,
      I2 => \counters_reg[6]__0\(20),
      I3 => \counters[6][0]_i_7_n_0\,
      O => \pwm_values[6]_i_3_n_0\
    );
\pwm_values[6]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \counters_reg[6]__0\(30),
      I1 => \counters_reg[6]__0\(29),
      I2 => \counters_reg[6]__0\(28),
      O => \pwm_values[6]_i_4_n_0\
    );
\pwm_values[6]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counters_reg[6]__0\(9),
      I1 => \counters_reg[6]__0\(17),
      I2 => \counters_reg[6]__0\(19),
      I3 => \counters_reg[6]__0\(27),
      I4 => \counters_reg[6]__0\(25),
      O => \pwm_values[6]_i_5_n_0\
    );
\pwm_values[6]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \counters_reg[6]__0\(7),
      I1 => \counters_reg[6]__0\(6),
      I2 => \counters_reg[6]__0\(1),
      O => \pwm_values[6]_i_6_n_0\
    );
\pwm_values[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"15555555FFFFFFFF"
    )
        port map (
      I0 => \counters_reg[6]__0\(17),
      I1 => \counters_reg[6]__0\(14),
      I2 => \counters_reg[6]__0\(15),
      I3 => \counters_reg[6]__0\(16),
      I4 => \counters_reg[6]__0\(13),
      I5 => \counters_reg[6]__0\(18),
      O => \pwm_values[6]_i_7_n_0\
    );
\pwm_values[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAABBAAFB"
    )
        port map (
      I0 => \pwm_values[7]_i_2_n_0\,
      I1 => \counters_reg[7]__0\(25),
      I2 => \pwm_values[7]_i_3_n_0\,
      I3 => \counters_reg[7]__0\(26),
      I4 => \counters_reg[7]__0\(24),
      I5 => \pwm_values[7]_i_4_n_0\,
      O => pwm_values0
    );
\pwm_values[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000200020202"
    )
        port map (
      I0 => \pwm_values[7]_i_5_n_0\,
      I1 => \pwm_values[7]_i_4_n_0\,
      I2 => \pwm_values[7]_i_6_n_0\,
      I3 => \counters_reg[7]__0\(7),
      I4 => \counters_reg[7]__0\(0),
      I5 => \counters[7][0]_i_7_n_0\,
      O => \pwm_values[7]_i_2_n_0\
    );
\pwm_values[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF4F"
    )
        port map (
      I0 => \counters_reg[7]__0\(18),
      I1 => \pwm_values[7]_i_7_n_0\,
      I2 => \counters_reg[7]__0\(19),
      I3 => \counters[7][0]_i_4_n_0\,
      O => \pwm_values[7]_i_3_n_0\
    );
\pwm_values[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counters_reg[7]__0\(28),
      I1 => \counters_reg[7]__0\(27),
      I2 => \counters_reg[7]__0\(30),
      I3 => \counters_reg[7]__0\(29),
      O => \pwm_values[7]_i_4_n_0\
    );
\pwm_values[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counters_reg[7]__0\(8),
      I1 => \counters_reg[7]__0\(16),
      I2 => \counters_reg[7]__0\(18),
      I3 => \counters_reg[7]__0\(26),
      I4 => \counters_reg[7]__0\(24),
      O => \pwm_values[7]_i_5_n_0\
    );
\pwm_values[7]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \counters_reg[7]__0\(11),
      I1 => \counters_reg[7]__0\(10),
      I2 => \counters_reg[7]__0\(9),
      O => \pwm_values[7]_i_6_n_0\
    );
\pwm_values[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"15555555FFFFFFFF"
    )
        port map (
      I0 => \counters_reg[7]__0\(16),
      I1 => \counters_reg[7]__0\(13),
      I2 => \counters_reg[7]__0\(14),
      I3 => \counters_reg[7]__0\(15),
      I4 => \counters_reg[7]__0\(12),
      I5 => \counters_reg[7]__0\(17),
      O => \pwm_values[7]_i_7_n_0\
    );
\pwm_values_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_0_out(0),
      Q => pwm_values(0),
      R => '0'
    );
\pwm_values_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_0_out(1),
      Q => pwm_values(1),
      R => '0'
    );
\pwm_values_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_0_out(2),
      Q => pwm_values(2),
      R => '0'
    );
\pwm_values_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_0_out(3),
      Q => pwm_values(3),
      R => '0'
    );
\pwm_values_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_0_out(4),
      Q => pwm_values(4),
      R => '0'
    );
\pwm_values_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_0_out(5),
      Q => pwm_values(5),
      R => '0'
    );
\pwm_values_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_0_out(6),
      Q => pwm_values(6),
      R => '0'
    );
\pwm_values_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => pwm_values0,
      Q => pwm_values(7),
      R => '0'
    );
end STRUCTURE;
