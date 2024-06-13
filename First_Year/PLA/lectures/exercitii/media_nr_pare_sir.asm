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
sir dd 300, 120, 12, -15
len dd ($ - sir) / 4
cnt dd 0
.code
start:
	;aici se scrie codul
	mov ebp, 0
	mov ecx, len
	mov esi, 0
	mov ebx, 2
	et:	
		mov edx, 0
		mov eax, sir[esi * 4]
		div ebx
		
		cmp edx, 0
		jne next
		
		add ebp, sir[esi * 4]
		inc cnt
		
	next:
		inc esi
		loop et
		
	mov edx, 0
	mov eax, ebp
	div cnt
		
	;terminarea programului
	push 0
	call exit
end start
