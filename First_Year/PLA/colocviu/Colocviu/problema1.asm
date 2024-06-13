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
n equ 3
mat db 1, 10, 3
f db "%d ", 0
.code

start:
	;aici se scrie codul
	mov esi, 0
	mov eax, 0
	
	bucla:
		cmp esi, 3
		je final
		
		add al, mat[esi]
		inc esi
		jmp bucla
		
	final:
		push eax
		push offset f
		call printf
		add esp, 8
	;terminarea programului
	push 0
	call exit
end start
