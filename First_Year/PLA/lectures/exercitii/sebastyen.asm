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
tabel db 3 dup(2 dup(33h))
octeti db 3, 13, 13h, 00010011b
vector dw 3, 35h, 1a3bh, 0CDEh
text byte "TEST"
l_text db $ - text
;var dw 1314h OR FF00H
caractere db 41h, "text"
dublu dd 11aa33efh, 12345678h
	  dw 4 dup(133h)
.code
start:
	;aici se scrie codul
	mov bl, octeti + 1 ; in bl am 0D
	mov ax, vector + 2 ; in ax am 0035
	and ax, 000fh ; in ax am 0005
	mov cl, l_text ; in cl am 04
	shl ax, cl ; in ax am 0050
	mov dl, caractere ; in dl am 41
	or dl, octeti ; in dl am 43
	lea si, vector ; 
	lodsw ; pune ce a adresat si in ax, adica 0003, iar si se incrementeaza cu 2
	xor si, si ; in si am 0
	;lea di, vector ; 
	;mov bx, [DI + 4]
	mov ax, 345h ; in ax am 345
	mov bl, 10h  ; in bx am 0010
	div bl ; in ax am 534
	;terminarea programului
	push 0
	call exit
end start
