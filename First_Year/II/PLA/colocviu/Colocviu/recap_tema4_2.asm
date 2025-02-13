.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
a dq 3.72
x dq 6.39
y dq 2.36
z dq 12.43

e dq 0.0
f db "%lf", 0
temp1 dq 0.0
temp2 dq 0.0
temp3 dq 0.0
temp4 dq 0.0
temp5 dq 0.0
temp6 dq 0.0

x1 dq 8.26
k dd 2.0
.code
start:
	;aici se scrie codul
	
	bucla:
	cmp k, 15
	ja final
	finit
	fld x
	fld a
	fyl2x
	fst temp1
	fld1
	fscale
	fst temp2
	fld1
	fld temp2
	fyl2x
	fst temp3
	fld temp1
	fsub temp3
	f2xm1
	fld1
	fadd
	fmul temp2
	
	fld z
	fsub
	
	fld x1
	fld k
	fmul
	fdiv
	
	fld y
	fxch
	fyl2x
	fst temp4
	fld1
	fscale
	fst temp5
	fld1
	fld temp5
	fyl2x
	fst temp6
	fld temp4
	fsub temp6
	f2xm1
	fld1
	fadd
	fmul temp5
	
	fdiv k
	fadd e
	fst e
	
	inc k
	jmp bucla
	
	final:
		push dword ptr[e + 4]
		push dword ptr[e]
		push offset f
		call printf
		add esp, 12
	;terminarea programului
	push 0
	call exit
end start
