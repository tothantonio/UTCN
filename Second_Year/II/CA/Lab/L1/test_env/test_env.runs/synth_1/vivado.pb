
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2$
create_project: 2default:default2
00:00:082default:default2
00:00:082default:default2
1324.5592default:default2
0.0272default:default2
35412default:default2
146002default:defaultZ17-722h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental /media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/utils_1/imports/synth_1/test_new.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
p/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/utils_1/imports/synth_1/test_new.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
v
Command: %s
53*	vivadotcl2E
1synth_design -top test_env -part xc7a100tcsg324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
a
#Helper process launched with PID %s4824*oasys2
1072222default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2_
I/tools/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
%s*synth2�
�Starting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 1946.773 ; gain = 371.770 ; free physical = 2706 ; free virtual = 13768
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1368.476; parent = 1163.982; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 2919.715; parent = 1946.777; children = 972.938
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2
test_env2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
142default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MPG2default:default2u
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/MPG.vhd2default:default2
52default:default2
connectMPG12default:default2
MPG2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
1042default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MPG2default:default2w
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/MPG.vhd2default:default2
112default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MPG2default:default2
02default:default2
12default:default2w
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/MPG.vhd2default:default2
112default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MPG2default:default2u
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/MPG.vhd2default:default2
52default:default2
connectMPG22default:default2
MPG2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
1052default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
IFetch2default:default2x
d/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/IFetch.vhd2default:default2
52default:default2!
connectIFetch2default:default2
IFetch2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
1062default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
IFetch2default:default2z
d/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/IFetch.vhd2default:default2
172default:default8@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
rst2default:default2z
d/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/IFetch.vhd2default:default2
632default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
IFetch2default:default2
02default:default2
12default:default2z
d/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/IFetch.vhd2default:default2
172default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SSD2default:default2u
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/SSD.vhd2default:default2
62default:default2

connectSSD2default:default2
SSD2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
1072default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
SSD2default:default2w
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/SSD.vhd2default:default2
132default:default8@Z8-638h px� 
�
default block is never used226*oasys2w
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/SSD.vhd2default:default2
352default:default8@Z8-226h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
digit2default:default2w
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/SSD.vhd2default:default2
322default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SSD2default:default2
02default:default2
12default:default2w
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/SSD.vhd2default:default2
132default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
UC2default:default2t
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/UC.vhd2default:default2
42default:default2
	connectUC2default:default2
UC2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
1082default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
UC2default:default2v
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/UC.vhd2default:default2
192default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
UC2default:default2
02default:default2
12default:default2v
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/UC.vhd2default:default2
192default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ID2default:default2t
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/ID.vhd2default:default2
52default:default2
	connectID2default:default2
ID2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
1092default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ID2default:default2v
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/ID.vhd2default:default2
202default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ID2default:default2
02default:default2
12default:default2v
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/ID.vhd2default:default2
202default:default8@Z8-256h px� 
�
-Port '%s' is missing in component declaration4102*oasys2
regdst2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
782default:default8@Z8-5640h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
EX2default:default2t
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/EX.vhd2default:default2
62default:default2
	connectEX2default:default2
EX2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
1102default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
EX2default:default2v
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/EX.vhd2default:default2
222default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
EX2default:default2
02default:default2
12default:default2v
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/EX.vhd2default:default2
222default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mem2default:default2u
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/mem.vhd2default:default2
52default:default2

connectMEM2default:default2
mem2default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
1112default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
mem2default:default2w
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/mem.vhd2default:default2
152default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
mem2default:default2
02default:default2
12default:default2w
a/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/mem.vhd2default:default2
152default:default8@Z8-256h px� 
�
default block is never used226*oasys2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
1202default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
test_env2default:default2
02default:default2
12default:default2|
f/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.srcs/sources_1/new/test_env.vhd2default:default2
142default:default8@Z8-256h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sa[4]2default:default2
EX2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sa[3]2default:default2
EX2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sa[2]2default:default2
EX2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sa[1]2default:default2
EX2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sa[0]2default:default2
EX2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
RegDst2default:default2
EX2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[15]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[14]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[13]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[12]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
btn[4]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
btn[3]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
btn[2]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[15]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[14]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[13]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[12]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[11]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[10]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[9]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[8]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[4]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[3]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[2]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[1]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[0]2default:default2
test_env2default:defaultZ8-7129h px� 
�
%s*synth2�
�Finished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2015.742 ; gain = 440.738 ; free physical = 2763 ; free virtual = 13831
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1368.476; parent = 1163.982; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 2988.684; parent = 2015.746; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 2033.555 ; gain = 458.551 ; free physical = 2763 ; free virtual = 13831
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1368.476; parent = 1163.982; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3006.496; parent = 2033.559; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 2033.555 ; gain = 458.551 ; free physical = 2769 ; free virtual = 13838
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1368.476; parent = 1163.982; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3006.496; parent = 2033.559; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:00.012default:default2
2033.5552default:default2
0.0002default:default2
27682default:default2
138342default:defaultZ17-722h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2?
)/home/toni/Downloads/NexysA7_test_env.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2?
)/home/toni/Downloads/NexysA7_test_env.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2=
)/home/toni/Downloads/NexysA7_test_env.xdc2default:default2.
.Xil/test_env_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2178.3052default:default2
0.0002default:default2
27072default:default2
137752default:defaultZ17-722h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2
00:00:002default:default2
2178.3052default:default2
0.0002default:default2
27072default:default2
137752default:defaultZ17-722h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2_
I/tools/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Constraint Validation : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2764 ; free virtual = 13831
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1368.476; parent = 1163.982; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2764 ; free virtual = 13831
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1368.476; parent = 1163.982; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2766 ; free virtual = 13833
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1368.476; parent = 1163.982; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2766 ; free virtual = 13834
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1368.476; parent = 1163.982; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 3     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 6     
2default:defaulth p
x
� 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	               2K Bit	(64 X 32 bit)          RAMs := 1     
2default:defaulth p
x
� 
i
%s
*synth2Q
=	             1024 Bit	(32 X 32 bit)          RAMs := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  33 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   32 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   16 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   9 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   9 Input    1 Bit        Muxes := 9     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
test_env2default:default2
led[10]2default:default2
02default:defaultZ8-3917h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[15]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[14]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[13]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
led[12]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
btn[4]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
btn[3]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
btn[2]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[15]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[14]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[13]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[12]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[11]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[10]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[9]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[8]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[4]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[3]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[2]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[1]2default:default2
test_env2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
sw[0]2default:default2
test_env2default:defaultZ8-7129h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:23 ; elapsed = 00:00:25 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2737 ; free virtual = 13812
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1368.476; parent = 1163.982; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
j
%s*synth2R
>
Distributed RAM: Preliminary Mapping Report (see note below)
2default:defaulth px� 
�
%s*synth2t
`+------------+----------------------------+-----------+----------------------+----------------+
2default:defaulth px� 
�
%s*synth2u
a|Module Name | RTL Object                 | Inference | Size (Depth x Width) | Primitives     | 
2default:defaulth px� 
�
%s*synth2t
`+------------+----------------------------+-----------+----------------------+----------------+
2default:defaulth px� 
�
%s*synth2u
a|test_env    | connectMEM/memory_data_reg | Implied   | 64 x 32              | RAM64X1S x 32  | 
2default:defaulth px� 
�
%s*synth2u
a|test_env    | connectID/reg_file_reg     | Implied   | 32 x 32              | RAM32M x 12    | 
2default:defaulth px� 
�
%s*synth2u
a+------------+----------------------------+-----------+----------------------+----------------+

2default:defaulth px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Distributed RAMs at the current stage of the synthesis flow. Some Distributed RAMs may be reimplemented as non Distributed RAM primitives later in the synthesis flow. Multiple instantiated RAMs are reported only once.
2default:defaulth px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:30 ; elapsed = 00:00:32 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2643 ; free virtual = 13717
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1476.765; parent = 1272.334; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Timing Optimization : Time (s): cpu = 00:00:34 ; elapsed = 00:00:36 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2597 ; free virtual = 13670
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1502.819; parent = 1298.389; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
S
%s
*synth2;
'
Distributed RAM: Final Mapping Report
2default:defaulth p
x
� 
�
%s
*synth2t
`+------------+----------------------------+-----------+----------------------+----------------+
2default:defaulth p
x
� 
�
%s
*synth2u
a|Module Name | RTL Object                 | Inference | Size (Depth x Width) | Primitives     | 
2default:defaulth p
x
� 
�
%s
*synth2t
`+------------+----------------------------+-----------+----------------------+----------------+
2default:defaulth p
x
� 
�
%s
*synth2u
a|test_env    | connectMEM/memory_data_reg | Implied   | 64 x 32              | RAM64X1S x 32  | 
2default:defaulth p
x
� 
�
%s
*synth2u
a|test_env    | connectID/reg_file_reg     | Implied   | 32 x 32              | RAM32M x 12    | 
2default:defaulth p
x
� 
�
%s
*synth2u
a+------------+----------------------------+-----------+----------------------+----------------+

2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Technology Mapping : Time (s): cpu = 00:00:34 ; elapsed = 00:00:37 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2589 ; free virtual = 13663
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1505.421; parent = 1300.990; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished IO Insertion : Time (s): cpu = 00:00:41 ; elapsed = 00:00:43 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2608 ; free virtual = 13682
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1505.585; parent = 1301.154; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:41 ; elapsed = 00:00:43 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2608 ; free virtual = 13682
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1505.585; parent = 1301.154; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:41 ; elapsed = 00:00:44 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2609 ; free virtual = 13683
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1505.624; parent = 1301.193; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:41 ; elapsed = 00:00:44 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2610 ; free virtual = 13684
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1505.690; parent = 1301.260; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:41 ; elapsed = 00:00:44 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2610 ; free virtual = 13684
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1505.690; parent = 1301.260; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:41 ; elapsed = 00:00:44 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2610 ; free virtual = 13684
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1505.710; parent = 1301.279; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
F
%s*synth2.
|      |Cell     |Count |
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
F
%s*synth2.
|1     |BUFG     |     1|
2default:defaulth px� 
F
%s*synth2.
|2     |CARRY4   |    38|
2default:defaulth px� 
F
%s*synth2.
|3     |LUT1     |     3|
2default:defaulth px� 
F
%s*synth2.
|4     |LUT2     |     3|
2default:defaulth px� 
F
%s*synth2.
|5     |LUT3     |    68|
2default:defaulth px� 
F
%s*synth2.
|6     |LUT4     |    21|
2default:defaulth px� 
F
%s*synth2.
|7     |LUT5     |    95|
2default:defaulth px� 
F
%s*synth2.
|8     |LUT6     |   191|
2default:defaulth px� 
F
%s*synth2.
|9     |RAM32M   |    10|
2default:defaulth px� 
F
%s*synth2.
|10    |RAM32X1D |     4|
2default:defaulth px� 
F
%s*synth2.
|11    |RAM64X1S |    32|
2default:defaulth px� 
F
%s*synth2.
|12    |FDCE     |    32|
2default:defaulth px� 
F
%s*synth2.
|13    |FDRE     |    41|
2default:defaulth px� 
F
%s*synth2.
|14    |IBUF     |     6|
2default:defaulth px� 
F
%s*synth2.
|15    |OBUF     |    27|
2default:defaulth px� 
F
%s*synth2.
|16    |OBUFT    |     4|
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:41 ; elapsed = 00:00:44 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2610 ; free virtual = 13684
2default:defaulth px� 
�
%s*synth2~
jSynthesis current peak Physical Memory [PSS] (MB): peak = 1505.726; parent = 1301.295; children = 204.493
2default:defaulth px� 
�
%s*synth2}
iSynthesis current peak Virtual Memory [VSS] (MB): peak = 3119.230; parent = 2146.293; children = 972.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 22 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:00:38 ; elapsed = 00:00:41 . Memory (MB): peak = 2178.305 ; gain = 458.551 ; free physical = 2669 ; free virtual = 13744
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:41 ; elapsed = 00:00:44 . Memory (MB): peak = 2178.305 ; gain = 603.301 ; free physical = 2669 ; free virtual = 13744
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.022default:default2
00:00:00.012default:default2
2178.3052default:default2
0.0002default:default2
27642default:default2
138382default:defaultZ17-722h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
842default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2178.3052default:default2
0.0002default:default2
27182default:default2
137932default:defaultZ17-722h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 46 instances were transformed.
  RAM32M => RAM32M (RAMD32(x6), RAMS32(x2)): 10 instances
  RAM32X1D => RAM32X1D (RAMD32(x2)): 4 instances
  RAM64X1S => RAM64X1S (RAMS64E): 32 instances
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
ff9a3ca02default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
492default:default2
512default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:00:522default:default2
00:00:512default:default2
2178.3052default:default2
853.7462default:default2
28832default:default2
139572default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2t
`/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.runs/synth_1/test_env.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2z
fExecuting : report_utilization -file test_env_utilization_synth.rpt -pb test_env_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon May 26 12:22:56 20252default:defaultZ17-206h px� 


End Record