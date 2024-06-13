.386
.model flat, stdcall

; Include libraries
includelib msvcrt.lib
extern exit: proc
extern fopen: proc
extern fclose: proc
extern printf: proc
extern fscanf: proc

public start

.data
; Declare data
n dd 0
x dd 0
mode_read db "r", 0
file_name db "inputs.txt", 0
fp dd 0
f db "%d", 0
.code
div3 proc
    push ebp
    mov ebp, esp
    
    mov edx, 0
	mov eax, ecx
	mov ebx, 10
	div ebx
	
	mov eax, edx
	mov edx, 0
	mov ebx, 3
	div ebx
	
	mov eax, 0
	cmp edx, 0
	jne end_proc
	mov eax, 1

end_proc:
    mov esp, ebp
    pop ebp
    ret 
div3 endp

start:
    push offset mode_read
    push offset file_name
    call fopen
    add esp, 8
    mov fp, eax
    
    push offset n
    push offset f
    push fp
    call fscanf
    add esp, 12 
    
	mov esi, 0
	mov edi, 0 ; sum
	
	bucla:
		push offset x
		push offset f
		push fp
		call fscanf
		add esp, 12
		
		mov ecx, x
		call div3
		cmp eax, 1
		jne next
		add edi, x
	
	next:
		inc esi
		cmp esi, n
		je final
	
	jmp bucla
	
	final:
		push fp
		call fclose
		add esp, 4
		push edi
		push offset f
		call printf
		add esp, 8
    
    ; Terminate the program
    push 0
    call exit

end start
