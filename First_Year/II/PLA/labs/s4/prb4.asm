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
n db 4
s db 1, 3, 2, 4, 4, 3, 1
k db 0
.code
start:
	
	;aici se scrie codul
	mov eax, 0
	
	mov al, n
	inc al; al = n + 1
	mul n ; al = n * (n + 1)
	
	mov esi, 0
	mov bl, 0 ; in bl calculam suma din s
	
	add bl, s[esi]
	inc esi
	
	add bl, s[esi]
	inc esi
	
	add bl, s[esi]
	inc esi
	
	add bl, s[esi]
	inc esi
	
	add bl, s[esi]
	inc esi
	
	add bl, s[esi]
	inc esi
	
	add bl, s[esi]
	inc esi
	
	sub al, bl ; al = n * (n + 1) -  sum = k
	mov k, al 
	
	
	;apel functie exit
	push 0
	call exit
end start



