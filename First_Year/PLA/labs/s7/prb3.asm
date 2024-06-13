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
format db "%d", 13, 10, 0

.code
;Macro pentru apelul unei functii fara parametriis
apel0 MACRO functie
	call functie
ENDM

;Macro pentru apelul unei functii cu un parametru
apel1 MACRO functie, param1
	push param1
	call functie
	add esp, 4
ENDM

;Macro pentru apelul unei functii cu doi parametrii
apel2 MACRO functie, param1, param2
	push param2 
	push param1
	call functie
	add esp, 8
ENDM

;Macro pentru apelul unei functii cu trei parametrii
apel3 MACRO functie, param1, param2, param3
	push param3
	push param2
	push param1
	call functie
	add esp, 12
ENDM

;Functie pentru par sau impar
IsPar proc nr
	mov eax, nr
	and eax, 1
	jz par
	mov eax, 0
	jmp IsPar_end	

par:
	mov eax, 1
IsPar_end:
	ret
IsPar endp

start:
	;aici se scrie codul
	
	mov eax, 405
	apel1 IsPar, eax
	apel2 printf, offset format, eax
	;terminarea programului
	push 0
	call exit
end start
