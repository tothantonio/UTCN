@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto fd4982173adf493b8723e9bdebfba812 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot full_adder_2bit_behav xil_defaultlib.full_adder_2bit -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
