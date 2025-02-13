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
sir DW 100, 24, 75, 24, 86, 91, 75, 24 
lungime_sir EQU ($-sir)/2 
a DW 75 
b DW 24
f db "%d ", 0 
.code
start:
	;aici se scrie codul
	
	mov ecx, 0
	mov ecx, lungime_sir
	mov esi, 0
	mov edx, 0
	mov edx, 0
	
	bucla:
		mov dx, a
		mov bx, b
		cmp sir[esi], dx
		je inlocuire_b
		cmp sir[esi], bx
		je inlocuire_a
		add esi, 2
		loop bucla
	
	mov ecx, lungime_sir
	mov esi, 0
	jmp sf
	
	inlocuire_a:
		xchg dx, sir[esi]
		add esi, 2
		cmp ecx, 1
		je sf1
		dec ecx
		jmp bucla
	inlocuire_b:
		xchg bx, sir[esi]
		add esi, 2
		cmp ecx, 1
		je sf1
		dec ecx
		jmp bucla
	
	sf1:
		mov ecx, lungime_sir
		mov esi, 0
	
	sf:
		push ecx
		mov eax, 0
		mov ax, sir[esi]
		push eax
		push offset f
		call printf
		add esp, 8
		add esi, 2
		pop ecx
		loop sf
		
	;terminarea programului
	push 0
	call exit
end start
