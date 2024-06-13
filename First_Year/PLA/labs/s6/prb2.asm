.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern fopen: proc 
extern fprintf: proc
extern scanf: proc
extern fclose: proc 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date

format_citire db "%s", 0
string db 0

file db "fisier.txt", 0
mode_w db "w", 0
format_iesire db "%c", 0

.code
start:
	;aici se scrie codul
	push offset mode_w
	push offset file
	call fopen
	mov esi, eax ;; aici este pointerul la fisier
	add esp, 8
	
	push offset string
	push offset format_citire
	call scanf;am citit string ul de la tastatura
	add esp, 8
	
	mov edi, 0
	len:
		;determinam lungimea sirului
		cmp string[edi], 0
		je iesire
		inc edi
	jmp len
	;edi are nr de caractere + null
	
	iesire:
	dec edi 
	

	et:
		cmp edi, -1
		je final
		
		mov ebx, 0
		mov bl, string[edi]
		
		push ebx 
		push offset format_iesire
		push esi
		call fprintf
		add esp, 12
		dec edi
	jmp et
	final:
	push esi
	call fclose
	add esp, 4
	;terminarea programului
	push 0
	call exit
end start
