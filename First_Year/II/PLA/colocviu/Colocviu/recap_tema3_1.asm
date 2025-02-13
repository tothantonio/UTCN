.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern scanf: proc
extern printf: proc
extern fopen: proc
extern fclose: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
mode_read db "r", 0
file_name db "fisier.txt", 0
fp dd 0

.code
special proc
	push ebp
	mov ebp, esp
	
	mov esp, ebp
	pop ebp
	ret
special endp
start:
	;aici se scrie codul
	push offset mode_read
	push offset file_name
	call printf
	add esp, 8
	mov fp, eax
	
	mov esi, 0
	
	bucla:
		push offset sir
		push offset f
		push fp
		call fscanf
		add esp, 12
		
		push offset sir
		call special
		add esp, 4
		
	
	;terminarea programului
	push 0
	call exit
end start
