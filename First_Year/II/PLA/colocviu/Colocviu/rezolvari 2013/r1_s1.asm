.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
n dd 0
f db "%d", 0
.code
start:
	;aici se scrie codul
	push offset n
	push offset f
	call scanf
	add esp, 8
	
	mov ecx, 1
	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov edi, 0
	
	bucla:
		cmp ecx, n
		jg finish
		test ecx, 1
		jnz f1
		
	mov eax, ecx
	add eax, 4
	mov ebx, 5
	mul ebx
	add edi, eax
	jmp next
	
	f1:
		mov ebx, ecx
		inc ecx
		imul ebx
		inc ecx
		inc ecx
		imul ecx
		add edi, eax
		
	next:
		inc ecx
		jmp bucla
		
	finish:
		push edi
		push offset f
		call printf
		add esp, 8
	;terminarea programului
	push 0
	call exit
end start
