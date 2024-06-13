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
x DD 11111001b 
f db "%d", 0
.code
start:
	;aici se scrie codul
	mov eax, x
	mov ebx, 0 ; lungimea secv curente
	mov edx, 0 ; lungimea maxima
	mov ecx, 32
	
	bucla:
		test eax, 1
		jnz gasit
		mov ebx, 0
		jmp next
	gasit:
		inc ebx
	max_len:
		cmp edx, ebx
		jl modifica
		jmp next
	modifica:
		mov edx, ebx
	next:
		shr eax, 1
		loop bucla
	
	push edx
	push offset f
	call printf
	add esp, 8
	;terminarea programului
	push 0
	call exit
end start
