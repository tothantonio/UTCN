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
A dd 4 dup(0)
  dd 4 dup(0)
  dd 4 dup(0)
  dd 4 dup(0)
  
n dd 0 
format_rd db "%d", 0
f db "%d ", 0
format_endl db " ", 13, 10, 0
.code
start:
	;aici se scrie codul
	push offset n
	push offset format_rd
	call scanf 
	add esp, 8
	
	mov edx, 0
	mov eax, 4
	mul n
	mov ebx, eax
	
	mov esi, 0 ;rows
	
	rows:	
		cmp esi, n
		jae final
		mov edi, 0 ; cols
		
		cols:
			cmp edi, ebx
			jae next_line
			
			cmp edi, 0
			jne not_first
			mov A[4 * esi][edi], esi
			jmp next_el
		
		not_first:
			mov eax, A[4 * esi][edi - 4]
			shl eax, 2
			add eax, 1
			mov A[4 * esi][edi], eax
			
		next_el:
			push A[4 * esi][edi]
			push offset f
			call printf
			add esp, 8
			
			add edi, 4
		
		jmp cols
		
		next_line:
			push offset format_endl
			call printf
			add esp, 4
			inc esi
		jmp rows
	
	final:
	;terminarea programului
	push 0
	call exit
end start
