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
s dd 5, -501, 14, 21
len dd ($ - s) / 4
.code
functie proc
	push ebp
	mov ebp, esp
	
	mov ebx, [ebp + 8]
	mov esi, 0
	mov ecx, 0
	bucla:
		cmp esi, [ebp + 12]
		ja final
	
		mov eax, [ebx + esi * 4]
		cmp eax, -500
		jl next
		cmp eax, 500
		jg next
		
		mov edx, 0
		mov edi, 5
		div edi
		
		cmp edx, 0
		jne next
		
		inc ecx
		
	next:
		inc esi
		jmp bucla
	
	final:
	mov eax, ecx
	mov esp, ebp
	pop ebp
	ret 8
functie endp
start:
	;aici se scrie codul
	
	push len
	push offset s
	call functie	
	;terminarea programului
	push 0
	call exit
end start
