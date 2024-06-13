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
s1 db "ana are mere"
s2 db "mere"
len_s1 dd $-s1
len_s2 dd $-s2 

poz_start dd 0

.code
start:

	mov esi, 0
	mov edi, 0
	
	mov ecx, len_s1
	
	et_loop:
	
	mov edx, esi
	mov poz_start, edx
	
	rev:
	mov al, s2[edi]
	cmp al, s1[esi + edi]
	jne cont
	inc edi
	jmp rev
	
	cont:
	
	mov edx, edi
	cmp edi, len_s2
	je out_instr
	
	mov edi, 4
	inc esi
	loop et_loop
	
	jmp dont_exist
	
	out_instr:
	mov eax, poz_start
	jmp fin
	
	dont_exist:
	mov eax, -1
	
	fin:
	
    push 0
    call exit
end start
