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
.data
;aici declaram date
unu dq 1.0
doi dq 2.0
cinci dq 5.0
trei dd 3.0
rez1 dq 0
rez2 dq 0 
format db "%lf", 13, 10, 0
.code
start:
	;aici se scrie codul
	FINIT
	
	fld trei
	fld1
	fdivr	; st(0) = 1 / 3
	f2xm1
	fadd unu ; 2 la 1 / 3
	fstp rez1
	
	fld trei
	fld1
	fdivr   ; st(0) = 1 / 3
	fld cinci ; st(1) = 1 / 3, st(0) = 5
	fyl2x	; st(1) = st(1) * log baza 2 din 5, rez in vf stivei
	f2xm1
	fld1
	fadd 
	fstp rez2
	
	push dword ptr[rez1 + 4]
	push dword ptr[rez1]
	push offset format
	call printf
	add esp, 12
	
	push dword ptr[rez2 + 4]
	push dword ptr[rez2]
	push offset format
	call printf
	add esp, 12
	
	
	
	;terminarea programului
	push 0
	call exit
end start
