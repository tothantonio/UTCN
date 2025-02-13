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
k DB 2
sir DB 100, 10, 200, 5, 150
lungime_sir EQU $-sir
f db "%d ", 0
.code
start:
	;aici se scrie codul
	mov ecx, lungime_sir
	mov edx, 0
	bucla:
		mov ebx, 0
		mov bl, k
		cmp edx, ebx
		jl finish
		mov eax, 0
		mov al, sir[edx]
		mov sir[edx], 255
		sub sir[edx], al
	finish:
		inc edx
		loop bucla
		
	mov ecx, lungime_sir
	mov edx, 0
	afisare:
		pusha
		mov eax, 0
		mov al, sir[edx]
		push eax
		push offset f
		call printf
		add esp, 8
		popa
		inc edx
		loop afisare
		
	;terminarea programului
	push 0
	call exit
end start
