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
sir dw 1, 2, 3
len dw ($ - sir) / 2
.code
minim macro sir, len
	mov esi, 0
	mov cx, len
	mov eax, 0
	et:
		cmp cx, 0
		je fin
		mov ax, sir[esi]
		cmp ax, sir[esi + 2]
		ja next
	sch:
		mov ax, sir[esi]
	
	next:
		add esi, 2
		loop et
fin:
endm
start:
	;aici se scrie codul
	minim sir, len
	;terminarea programului
	push 0
	call exit
end start
