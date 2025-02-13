.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf : proc
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
	
	mov esi, n
	mov ecx, 1
	mov edi, 0
	mov eax, 0
	bucla:
		cmp ecx, esi
		je finish
		
		mov edx, 0
		mov ebx, 4
		div ebx
		cmp edx, 0
		je f1
		inc ecx 
		mov eax, ecx
		mov ebx, 7
		div ebx
		add edi, ebx
		jmp next
		f1:
			mov eax, ecx
			mov ebx, 5
			mul ebx
			inc eax
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
