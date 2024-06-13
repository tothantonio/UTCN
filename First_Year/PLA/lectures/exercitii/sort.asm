.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
sir dw 1, 5, 2, 4, 6, 3
len dd $ - sir
.code
bubble_sort MACRO sir, len
	mov esi, 0
	et1:
		cmp esi, len
		jae fin
		mov edi, esi
		
		et2:
			add edi, 2
			cmp edi, len
			jae end_inner
			mov ax, sir[edi]
			cmp ax, sir[esi]
			
			jnb next
			mov bx, sir[esi]
			mov sir[esi], ax
			mov sir[edi], bx
			next:
			jmp et2
			end_inner:
				add esi, 2
			jmp et1
fin:
ENDM
start:
	;aici se scrie codul
	bubble_sort sir, len
	;terminarea programului
	push 0
	call exit
end start
