
T
Command: %s
53*	vivadotcl2#
phys_opt_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
d

Starting %s Task
103*constraints2)
Initial Update Timing2default:defaultZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.4 ; elapsed = 00:00:00.23 . Memory (MB): peak = 2707.832 ; gain = 0.000 ; free physical = 1852 ; free virtual = 143092default:defaulth px� 
�
^PhysOpt_Tcl_Interface Runtime Before Starting Physical Synthesis Task | CPU: %ss |  WALL: %ss
566*	vivadotcl2
0.462default:default2
0.252default:defaultZ4-1435h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2707.8322default:default2
0.0002default:default2
18522default:default2
143092default:defaultZ17-722h px� 
a

Starting %s Task
103*constraints2&
Physical Synthesis2default:defaultZ18-103h px� 
�

Phase %s%s
101*constraints2
1 2default:default25
!Physical Synthesis Initialization2default:defaultZ18-101h px� 
�
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
82default:defaultZ32-721h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.9732default:default2
-18.8242default:defaultZ32-619h px� 
m
%s*common2T
@Phase 1 Physical Synthesis Initialization | Checksum: 1cbd32032
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.36 . Memory (MB): peak = 2707.832 ; gain = 0.000 ; free physical = 1855 ; free virtual = 143132default:defaulth px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.9732default:default2
-18.8242default:defaultZ32-619h px� 
z

Phase %s%s
101*constraints2
2 2default:default2-
DSP Register Optimization2default:defaultZ18-101h px� 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
e
%s*common2L
8Phase 2 DSP Register Optimization | Checksum: 1cbd32032
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.39 . Memory (MB): peak = 2707.832 ; gain = 0.000 ; free physical = 1855 ; free virtual = 143132default:defaulth px� 
{

Phase %s%s
101*constraints2
3 2default:default2.
Critical Path Optimization2default:defaultZ18-101h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.9732default:default2
-18.8242default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
connectIFetch/pc_reg[30]connectIFetch/pc_reg[30]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
connectIFetch/pc_reg_reg_rep[3]connectIFetch/pc_reg_reg_rep[3]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
connectExecute/mux0_addr[29]connectExecute/mux0_addr[29]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__5_n_0"connectExecute/plusOp_carry__5_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__4_n_0"connectExecute/plusOp_carry__4_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__3_n_0"connectExecute/plusOp_carry__3_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__2_n_0"connectExecute/plusOp_carry__2_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__1_n_0"connectExecute/plusOp_carry__1_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__0_n_0"connectExecute/plusOp_carry__0_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
connectExecute/plusOp_carry_n_0connectExecute/plusOp_carry_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2<
connectIFetch/S[0]connectIFetch/S[0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2>
connectIFetch/PCSrcconnectIFetch/PCSrc2default:default8Z32-702h px� 
�
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12default:default2
net2default:default2
222default:default2
pins2default:defaultZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
#connectIFetch/plusOp_carry_i_11_n_0#connectIFetch/plusOp_carry_i_11_n_02default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.9102default:default2
-16.9342default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
connectIFetch/pc_reg_reg_rep[2]connectIFetch/pc_reg_reg_rep[2]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_10_n_0#connectIFetch/plusOp_carry_i_10_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_18_n_0#connectIFetch/plusOp_carry_i_18_n_02default:default8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
#connectIFetch/plusOp_carry_i_18_n_0#connectIFetch/plusOp_carry_i_18_n_02default:default2`
$connectIFetch/plusOp_carry_i_18_comp	$connectIFetch/plusOp_carry_i_18_comp2default:default8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_24_29_i_18_n_01connectIFetch/reg_file_reg_r1_0_31_24_29_i_18_n_02default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.9062default:default2
-16.8142default:defaultZ32-619h px� 
�
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12default:default2
net2default:default2
222default:default2
pins2default:defaultZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
#connectIFetch/plusOp_carry_i_11_n_0#connectIFetch/plusOp_carry_i_11_n_02default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8982default:default2
-16.5742default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_11_n_0#connectIFetch/plusOp_carry_i_11_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_n_01connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_n_02default:default8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_n_01connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_n_02default:default2|
2connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_comp	2connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_comp2default:default8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_18_23_i_22_n_01connectIFetch/reg_file_reg_r1_0_31_18_23_i_22_n_02default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8632default:default2
-15.5242default:defaultZ32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_n_01connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_n_02default:default2�
4connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_comp_1	4connectIFetch/reg_file_reg_r1_0_31_18_23_i_10_comp_12default:default8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_18_23_i_24_n_01connectIFetch/reg_file_reg_r1_0_31_18_23_i_24_n_02default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8422default:default2
-14.8942default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_17_n_0#connectIFetch/plusOp_carry_i_17_n_02default:default8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2^
#connectIFetch/plusOp_carry_i_17_n_0#connectIFetch/plusOp_carry_i_17_n_02default:default2`
$connectIFetch/plusOp_carry_i_17_comp	$connectIFetch/plusOp_carry_i_17_comp2default:default8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2h
(connectIFetch/cat_OBUF[6]_inst_i_107_n_0(connectIFetch/cat_OBUF[6]_inst_i_107_n_02default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8412default:default2
-14.8642default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2x
0connectIFetch/reg_file_reg_r1_0_31_18_23_i_9_n_00connectIFetch/reg_file_reg_r1_0_31_18_23_i_9_n_02default:default8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2x
0connectIFetch/reg_file_reg_r1_0_31_18_23_i_9_n_00connectIFetch/reg_file_reg_r1_0_31_18_23_i_9_n_02default:default2z
1connectIFetch/reg_file_reg_r1_0_31_18_23_i_9_comp	1connectIFetch/reg_file_reg_r1_0_31_18_23_i_9_comp2default:default8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_18_23_i_19_n_01connectIFetch/reg_file_reg_r1_0_31_18_23_i_19_n_02default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8372default:default2
-14.7442default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_24_29_i_24_n_01connectIFetch/reg_file_reg_r1_0_31_24_29_i_24_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
connectExecute/data0[26]connectExecute/data0[26]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__4_n_01connectExecute/plusOp_inferred__0/i__carry__4_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__3_n_01connectExecute/plusOp_inferred__0/i__carry__3_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__2_n_01connectExecute/plusOp_inferred__0/i__carry__2_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__1_n_01connectExecute/plusOp_inferred__0/i__carry__1_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__0_n_01connectExecute/plusOp_inferred__0/i__carry__0_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2t
.connectExecute/plusOp_inferred__0/i__carry_n_0.connectExecute/plusOp_inferred__0/i__carry_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2Z
!connectIDecode/pc_reg_reg[0]_8[0]!connectIDecode/pc_reg_reg[0]_8[0]2default:default8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2Z
!connectIDecode/pc_reg_reg[0]_8[0]!connectIDecode/pc_reg_reg[0]_8[0]2default:default2^
#connectIDecode/i__carry_i_4__0_comp	#connectIDecode/i__carry_i_4__0_comp2default:default8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
 connectIFetch/pc_reg_reg[0]_1[0] connectIFetch/pc_reg_reg[0]_1[0]2default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8132default:default2
-14.0512default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
&connectExecute/minusOp_carry__5_i_4[2]&connectExecute/minusOp_carry__5_i_4[2]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectExecute/minusOp_carry__4_n_0#connectExecute/minusOp_carry__4_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectExecute/minusOp_carry__3_n_0#connectExecute/minusOp_carry__3_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectExecute/minusOp_carry__2_n_0#connectExecute/minusOp_carry__2_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectExecute/minusOp_carry__1_n_0#connectExecute/minusOp_carry__1_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectExecute/minusOp_carry__0_n_0#connectExecute/minusOp_carry__0_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectExecute/minusOp_carry_n_0 connectExecute/minusOp_carry_n_02default:default8Z32-702h px� 
�
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12default:default2
net2default:default2
122default:default2
pins2default:defaultZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
 connectIFetch/pc_reg_reg[0]_3[1] connectIFetch/pc_reg_reg[0]_3[1]2default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8092default:default2
-13.9392default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_3[0] connectIFetch/pc_reg_reg[0]_3[0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_1[0] connectIFetch/pc_reg_reg[0]_1[0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
connectIFetch/pc_in[30]connectIFetch/pc_in[30]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_2[9] connectIFetch/pc_reg_reg[0]_2[9]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
,connectIDecode/reg_file_reg_r2_0_31_0_5/DOA0,connectIDecode/reg_file_reg_r2_0_31_0_5/DOA02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2(
clk_IBUFclk_IBUF2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
clkclk2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
connectIFetch/pc_reg[30]connectIFetch/pc_reg[30]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
connectIFetch/pc_reg_reg_rep[2]connectIFetch/pc_reg_reg_rep[2]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
connectExecute/mux0_addr[29]connectExecute/mux0_addr[29]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2<
connectIFetch/S[0]connectIFetch/S[0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2>
connectIFetch/PCSrcconnectIFetch/PCSrc2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_10_n_0#connectIFetch/plusOp_carry_i_10_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_17_n_0#connectIFetch/plusOp_carry_i_17_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
&connectExecute/minusOp_carry__5_i_4[2]&connectExecute/minusOp_carry__5_i_4[2]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_3[0] connectIFetch/pc_reg_reg[0]_3[0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_1[0] connectIFetch/pc_reg_reg[0]_1[0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
connectIFetch/pc_in[30]connectIFetch/pc_in[30]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_2[9] connectIFetch/pc_reg_reg[0]_2[9]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
,connectIDecode/reg_file_reg_r2_0_31_0_5/DOA0,connectIDecode/reg_file_reg_r2_0_31_0_5/DOA02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2(
clk_IBUFclk_IBUF2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
clkclk2default:default8Z32-702h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8092default:default2
-13.9392default:defaultZ32-619h px� 
f
%s*common2M
9Phase 3 Critical Path Optimization | Checksum: 1cbd32032
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:53 ; elapsed = 00:00:13 . Memory (MB): peak = 2707.832 ; gain = 0.000 ; free physical = 1827 ; free virtual = 142842default:defaulth px� 
{

Phase %s%s
101*constraints2
4 2default:default2.
Critical Path Optimization2default:defaultZ18-101h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8092default:default2
-13.9392default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
connectIFetch/pc_reg[30]connectIFetch/pc_reg[30]2default:default8Z32-702h px� 
�
'Processed net %s. Replicated %s times.
81*physynth2V
connectIFetch/pc_reg_reg_rep[2]connectIFetch/pc_reg_reg_rep[2]2default:default2
12default:default8Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2V
connectIFetch/pc_reg_reg_rep[2]connectIFetch/pc_reg_reg_rep[2]2default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8092default:default2
-14.3662default:defaultZ32-619h px� 
�
'Processed net %s. Replicated %s times.
81*physynth2X
 connectIFetch/pc_reg_reg[0]_0[0] connectIFetch/pc_reg_reg[0]_0[0]2default:default2
12default:default8Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
 connectIFetch/pc_reg_reg[0]_0[0] connectIFetch/pc_reg_reg[0]_0[0]2default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.8082default:default2
-14.3392default:defaultZ32-619h px� 
�
+Net %s was not replicated. - no resolution
314*physynth2X
 connectIFetch/pc_reg_reg[0]_0[0] connectIFetch/pc_reg_reg[0]_0[0]2default:default8Z32-571h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_0[0] connectIFetch/pc_reg_reg[0]_0[0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
connectExecute/mux0_addr[29]connectExecute/mux0_addr[29]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__5_n_0"connectExecute/plusOp_carry__5_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__4_n_0"connectExecute/plusOp_carry__4_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__3_n_0"connectExecute/plusOp_carry__3_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__2_n_0"connectExecute/plusOp_carry__2_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__1_n_0"connectExecute/plusOp_carry__1_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2\
"connectExecute/plusOp_carry__0_n_0"connectExecute/plusOp_carry__0_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
connectExecute/plusOp_carry_n_0connectExecute/plusOp_carry_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2<
connectIFetch/S[0]connectIFetch/S[0]2default:default8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2<
connectIFetch/S[0]connectIFetch/S[0]2default:default2^
#connectIFetch/plusOp_carry_i_3_comp	#connectIFetch/plusOp_carry_i_3_comp2default:default8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2>
connectIFetch/PCSrcconnectIFetch/PCSrc2default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.7402default:default2
-12.2292default:defaultZ32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2`
$connectIFetch/pc_reg_reg_rep[2]_repN$connectIFetch/pc_reg_reg_rep[2]_repN2default:default2^
#connectIFetch/pc_reg_reg[2]_replica	#connectIFetch/pc_reg_reg[2]_replica2default:default8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2`
$connectIFetch/pc_reg_reg_rep[2]_repN$connectIFetch/pc_reg_reg_rep[2]_repN2default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.7322default:default2
-12.0342default:defaultZ32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2<
connectIFetch/S[0]connectIFetch/S[0]2default:default2b
%connectIFetch/plusOp_carry_i_3_comp_1	%connectIFetch/plusOp_carry_i_3_comp_12default:default8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
connectIFetch/PCSrc_repNconnectIFetch/PCSrc_repN2default:default8Z32-735h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.6932default:default2
-10.8642default:defaultZ32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[2]_0[1] connectIFetch/pc_reg_reg[2]_0[1]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2>
connectIFetch/PCSrcconnectIFetch/PCSrc2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_10_n_0#connectIFetch/plusOp_carry_i_10_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_17_n_0#connectIFetch/plusOp_carry_i_17_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_24_29_i_24_n_01connectIFetch/reg_file_reg_r1_0_31_24_29_i_24_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
connectExecute/data0[26]connectExecute/data0[26]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__4_n_01connectExecute/plusOp_inferred__0/i__carry__4_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__3_n_01connectExecute/plusOp_inferred__0/i__carry__3_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__2_n_01connectExecute/plusOp_inferred__0/i__carry__2_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__1_n_01connectExecute/plusOp_inferred__0/i__carry__1_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectExecute/plusOp_inferred__0/i__carry__0_n_01connectExecute/plusOp_inferred__0/i__carry__0_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
connectIDecode/pc_reg_reg[2][0]connectIDecode/pc_reg_reg[2][0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_1[3] connectIFetch/pc_reg_reg[0]_1[3]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
connectIFetch/pc_in[30]connectIFetch/pc_in[30]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_2[7] connectIFetch/pc_reg_reg[0]_2[7]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
,connectIDecode/reg_file_reg_r2_0_31_0_5/DOC0,connectIDecode/reg_file_reg_r2_0_31_0_5/DOC02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2(
clk_IBUFclk_IBUF2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
clkclk2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
connectIFetch/pc_reg[30]connectIFetch/pc_reg[30]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_0[0] connectIFetch/pc_reg_reg[0]_0[0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
connectExecute/mux0_addr[29]connectExecute/mux0_addr[29]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[2]_0[1] connectIFetch/pc_reg_reg[2]_0[1]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2>
connectIFetch/PCSrcconnectIFetch/PCSrc2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_10_n_0#connectIFetch/plusOp_carry_i_10_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#connectIFetch/plusOp_carry_i_17_n_0#connectIFetch/plusOp_carry_i_17_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2z
1connectIFetch/reg_file_reg_r1_0_31_24_29_i_24_n_01connectIFetch/reg_file_reg_r1_0_31_24_29_i_24_n_02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
connectExecute/data0[26]connectExecute/data0[26]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
connectIDecode/pc_reg_reg[2][0]connectIDecode/pc_reg_reg[2][0]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_1[3] connectIFetch/pc_reg_reg[0]_1[3]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
connectIFetch/pc_in[30]connectIFetch/pc_in[30]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 connectIFetch/pc_reg_reg[0]_2[7] connectIFetch/pc_reg_reg[0]_2[7]2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
,connectIDecode/reg_file_reg_r2_0_31_0_5/DOC0,connectIDecode/reg_file_reg_r2_0_31_0_5/DOC02default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2(
clk_IBUFclk_IBUF2default:default8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
clkclk2default:default8Z32-702h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-0.6932default:default2
-10.8642default:defaultZ32-619h px� 
f
%s*common2M
9Phase 4 Critical Path Optimization | Checksum: 1cbd32032
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:41 ; elapsed = 00:00:23 . Memory (MB): peak = 2707.832 ; gain = 0.000 ; free physical = 1837 ; free virtual = 142952default:defaulth px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2707.8322default:default2
0.0002default:default2
18372default:default2
142952default:defaultZ17-722h px� 
�
>Post Physical Optimization Timing Summary | WNS=%s | TNS=%s |
318*physynth2
-0.6932default:default2
-10.8642default:defaultZ32-603h px� 
B
-
Summary of Physical Synthesis Optimizations
*commonh px� 
B
-============================================
*commonh px� 


*commonh px� 


*commonh px� 
�
�-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization   |  WNS Gain (ns)  |  TNS Gain (ns)  |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  DSP Register   |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Critical Path  |          0.280  |          7.960  |            2  |              0  |                    14  |           0  |           2  |  00:00:23  |
|  Total          |          0.280  |          7.960  |            2  |              0  |                    14  |           0  |           3  |  00:00:23  |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2707.8322default:default2
0.0002default:default2
18372default:default2
142952default:defaultZ17-722h px� 
b
%s*common2I
5Ending Physical Synthesis Task | Checksum: 1ce979141
2default:defaulth px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:41 ; elapsed = 00:00:23 . Memory (MB): peak = 2707.832 ; gain = 0.000 ; free physical = 1837 ; free virtual = 142952default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2292default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
phys_opt_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
phys_opt_design: 2default:default2
00:01:412default:default2
00:00:232default:default2
2707.8322default:default2
0.0002default:default2
18392default:default2
142962default:defaultZ17-722h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
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
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.412default:default2
00:00:00.162default:default2
2707.8322default:default2
0.0002default:default2
18342default:default2
142922default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2{
g/media/toni/stuff/TUCN/UTCN/Second_Year/II/CA/Lab/L1/test_env/test_env.runs/impl_1/test_env_physopt.dcp2default:defaultZ17-1381h px� 


End Record