.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
msg1 db "n1=", 0
n1 dd 0
msg2 db "n2=", 0
n2 dd 0

format1 db "%d", 0

msg3 db "n1 + n2 = ", 0 
suma dd 0
format2 db "%d", 0
.code
start:
	;aici se scrie codul
	
	;citesc n1
	push offset msg1
	call printf
	add esp, 4
	push offset n1
	push offset format1
	call scanf
	add esp, 8
	
	;citesc n2
	push offset msg2
	call printf
	add esp, 4
	push offset n2
	push offset format1
	call scanf
	add esp, 8
	
	;suma 
	mov eax, n1
	add eax, n2
	mov suma, eax;
	
	;afisez suma
	push offset msg3
	call printf
	add esp, 4
	push suma
	push offset format2
	call printf
	add esp, 8
	
	;terminarea programului
	push 0
	call exit
end start
