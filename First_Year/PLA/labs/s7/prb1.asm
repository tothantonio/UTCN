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
SumOfOdds MACRO limit
	LOCAL loop_start, loop_end
	mov ecx, 1
	mov eax, 0

loop_start:
	cmp ecx, limit
	jg loop_end
	
	add eax, ecx
	add ecx, 2
	jmp loop_start
	
loop_end:
ENDM
;sectiunile programului, date, respectiv cod
.data
;aici declaram date
format db "Suma numerelor impare este: %d",13, 10, 0
.code
start:
	;aici se scrie codul
	SumOfOdds 7
	SumOfOdds 20
	SumOfOdds 30
	;terminarea programului
	push 0
	call exit
end start
