@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 3c0bc55bce7740fa83177fb41067f917 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Test_Mode_func_synth xil_defaultlib.Test_Mode -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
