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
n dd 2
e dq 0.0
f db "%lf", 13, 10, 0

.code
start:
	;aici se scrie codul
	finit
	mov ecx, n
	bucla:
		fild n
		fild n
		fsqrt 
		fdivr
		fadd e
		fstp e
		dec n
		loop bucla
		
	push dword ptr[e + 4]
	push dword ptr[e]
	push offset f
	call printf
	add esp, 12
	;terminarea programului
	push 0
	call exit
end start
