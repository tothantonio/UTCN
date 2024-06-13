.386
.model flat, stdcall

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Include libraries, and declare which functions we want to import
includelib msvcrt.lib
extern exit: proc
extern fopen: proc
extern fclose: proc
extern fscanf: proc
extern fprintf: proc
extern scanf: proc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Declare the start symbol as public - that's where execution begins
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Sections of the program: data and code
.data
; Declare data
mode_read db "r", 0
mode_write db "w", 0

file_name_in db "in.txt", 0
file_name_out db "out.txt", 0
f_read db "%s", 0
f_write db "%c", 0

fp_in dd 0
fp_out dd 0
sir db 1024 dup(0)
f db "%c", 0
char db 0

.code

; Macro to encode a character
ENCODE_CHAR MACRO char
    mov al, char
    add al, 3
ENDM

start:
    push offset mode_read
    push offset file_name_in
    call fopen
    add esp, 8
    mov fp_in, eax
    
    push offset mode_write
    push offset file_name_out
    call fopen
    add esp, 8
    mov fp_out, eax

    push offset sir
    push offset f_read
    push fp_in
    call fscanf
    add esp, 12
    
    push offset char
	push offset f
	call scanf
	add esp, 8

    mov esi, 0
encode_loop:
    mov al, sir[esi]
    cmp al, 0
    je end_encode

    ENCODE_CHAR al

    cmp al, char
    je skip_char

    push eax
    push offset f_write
    push fp_out
    call fprintf
    add esp, 12

skip_char:
    inc esi
    jmp encode_loop

end_encode:
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
