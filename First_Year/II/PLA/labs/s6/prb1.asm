.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
sir dw 10, -21, 15, -9, 2, -100, 11
lgsir dd ($ - sir) / 2  
min dw 0                
max dw 0               
	
.code
start:
    mov esi, 0  
    mov ecx, lgsir        

    mov ax, sir[esi]        
    mov bx, sir[esi]

	et_loop:
    cmp ax, sir[esi]     
    jl cmp_max
    mov ax, sir[esi]
    cmp_max:
	cmp bx, sir[esi]
    jg urmator
	mov bx, sir[esi]
	urmator:
	inc esi
    loop et_loop         

    mov min, ax
    mov max, bx

    ; Apelăm funcția exit
    push 0
    call exit
end start
