.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern fopen: proc
extern fclose: proc 
extern fgetc: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
mode_read db "r", 0
file_name db "text.txt", 0
format db "%c", 0
EOF equ -1
.code
is_special PROC
    ; Verificam daca caracterul este litera mica
    cmp al, 'a'
    jl  is_special_char
    cmp al, 'z'
    jge not_special_char

    ; Verificam daca caracterul este litera mare
    cmp al, 'A'
    jl  is_special_char
    cmp al, 'Z'
    jge not_special_char

    ; Verificam daca caracterul este cifra
    cmp al, '0'
    jl  is_special_char
    cmp al, '9'
    jge not_special_char

    ; Verificam daca caracterul este spatiu
    cmp al, ' '
    je  not_special_char
	
is_special_char:
    ; Caracterul este special
    mov al, '-'
    ret

not_special_char:
    ; Caracterul nu este special
    ret
is_special ENDP

start:
    ;aici se scrie codul
    push offset mode_read
    push offset file_name
    call fopen
    add esp, 8
    mov ebx, eax ; Salvam pointerul la  fisierului in ebx
    
    read_loop:
        push ebx
        call fgetc
        add esp, 4
        cmp eax, EOF
        je  close_file
		
		push eax
        call is_special
		add esp, 4
		
		push eax
        push offset format
        call printf 
        add esp, 8 
        jmp read_loop
    
    close_file:
        push ebx
        call fclose
        add esp, 4
    
    push 0
    call exit
end start