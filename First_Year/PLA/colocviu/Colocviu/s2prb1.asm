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
x dd 5
y dd 10
z dd 9
f db "%d ", 0

.code
expresie proc
	push ebp
	mov ebp, esp
	sub esp, 4
	
	mov eax, [ebp + 8] ; x
	
	inc eax
	mov edx, 0
	mov ecx, 2
	div ecx
	mov [ebp - 4], eax ; (x + 1) / 2
	
	mov eax, [ebp + 12]
	mov ebx, 3
	mul ebx ; eax = 3 * y
	
	mov ecx, [ebp + 16]
	imul ecx, 2
	mov ebx, 8
	sub ebx, ecx ; ebx = 8 - 2 * z
	
	mov edx, 0
	div ebx ; eax = 3 * y / 8 - 2 * z
	
	add [ebp - 4], eax
	
	mov eax, [ebp - 4]
	
	mov esp, ebp
	pop ebp
	ret 12
	
expresie endp
start:
	;aici se scrie codul
	push z
	push y
	push x
	call expresie
	add esp, 12
	
	push eax
	push offset f
	call printf
	add esp, 8
	;terminarea programului
	push 0
	call exit
end start
