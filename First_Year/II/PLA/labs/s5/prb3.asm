.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; includem msvcrt.lib, și declaram ce funcții vrem să importăm
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; sectiunile programului, date, respectiv cod
.data
num dw 1580
cnt db 0                              

.code
start:
        
	mov esi, 0
	
	et:
	shl ax, 1
	jnc urm
	inc cnt
	urm:
	
	cmp ax, 0
	je out_instr
	loop et
	
	out_instr:
	mov al, cnt
	
    push 0
    call exit
end start
