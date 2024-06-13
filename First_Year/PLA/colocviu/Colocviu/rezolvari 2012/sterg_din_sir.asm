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
sir DD 20, 24, 12, 31, 42, 19, 65, 87, 21 
lungime_sir EQU ($-sir)/4 
x dd 22 
f db "%d ", 0
.code
start:
	;aici se scrie codul
	mov ebx,x
	sub ebx,5
	
	mov edx,x
	add edx,5
	
	mov ecx,lungime_sir
	mov esi,0
	
	bucla:
		cmp sir[esi],ebx
		jl continua
		cmp sir[esi],edx
		jle modifica
		jmp continua
		modifica:
		mov sir[esi],0
	  continua:
		push ecx
		mov eax, sir[esi]
		push eax
		push offset f
		call printf
		add esp,8
		add esi,4
		pop ecx
	loop bucla
	push 0
	call exit
end start
