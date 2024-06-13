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
sir DB 10, 15, 0, 0, 16, 0, 0, 0, 0, 24 
lungime_sir EQU $-sir 
f db "%d ", 0
.code
start:
	;aici se scrie codul
	mov ecx, lungime_sir
	mov ebx, 0
	mov edx, 0
	
	mov esi, 0
	bucla:
		mov al, sir[esi]
		cmp al, 0
		je gasit
		mov ebx, 0
		jmp continua
	gasit:
		inc ebx
		cmp edx, ebx
		jl modifica
		jmp continua
	modifica:
		mov edx, ebx
	continua:
		inc esi
	loop bucla
	
	push edx
	push offset f
	call printf
	add esp, 8
	;terminarea programului
	push 0
	call exit
end start
