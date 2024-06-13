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
n dw 10
m dw 5
rez dw 0
.code
start:
	mov eax, 0
	
	mov ax, 2
	mov bx, 3
	
	push eax
	
	mov ecx, 0
	add ax, bx
	mov cx, m
	mul cx
	
	add rez, ax
	
	pop eax
	
	mov cx, n
	mul cx
	
	add rez, ax
	
	
	;apel functie exit
	push 0
	call exit
end start
