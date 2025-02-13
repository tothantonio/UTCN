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
;aici declaram date
sir dw 7, 10, 12, 1, 8, 9
lungime_sir dd ($ - sir) / 2
produs dd 0
mesaj db "produsul elementelor din sir este: %d", 0

.code
start:
	;aici se scrie codul
	mov ecx,lungime_sir
	mov eax,1
	mov ebx,0

	bucla:
		mov ax,sir[ebx]
		mul eax
		add ebx,2
		loop bucla
	
	mov produs, eax
	push produs
	push offset mesaj
	call printf
	add esp, 8
	
	;terminarea programului
	push 0
	call exit
end start
