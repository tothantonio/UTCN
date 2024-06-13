.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
x db 0
k db 0 
f db "%d ", 0
.code
start:
	;aici se scrie codul
	push offset x
	push offset f
	call scanf
	add esp, 8
	
	push offset k
	push offset f
	call scanf
	add esp, 8
	
	mov eax, 0
	mov al, x
	
	mov eax, 0
	mov bl, k
	
	xor al, bl
	
	push eax
	push offset f
	call printf
	add esp, 8
	;terminarea programului
	push 0
	call exit
end start
