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

;Scrieti o functie care primeste ca parametri 4 numere intregi pe 32 de 
;biti si returneaza suma lor, folosind conventia de apel:
;• CDECL
;• STDCALL
;• FASTCALL


.data
;aici declaram date
format db "Suma: %d", 13, 10
.code

sumCDECL proc
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	add eax, [ebp + 12]
	add eax, [ebp + 16]
	add eax, [ebp + 20]
	mov esp, ebp
	pop ebp
	ret 16
sumCDECL endp

sumSTDCALL proc
	mov eax, [esp + 4]
	add eax, [esp + 8]
	add eax, [esp + 12]
	add eax, [esp + 16]
	ret 16
sumSTDCALL endp

sumFASTCALL proc
	mov eax, ecx
	add eax, edx
	add eax, [esp + 4]
	add eax, [esp + 8]
	ret 8
sumFASTCALL endp

start:
	;aici se scrie codul
	
	push 4
	push 3
	push 2
	push 1
	
	call sumCDECL
	add esp, 16
	push eax
	push offset format
	call printf
	add esp, 8
	
	push 9
	push 8
	push 7
	push 6
	
	call sumSTDCALL
	push eax
	push offset format
	call printf
	add esp, 8
	
	
	mov edx, 3
	mov ecx, 2
	push 4
	push 1
	call sumFASTCALL
	add esp, 8
	push eax
	push offset format
	call printf
	add esp, 8
	
	;terminarea programului
	
	push 0
	call exit
end start
