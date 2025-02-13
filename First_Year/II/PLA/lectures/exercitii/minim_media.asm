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
sir dd 1, 2, 3
len dd ($ - len) / 4
min dd 0
avg dd 0
.code
funct proc
	push ebp
	mov ebp, esp
	
	mov ebx, [ebp + 8]; adresa sirului
	mov esi, 0
	mov eax, 0
	
	mov ecx, [ebp + 12]; len
	dec ecx
	et:
		cmp esi, ecx
		jg medie
		add eax, [ebx + esi * 4]
		inc esi
		jmp et
	medie:
		mov edx, 0
		mov ecx, [ebp + 12]
		div ecx
	
	mov esp, ebp
	pop ebp
	ret 8
funct endp
start:
	;aici se scrie codul
	push len
	push offset sir
	call funct
	
	;terminarea programului
	push 0
	call exit
end start
