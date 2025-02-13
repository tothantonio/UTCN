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
x DB 50
y DB 20
operatii DB "ssawad"
nr_operatii EQU $-operatii
f db "%d", 13, 10, 0
.code
start:
	;aici se scrie codul
	
	mov ecx, nr_operatii
	mov ebx, 0
	mov edx, 0
	bucla:
	
		mov bl, [operatii + edx]
		cmp bl, "s"
		je s
		cmp bl, "w"
		je w
		cmp bl, "a"
		je a
		cmp bl, "d"
		je d
	
	s:	;jos
		inc y
		jmp finish
	w:	;sus
		dec y
		jmp finish
	a:	;stanga
		dec x
		jmp finish
	d:	;dreapta
		inc x
		jmp finish
	
	finish:
		inc edx
		loop bucla
	
	mov eax, 0
	mov al, x
	push eax
	push offset f
	call printf
	add esp, 8
	
	mov eax, 0
	mov al, y
	push eax
	push offset f
	call printf
	add esp, 8
	
	;terminarea programului
	push 0
	call exit
end start
