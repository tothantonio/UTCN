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
extern printf:proc
;sectiunile programului, date, respectiv cod
.data
	
sir dw 1, 2, 4
lungime_sir dd ($-sir) / 2
numar dd 0 
suma dd 0 
mesaj db "media aritmetica a numerelor impare este %d",0

.code
start:
	mov ecx,lungime_sir
	mov eax,0
	mov edx,0
	mov ebx,0

	bucla:
		mov ax, sir[ebx]
		or ax, 1
		cmp ax, sir[ebx]
		je sari
		add dx, sir[ebx]
		inc numar
	sari:
		add ebx, 2
		loop bucla

	mov suma,edx
	mov edx, 0
	mov eax, suma
	div numar
	

	push eax
	push offset mesaj
	call printf
	add esp,8

	;apel functie exit
	push 0
	call exit
end start