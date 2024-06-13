.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
s db 1, 3, 2
avg db 0
.code
start:
	
	;aici se scrie codul
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	
	lea ebx, s
	
	add al, byte ptr[ebx]
	inc ebx
	add al, byte ptr[ebx]
	inc ebx
	add al, byte ptr[ebx]
	inc ebx
	
	sub ebx, offset s
	div bl
	
	;apel functie exit
	push 0
	call exit
end start



