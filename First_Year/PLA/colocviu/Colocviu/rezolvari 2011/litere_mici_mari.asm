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
sir db 100 dup(0)
f db "%s", 0
.code
start:
	;aici se scrie codul
	push offset sir
	push offset f
	call scanf
	add esp, 8
	
	
	lea esi, sir
	
	bucla:
		mov al, [esi]
		cmp al, 0
		je afisare
		
		cmp al, 'a'
		jb next
		
		cmp al, 'z'
		ja next
		
		sub al, 32 ; trans in litera mare
		mov [esi], al
	next:
		inc esi
		jmp  bucla
		
	afisare:
	push offset sir
	push offset f
	call printf
	add esp, 8
	
	
	;terminarea programului
	push 0
	call exit
end start
