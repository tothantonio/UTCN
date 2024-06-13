.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern scanf: proc
extern fprintf: proc
extern fopen: proc
extern fclose: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date

sir db 0
format_citire db "%s", 0

fisier db "fisier.txt", 0
mode_w db "w", 0
format_iesire db "%s", 0


.code
start:
	;aici se scrie codul
	
	push offset mode_w
	push offset fisier
	call fopen
	mov esi, eax
	add esp, 8
	
	push offset sir
	push offset format_citire
	call scanf
	add esp, 8
	
	mov edi, 0
	len:
	;lungimea sirului
		cmp sir[edi], 0
		je iesire
		inc edi
	jmp len
	
	iesire:
		dec edi
	
	reverse:
		cmp edi, 0
		je final
		
		mov ebx, 0
		mov bl, sir[edi]
		
		push ebx
		push offset format_iesire
		push esi
		call fprintf
		add esp, 12
		dec edi
	jmp reverse
	
	final:
	push esi
	call fclose
	add esp, 4
	;terminarea programului
	push 0
	call exit
end start
