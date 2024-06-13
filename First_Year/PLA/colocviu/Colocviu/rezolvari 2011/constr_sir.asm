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
extern printf:proc
;sectiunile programului, date, respectiv cod
.data
f db "%d ",0	
sir1 DB 5, 10, 12, 4, 3
n EQU $-sir1
sir2 DB 3 dup(0)
.code
start:
	mov ecx,n
	sub ecx,2
	mov edx,1

	bucla:
	mov ebx,0
	mov eax,edx
	add bl,sir1[eax]
	sub eax,1
	add bl,sir1[eax]
	add eax,2
	add bl,sir1[eax]
	mov eax,ebx
	push edx
	mov edx,0
	mov ebx,3
	div ebx
	pop edx
	mov sir2[edx],al
	add edx,1
	loop bucla

	mov edx,1
	mov ecx,n
	sub ecx,2

	afisare:
	pusha
	mov eax,0
	mov al,sir2[edx] 
	push eax
	push offset f
	call printf
	add esp,8
	popa
	add edx,1
	loop afisare

	;apel functie exit
	push 0
	call exit
end start