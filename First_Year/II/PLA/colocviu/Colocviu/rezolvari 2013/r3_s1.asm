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
	mov esi, n
	mov edi, 0
	bucla:
		cmp ecx, esi
		jg finish
		
		mov ebx, 5
		cmp ecx, ebx
		jle f1
		
		mov eax, 0
		sub ecx, 1
		mov eax, ecx
		mul ecx
		add edi, ecx
		jmp next
	f1:
		mov eax, ecx
		add ecx, 3
		mul ecx
		mov ebx, 3
		div ebx
		add edi, ebx
	next:
		inc esi
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
