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
sir DW 10, 11, 11, 44, 23, 23, 23, 10, 10, 9
lungime_sir EQU ($-sir)/2
f db "%d ", 0
.code
start:
	;aici se scrie codul
	
	mov esi, 0
	mov ecx, lungime_sir
	dec ecx
	
	bucla:
		cmp ecx, 0
		je finish
		mov ax, sir[esi]
		mov bx, sir[esi + 2]
		
		cmp ax, bx
		jne not_eq
		mov bx, 0
		add esi, 4
		sub ecx, 2
		jmp bucla
	not_eq:
		add esi, 2
		dec ecx
		jmp bucla
	
	finish:
		mov esi, 0
		mov ecx, lungime_sir
	print:
		cmp ecx, 0
		je end_print
		
		mov eax, 0
		mov ax, sir[esi]
		push eax
		push offset f
		call printf
		add esp, 8
		add esi, 2
		sub ecx, 1
		jmp print
	end_print:
	;terminarea programului
	push 0
	call exit
end start
