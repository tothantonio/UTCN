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
a dq 0.0
x dq 0.0
y dq 0.0
z dq 0.0
f db "%lf", 0
e dq 0.0
w dq 8.26
k dd 2

.code
start:
	;aici se scrie codul
	push offset a
	push offset f
	call scanf
	add esp, 8
	
	push offset x
	push offset f
	call scanf
	add esp, 8
	
	push offset y
	push offset f
	call scanf
	add esp, 8
	
	push offset z	
	push offset f
	call scanf
	add esp, 8
	
	finit
	bucla:
		fld x	;st[0] = x
		fld a 	;st[0] = a, st[1] = x
		fyl2x	;st[1] = st[1] * log2(st[0]), elimin st[0]
		
		f2xm1	;st[0] = 2^(x * log2(a)) - 1
		fld1	;st[0] = 1, st[1] = 2^(x * log2(a)) - 1
		fadd 	;st[1] = 2^(x * log2(a)), elimin st[0]
		fld z	;st[0] = z, st[1] = a^x
		fsub 	;st[1] = a^x - z, elimin st[0]
		fld w	;st[0] = 8.26, st[1] = a^x - z
		fld k	;st[0] = k, st[1] = 8.26, st[2] = a^x - z
		fmul 	;st[1] = 8.26 * k, elimin st[0]
		fdiv	;st[1] = (a^x - z) / (8.26 * k), elimin st[0]
		fld y	;st[0] = y, st[1] = (a^x - z) / (8.26 * k)
		fxch st(1)	;st[0] = (a^x - z) / (8.26 * k), st[1] = y
		fyl2x	;st[1] = st[1] * log2(st[0]), elimin st[0]
		f2xm1	;st[0] = 2^(y*log2((a^x - z) / (8.26 * k))) - 1
		fld1	;st[0] = 1, st[1] = 2^(y*log2((a^x - z) / (8.26 * k))) - 1
		fadd	;st[1] = 2 ^ (y * log2(a^x - z) / (8.26 * k)))
		fld k	;st[0] = k, st[1] = 2 ^ (y * log2(a^x - z) / (8.26 * k)))
		fdiv 	;st[1] = 2 ^ (y * log2(a^x - z) / (8.26 * k))) / k, elimin st[0]
		
		
		fadd e
		fstp e
		
		inc k
		mov esi, k
		cmp esi, 16
		jl bucla
		
	push dword ptr[e + 4]
	push dword ptr[e]
	push offset f
	call printf
	add esp, 12 
		
	
	;terminarea programului
	push 0
	call exit
end start
