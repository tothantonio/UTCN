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
a dq 10.56
x dq 6.97
y dq 17.14
z dq 9.11

e dq 0.0
f db "%lf", 0

x1 dq 15.34
x2 dq 11.48
x3 dq 15.77
x4 dq 8.41
.code
start:
	;aici se scrie codul
	finit
	fld y
	fld x2
	fmul 
	fld x
	fsin
	fsub
	fld x3
	fadd
	fld a
	fadd
	fld z
	fld x4
	fmul
	fsub
	fld x1
	fmul
	
	fstp e
	
	push dword ptr[e + 4]
	push dword ptr[e]
	push offset f
	call printf 
	add esp, 12
	;terminarea programului
	push 0
	call exit
end start
