@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim Test_Mode_func_synth -key {Post-Synthesis:sim_1:Functional:Test_Mode} -tclbatch Test_Mode.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
