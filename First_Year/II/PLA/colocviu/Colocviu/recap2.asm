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
x dq 1.0
y dq 1.0
res dq 0.0
f db "%lf", 13, 10, 0
.code
dist proc
	push ebp
	mov ebp, esp
	finit
	fld qword ptr[ebp + 8]
	fld qword ptr[ebp + 8]
	fmul
	
	fld qword ptr[ebp + 16]
	fld qword ptr[ebp + 16]
	fmul
	
	fadd
	fsqrt
	mov esp, ebp
	pop ebp
	ret
dist endp
start:
	;aici se scrie codul
	push dword ptr[y + 4]
	push dword ptr[y]
	push dword ptr[x + 4]
	push dword ptr[x]
	call dist
	add esp, 16
	
	fstp res
	
	push dword ptr[res + 4]
	push dword ptr[res]
	push offset f
	call printf
	add esp, 12
	;terminarea programului
	push 0
	call exit
end start
