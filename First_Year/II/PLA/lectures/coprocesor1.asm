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
r dq 0.0
a dq 3.0
b dq 2.0
cc dq 4.0
x dq 1.33 
f db "%lf", 0
.code
functie proc
	push ebp
	mov ebp, esp
	finit
	fild qword ptr[ebp + 8]
	fild qword ptr[ebp + 8]
	fmul
	
	fild qword ptr[ebp + 12]
	fld x
	fmul
	
	fsub
	
	fild qword ptr[ebp + 16]
	fsqrt
	
	fdiv
	
	mov esp, ebp
	pop ebp
	ret 
functie endp
start:
	;aici se scrie codul
	
	push offset Cc
	push offset b
	push offset a
	call functie
	add esp, 12
	
	fstp r
	
	push dword ptr[r + 4]
	push dword ptr[r]
	push offset f
	call printf
	add esp, 12
	;terminarea programului
	push 0
	call exit
end start
