.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; sectiunile programului, date, respectiv cod
.data
; aici declaram date
x dd 2
n dd 10
format db "%lf", 13, 10, 0
s dq 0.0
.code
expresie proc
	push ebp
	mov ebp, esp
	sub esp, 24
	finit
	fild dword ptr[ebp + 12] ; st(0) = n
	fild dword ptr[ebp + 12] ; st(0) = st(1) = n
	
	fsin ; st(0) = sin st(0)
	fmul ; st(1) = n * sin n
	
	fild dword ptr[ebp + 8] ; st(0) = x
	fyl2x ; st(1) = n*sin n * log2(x)
	fst qword ptr[ebp - 4]	; pun in var locala n*sin n * log2(x)
	fld1	; st(0) = 1, st(1) = n*sin n * log2(x)
	fscale	; st(0) = 2^(n * sin n * log2(x))
	fst qword ptr[ebp - 12]	; pun in var locala
	fld1	; st(0) = 1, st(1)  = 2^(n * sin n * log2(x))
	fld qword ptr[ebp - 12] ; st(0) = 2^(n * sin n * log2(x)) st(1) = 1, st(2)  = 2^(n * sin n * log2(x))
	fyl2x	;st(1) = log2(2^(n * sin n * log2(x))) = n*sin n * log2(x)
	fst qword ptr[ebp - 20]	; pun in var locala
	fld qword ptr[ebp - 4]	; st(0) = n * sin n * log2(x), st(1) = n*sin n * log2(x), st(2) = 2^(n * sin n * log2(x))
	fsub qword ptr[ebp - 20]	;st(0) = n * sin n * log2(x) - int(n*sin n * log2(x))
	f2xm1	; st(0) = 2^(n * sin n * log2(x) - int(n*sin n * log2(x))) - 1
	fld1
	fadd
	fmul qword ptr[ebp - 12] ; st(0) = int(2^(n * sin n * log2(x))) * 2^(n * sin n * log2(x) - int(n * sin n * log2(x)))
	
	mov esp, ebp
	pop ebp
	ret 8
expresie endp
start:
	;aici se scrie codul
	mov esi, 1
	bucla:
		push esi
		push x
		call expresie
		fadd s
		fstp s
		inc esi
		cmp esi, n
		ja end_bucla
	jmp bucla
	end_bucla:
		fld s
		fsqrt
		fstp s
		push dword ptr[s + 4]
		push dword ptr[s]
		push offset format
		call printf
		add esp, 12
	;terminarea programului
	push 0
end start