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
sir DB 10, 15, 7, 0, 0, 98, 0, 1, 4 
lungime_sir EQU $-sir 
x DB 42 
msg db "exista deja in sir", 0
f db "%d ", 0
.code
start:
	;aici se scrie codul
	mov ecx, lungime_sir
	mov esi, 0
	mov eax, 0

	bucla:
	mov al, sir[esi]
	cmp al, x
	je mesaj
	inc esi
	loop bucla
	
	mov ecx, 0
	mov ecx, lungime_sir
	mov esi, 0
	mov eax, 0
	
	
	bucla2:
		mov al, sir[esi]
		cmp al, 0
		je interschimba
		inc esi
		loop bucla2
	
	interschimba:
		mov al, x
		xchg al, sir[esi]
		jmp sf
	
	mesaj:
	push offset msg
	call printf
	add esp, 4
	
	sf:
		mov esi, 0
		mov ecx, lungime_sir
		mov eax, 0
	afisare:
		push ecx
		mov al, sir[esi]
		push eax
		push offset f
		call printf
		add esp, 8
		inc esi
		pop ecx
		loop afisare
		
	;terminarea programului
	push 0
	call exit
end start
