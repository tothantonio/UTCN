@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim full_adder_2bit_behav -key {Behavioral:sim_1:Functional:full_adder_2bit} -tclbatch full_adder_2bit.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
