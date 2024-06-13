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
b dw 9
x dw 19
.code
start:
	;aici se scrie codul
	
	mov eax, 0
	mov edi, 0
	
	mov di, 10
	
	mov ax, b
	xor ax, di
	shl ax, 2
	
	mov ebx, 0
	mov bx, x
	shl bx, 4
	
	mov esi, 0
	mov si, 18
	
	mov edx, 0
	mov dx, 11
	or si, dx
	
	xor bx, si
	
	not bx
	
	and ax, bx
	
	;terminarea programului
	push 0
	call exit
end start
