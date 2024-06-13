.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern scanf: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
n dd 0
f1 db "%d", 0
f2 db "%d ", 0
.code
start:
	;aici se scrie codul
	push offset n
	push offset f1
	call scanf
	add esp, 8
	
	mov eax, n
	mov ecx, 2
	
	bucla:
		cmp eax, 1
		jmp end_program
		
		mov edx, 0
		div ecx
		cmp edx, 0
		jne next
		
		push ecx
		push offset f2
		call printf 
		add esp, 8
		
		mov eax, n
		div ecx
		mov n, eax
		jmp bucla
	
	next:
		inc ecx
		jmp bucla
	
	end_program:
	;terminarea programului
	push 0
	call exit
end start
