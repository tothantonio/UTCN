.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
b dd 10
z dd 10
e dd 0 
.code
start:
	;aici se scrie codul
	mov ebx, 9
	mov eax, b
	
	mul ebx
	mov ecx, 30
	div ecx
	mov e, eax
	
	mov edx, 15
	mov eax, 15
	mul edx
	
	mov edi, z
	div edi
	
	mov esi, 19
	sub edi, esi
	
	div edi
	
	add e, eax
	
	mov eax, e
	;terminarea programului
	push 0
	call exit
end start
