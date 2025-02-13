.model flat, stdcall
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc

.data
nr dd 0
f db "%d", 0
msg_sum db "Suma cifrelor impare = %d", 13, 10, 0
s dd 0

.code
start:
    push offset nr
    push offset f
    call scanf
    add esp, 8

    mov eax, 0

bucla:
    mov edx, 0
    mov ebx, 10
    div ebx 

    test eax, 1 
    jnz aduna_impara 

    jmp next

aduna_impara:
	add s, eax

next:
    cmp edx, 0 
    jnz bucla 

	mov eax, s
    push eax
    push offset msg_sum
    call printf
    add esp, 8

    ; Terminarea programului
    push 0
    call exit
end start
