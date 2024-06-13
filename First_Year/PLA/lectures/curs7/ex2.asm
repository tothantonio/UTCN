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
sir dw 5, 3, 1, 4
len equ($ - sir) / 2
format db "Sir: %d", 0
.code
reverse MACRO array_addres, array_len
	LOCAL loop_outer, loop_inner, check_swap, done
	
	mov ecx, len
	dec ecx
	mov ebx, array_addres
	jmp check_swap

check_swap:
	test ecx, ecx
	jz done_swap
	jmp loop_outer
	
loop_outer:
	push ecx
	mov ecx, len
	dec ecx
	
loop_inner:
	mov ax, [ebx]
	cmp ax, [ebx + 2]
	jbe no_swap
	xcgh ax, [ebx + 2]
	mov [ebx], ax

no_swap:
	add ebx, 2
	loop loop_inner
	
	pop ecx
	dec ecx
	jz done
reverse ENDM


start:
	;aici se scrie codul
	call reverse offset sir, len
	
	push len
	push offset sir
	push offset format
	call printf
	;terminarea programului
	push 0
	call exit
end start
