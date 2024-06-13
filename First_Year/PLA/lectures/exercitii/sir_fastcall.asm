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
v1 db 1, 2, 3, "abc"
v2 dw 17, 17h, 0010110b
v3 dd $ - v1
v4 equ 15
v5 dd 12h, 1234h, 123456h
v6 db (15 - 1) / 2
v7 dw 2 dup(15)
v8 dq 1.2
v9 dw 1, 12, 0123h
.code
func proc
	push ebp
	mov ebp, esp
	sub esp, 4
	mov [ebp - 4], ecx
	finit
	fild dword ptr[ebp - 4]
	fld1
	fld1
	fadd
	fdiv
	mov esp, ebp
	pop ebp
	ret 4
func endp
start:
	;aici se scrie codul
	;terminarea programului
	push 0
	call exit
end start
