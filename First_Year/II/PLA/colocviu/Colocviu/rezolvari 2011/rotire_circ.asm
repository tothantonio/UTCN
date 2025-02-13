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
x dd 0
k dd 0
f db "%d", 0
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
	
	cmp x, 22
	jl finish
	
	cmp x, 31
	jg finish
	
	mov eax, x
	add eax, k            
    cmp eax, 31
    jle no        
    sub eax, 10 
	
	no:
	push eax
	push offset f
	call printf
	add esp, 8
	
	finish:
		
	;terminarea programului
	push 0
	call exit
end start
