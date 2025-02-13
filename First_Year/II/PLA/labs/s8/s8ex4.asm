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
y    dq 0.3333
zece dq 10.0 
doi  dq 2.0
rezultat dq 0.0
;rad de ordinul 3 din 10 :D
format	DB "%lf", 0
.code
start:
	FLD y    ; st[0]=0.33
	FLD zece ; st[0]=10 , st[1]=0.33
	
	FYL2X ; st[0]=st[1]*log2(st[0])
	
	FLD1 ; st[0]=1. st[1] = FYL2X rezultatul
	FXCH st(1)
	FSUB  ST(0), ST(1); st[0]=st[0]-st[1]
	
	F2XM1 ;
	FLD1
	
	FADD ST(0), ST(1)
	FLD doi
	FMUL
	
	
	;FST ST[0]	;SALVARE REZULTAT
	lea esi,rezultat
	FST QWORD PTR[esi]
	
	push dword ptr [rezultat+4]
	push dword ptr [rezultat]
	push offset format
	call printf
	add esp, 12
	
	;terminarea programului
	push 0
	call exit
end start
