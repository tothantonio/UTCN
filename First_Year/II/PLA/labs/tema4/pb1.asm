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
a dq 0
x dq 0
y dq 0
z dq 0
f db "%lf", 0
e dq 0

x1 dq 15.32
x2 dq 11.48
x3 dq 15.77
x4 dq 8.41
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
	fld y 	; st[0]
	fld x2  ; st[0], y = st[1]
	fmul 	; st[1] = y * 11.48, elimin st[0]
	fld x 	; st[0] = x, st[1] = y * 11.48
	fsin  	; st[0] = sin(st[0])
	fsub	; st[1] = y * 11.48 - sin(x), elimin st[0]
	fld x3	; st[0] = x3, st[1] = y * 11.48 - sin(x)
	fadd	; st[1] = y * 11.48 - sin(x) + 15.77, elimin st[0]
	fld a	; st[0] = a, st[1] = y * 11.48 - sin(x) + 15.77
	fadd 	; st[1] = y * 11.48 - sin(x) + 15.77 + a, elimin st[0]
	fld z	; st[0] = z, st[1] = y * 11.48 - sin(x) + 15.77 + a
	fmul x4 ; st[0] = z * 8.41
	fsub  	; st[1] = y * 11.48 - sin(x) + 15.77 + a - z * 8.41, elimin st[0]
	fld x1	; st[0] = x1, st[1] = y * 11.48 - sin(x) + 15.77 + a - z * 8.41
	fmul 
	fstp e
	
	push dword ptr[e + 4]
	push dword ptr[e]
	push offset f
	call printf
	add esp, 12
	
	;terminarea programului
	push 0
	call exit
end start
