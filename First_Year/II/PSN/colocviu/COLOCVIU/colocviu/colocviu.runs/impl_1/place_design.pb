
�
�No debug cores found in the current design.
Before running the implement_debug_core command, either use the Set Up Debug wizard (GUI mode)
or use the create_debug_core and connect_debug_core Tcl commands to insert debug cores into the design.
154*	chipscopeZ16-241h px� 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
22default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
994.4382default:default2
0.0002default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
994.4382default:default2
0.0002default:defaultZ17-268h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
g
RPhase 1.1 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 48f37d41
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.547 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
}

Phase %s%s
101*constraints2
1.2 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px� 
O
:Phase 1.2 Build Placer Netlist Model | Checksum: b65b9f72
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.578 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
z

Phase %s%s
101*constraints2
1.3 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px� 
L
7Phase 1.3 Constrain Clocks/Macros | Checksum: b65b9f72
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.578 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
H
3Phase 1 Placer Initialization | Checksum: b65b9f72
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.578 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px� 
C
.Phase 2 Global Placement | Checksum: ea8c69ba
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.734 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px� 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px� 
O
:Phase 3.1 Commit Multi Column Macros | Checksum: ea8c69ba
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.734 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px� 
Q
<Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 604311de
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.765 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px� 
L
7Phase 3.3 Area Swap Optimization | Checksum: 145f7c99c
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.765 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
�

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 145f7c99c
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.765 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
x

Phase %s%s
101*constraints2
3.5 2default:default2)
Timing Path Optimizer2default:defaultZ18-101h px� 
J
5Phase 3.5 Timing Path Optimizer | Checksum: ccf2476b
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.765 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 


Phase %s%s
101*constraints2
3.6 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px� 
R
=Phase 3.6 Small Shape Detail Placement | Checksum: 1808bfca1
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.843 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
u

Phase %s%s
101*constraints2
3.7 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px� 
H
3Phase 3.7 Re-assign LUT pins | Checksum: 138db7444
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.843 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
�

Phase %s%s
101*constraints2
3.8 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.8 Pipeline Register Optimization | Checksum: 138db7444
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.859 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
D
/Phase 3 Detail Placement | Checksum: 138db7444
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.859 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px� 
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
6.8502default:defaultZ30-746h px� 
S
>Phase 4.1.1 Post Placement Optimization | Checksum: 1920f11a4
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.875 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
N
9Phase 4.1 Post Commit Optimization | Checksum: 1920f11a4
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.875 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px� 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 1920f11a4
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.890 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px� 
F
1Phase 4.3 Placer Reporting | Checksum: 1920f11a4
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.890 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px� 
M
8Phase 4.4 Final Placement Cleanup | Checksum: 19f74a1a5
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.890 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 19f74a1a5
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.890 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
=
(Ending Placer Task | Checksum: caec2220
*commonh px� 
�

%s
*constraints2t
`Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.890 . Memory (MB): peak = 1017.117 ; gain = 22.6802default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
392default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0312default:default2
1017.1172default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2}
iD:/First_Year/utcn/First_Year/PSN/colocviu/COLOCVIU/colocviu/colocviu.runs/impl_1/num_zec_4bit_placed.dcp2default:defaultZ17-1381h px� 
�
kreport_io: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.016 . Memory (MB): peak = 1017.117 ; gain = 0.000
*commonh px� 
�
treport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.016 . Memory (MB): peak = 1017.117 ; gain = 0.000
*commonh px� 
�
qreport_control_sets: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1017.117 ; gain = 0.000
*commonh px� 


End Record