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
sir DW 10, 15, 7, 29, 16, 98, 4, 35, 1, 24, 41, 59 
lungime_sir EQU ($-sir)/2 
x DW 29 
f db "%d ", 0
.code
start:
	;aici se scrie codul
	
	mov ecx, 0
	mov ecx, lungime_sir
	
	mov esi, 0
	mov eax, 0
	mov ax, x
	bucla:
		cmp sir[esi], ax
		jle next
		
		test sir[esi], 1
		jz next
		mov sir[esi], 0
	    jmp afisare
	next:
		add esi, 2
	loop bucla
	
	mov ecx, lungime_sir
	mov esi, 0
	afisare:
		push ecx
		mov ax, sir[esi]
		push eax
		push offset f
		call printf
		add esp, 8
		pop ecx
		add esi, 2
	loop afisare
	;terminarea programului
	push 0
	call exit
end start
