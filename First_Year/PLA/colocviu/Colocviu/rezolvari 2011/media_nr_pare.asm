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
lungime_sir dd ($-sir) / 2
nr db 0
suma dw 0
msg db "media aritmetica a numerelor pare este: %d", 0
.code
start:
	mov ecx, lungime_sir
	mov eax, 0
	mov ebx, 0
	mov edx, 0
	
	bucla:
		mov ax, sir[ebx]
		or ax, 1
		cmp ax, sir[ebx]
		je sari
		add dx, sir[ebx]
		inc nr
	sari:
		add ebx, 2
		loop bucla
		
	mov suma, dx
	mov edx, 0
	mov ax, suma
	div nr
	
	push eax
	push offset msg
	call printf
	add esp, 8
	
	;terminarea programului
	push 0
	call exit
end start
