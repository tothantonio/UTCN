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

alfa	    DD 4.0
sin    		DQ 0
format	DB "sin(alfa) = %lf", 0
.code
start:
	FINIT 		;INITIALIZARE COPROCESOR
	FLD	alfa 	;INCARCARE unghi IN STIVA COPROC
	FPTAN       ;CALCUL tan(alfa) in vf stivei am 1
	FMUL        
	FST ST(1)	;SALVARE REZULTAT
	FMUL 		; tg * tg
	FLD1
	FADD 
	FSQRT 
	
	FLD	alfa 	;INCARCARE unghi IN STIVA COPROC
	FPTAN       ;CALCUL tan(alfa)
	FMUL        
	
	FDIV ST(0),ST(1) ; tan / sqrt(1 + tan^2)
	
	lea esi,sin
	FST QWORD PTR[esi]
	
	push dword ptr [sin+4] ; a doua jumatate
	push dword ptr [sin]
	push offset format
	call printf
	add esp, 12
	
	;terminarea programului
	push 0
	call exit
end start
