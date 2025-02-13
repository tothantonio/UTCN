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
sir db 1, 2, 3, 4, -3    
len dd $ - sir                                     
.code
start:
	
	mov esi, 0
	
	et_loop:
		mov bl, sir[esi]
		inc esi
		cmp esi, len
		jl et_loop
	
    push 0
    call exit
end start
