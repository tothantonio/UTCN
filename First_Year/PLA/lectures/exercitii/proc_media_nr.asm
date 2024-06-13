.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
sir dd 1, 13
len dd ($ - sir) / 4
.code
func proc
	push ebp
	mov ebp, esp
	mov ebx, [ebp + 8]
	mov eax, 0
	mov esi, 0
	mov ecx, [ebp + 12]
	et:
		cmp ecx, 0
		je fin
		add eax, [ebx + esi * 4]
		inc esi
		loop et
	fin:
	mov edx, 0
	mov ecx, [ebp + 12]
	div ecx
	
	mov esp, ebp
	pop ebp
	ret 8
func endp
start:
	;aici se scrie codul
	push len
	push offset sir
	call func
	
	;terminarea programului
	push 0
	call exit
end start
