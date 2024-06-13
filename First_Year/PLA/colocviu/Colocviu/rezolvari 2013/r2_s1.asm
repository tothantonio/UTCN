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
		
		mov edx, 0
		mov ebx, 3
		div ebx
		cmp edx, 0
		jne f1
	
		inc ecx
		mov eax, ecx
		mov ebx, 7
		div ebx
		add edi, eax
		jmp next
	
		f1:
			mov eax, ecx
			mul ecx
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
