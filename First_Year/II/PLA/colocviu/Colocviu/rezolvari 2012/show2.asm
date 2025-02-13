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
sir DB "Sirul meu", 0
f db "%d", 13, 10, 0
.code
start:
	;aici se scrie codul
	mov esi, 0
	bucla:
		mov al, sir[esi]
		cmp al, 0
		je finish
		movzx eax, al
		push eax
		push offset f
		call printf
		add esp, 8
		inc esi
		jmp bucla
	finish:
	;terminarea programului
	push 0
	call exit
end start
