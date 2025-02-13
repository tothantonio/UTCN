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
f db "%d", 0
x dD 2
y dD 7
z dd 20

.code
expresie proc
	push ebp
	mov ebp, esp
	sub esp, 8
	
	mov eax, [ebp + 8]
	mul eax ; x^2
	mov [ebp - 4], eax
	
	mov ebx, [ebp + 12]
	inc ebx
	imul ebx, 3
	mov [ebp - 8], eax

	mov eax, [ebp + 16]
	mov edx, 0
	mov ecx, 5
	div ecx
	sub [ebp - 8], eax
	
	mov eax, [ebp - 8]
	mov edx, 0
	mov ecx, 4
	div ecx
	
	sub [ebp - 4], eax
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
