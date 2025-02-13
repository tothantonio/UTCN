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
p DD 1.2, 3.0, 0.0, 4.9, 8.27
n EQU ($-p)/4 -1
x dq  1.0
xi dq 1.0
px dq 0.0
f db "%lf", 13, 10, 0

.code
start:
	;aici se scrie codul
	finit
	
	mov esi, 0 ; i ul
	
	bucla:
		cmp esi, n
		ja final
		
		fld xi
		fld p[esi * 4] ; sunt pe double word
		fmul		   ; coef * xi in st(0)
		fadd px
		fst px
		
		fld xi
		fmul x
		fstp xi
		inc esi
		
		jmp bucla
	
	final:
		push dword ptra[px + 4]
		push dword ptr[px]
		push offset f
		call printf
		add esp, 12
	;terminarea programului
	push 0
	call exit
end start
