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
sir DB 10, 15, 7, 28, 16, 98, 4, 20, 1, 24 
lungime_sir EQU $-sir 
x DB 20
f db "%d ", 0
.code
start:
	;aici se scrie codul
	mov ecx, lungime_sir
	mov esi, 0
	mov eax, 0
	mov al, x
	
	bucla:
		cmp sir[esi], al
		jl este_par
		jmp next
	este_par:
		test sir[esi], 1
		jz modifica
		jmp next
	modifica:
		mov sir[esi], 0
	next:
		inc esi
	loop bucla
	
	mov ecx, lungime_sir
	mov esi, 0
	
	afisare:
		push ecx
		mov eax, 0
		mov al, sir[esi]
		push eax
		push offset f
		call printf
		add esp, 8
		pop ecx
		inc esi
	loop afisare
		
	;terminarea programului
	push 0
	call exit
end start
