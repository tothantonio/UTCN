.386
.model flat, stdcall
includelib msvcrt.lib
extern exit: proc
extern printf: proc

.data
sir DD 9, 2, 45, 18
lungime_sir EQU ($-sir)/4
msg_sum db "Suma = %d", 13, 10, 0
msg_avg db "Media = %d", 13, 10, 0

.code
start:
	mov ecx, lungime_sir
	mov edx, 0
	mov esi, 0
	mov eax, 0
	mov ebx, 0

	bucla:
		cmp sir[edx], 20
		jl media
		cmp sir[edx], 15
		jg suma

	media:
		add eax, sir[edx]
		inc edi
		jmp next

	suma:
		add ebx, sir[edx]

	next:
		inc edx
		cmp edx, lungime_sir
		jnz bucla

	div edi

	push eax
	push offset msg_avg
	call printf
	add esp, 8

	push ebx
	push offset msg_sum
	call printf
	add esp, 8

	;terminarea programului
	push 0
	call exit
end start
