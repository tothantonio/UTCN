.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern scanf: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date

n dd 20
incercari dd 0
x dd 0
format_citire db "%d", 0
msg_less db "mai mic", 13, 10, 0
msg_greater db "mai mare", 13, 10, 0
msg_correct db "Corect!!! Numar de incercari: %d", 13, 10, 0
msg_read db "Introduceti un numar: ", 0

.code
start:
	;aici se scrie codul
	push offset msg_read
	call printf
	add esp, 4
	
	push offset x
	push offset format_citire
	call scanf
	add esp, 8
	
	mov ebx, n
	inc incercari
	
	compare_loop:
		cmp ebx, x
		je found
		
		jl less
		
		jg greater
	
	less:
	push offset msg_less
	call printf
	add esp, 4
	jmp read
	
	greater:
	push offset msg_greater
	call printf
	add esp, 4
	jmp read
	
	read:
	push offset msg_read
	call printf
	add esp, 4
	
	push offset x
	push offset format_citire
	call scanf
	add esp, 8
	inc incercari
	jmp compare_loop
		
	found:
		push incercari
		push offset msg_correct
		call printf
		add esp, 8
	
	;terminarea programului
	push 0
	call exit
end start
