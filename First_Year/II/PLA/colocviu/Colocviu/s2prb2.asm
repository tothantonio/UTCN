.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Include libraries, and declare which functions we want to import
includelib msvcrt.lib
extern exit: proc
extern fopen: proc
extern fscanf: proc
extern fprintf: proc
extern fclose: proc
extern scanf: proc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Declare the start symbol as public - that's where execution begins
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Sections of the program: data and code
.data
; Declare data
mode_read db "r", 0
file_input db "input.txt", 0

fmt_read db "%s", 0
buffer db 256 dup(0)

fp_in dd 0
fmt_char db "%c", 0
exclude_char db 0

mode_write db "w", 0
file_output db "output.txt", 0
fp_out dd 0

.code
; Receives character in AL and returns encoded character in EAX
encode proc
    ; ECX: character to encode
    sub cl, 2
    movzx eax, cl
    ret
encode endp

start:
    push offset mode_read
    push offset file_input
    call fopen
    add esp, 8
    mov fp_in, eax
    
    push offset mode_write
    push offset file_output
    call fopen
    add esp, 8
    mov fp_out, eax
    
    push offset buffer
    push offset fmt_read
    push fp_in
    call fscanf
    add esp, 12
    
    push offset exclude_char
    push offset fmt_char
    call scanf
    add esp, 8

	mov esi, 0
    mov edi, 0  ; index for writing to the file

encode_loop:
    mov al, buffer[esi]
    cmp al, 0
    je end_encode

    mov ecx, eax
    call encode

    cmp al, exclude_char
    jne write_char

    mov [edi], al
    inc edi

write_char:
    mov [edi], al
    inc edi
    inc esi
    jmp encode_loop

end_encode:
    mov esi, 0
write_loop:
    mov al, buffer[esi]
    cmp al, 0
    je end_write

    mov bl, buffer[esi + 1]
    cmp bl, 0
    je single_write

    push ebx
    push offset fmt_char
    push fp_out
    call fprintf
    add esp, 12

    push eax
    push offset fmt_char
    push fp_out
    call fprintf
    add esp, 12

    add esi, 2
    jmp write_loop

single_write:
    push eax
    push offset fmt_char
    push fp_out
    call fprintf
    add esp, 12
    jmp end_write

end_write:
    push fp_in
    call fclose
    add esp, 4

    push fp_out
    call fclose
    add esp, 4
    
    ; End program
    push 0
    call exit

end start
