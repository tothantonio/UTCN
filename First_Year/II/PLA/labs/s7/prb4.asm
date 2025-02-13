.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern printf: proc
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
sir dd 1, 2, 3, 4
lungime dd 4
nr dd 6
mesajGasit db "Elementul %d a fost gasit la indexul %d.", 13, 10, 0
mesajNegasit db "Elementul %d nu a fost gasit.", 13, 10, 0

.code
binSearch PROC
    push ebp
    mov ebp, esp
    sub esp, 4 

    mov eax, [ebp+8] ; eax <- sir
    mov ecx, [ebp+12] ; ecx <- nr
    mov edx, [ebp+16] ; edx <- lungime

    mov esi, eax ; esi <- sir
    xor eax, eax ; eax <- 0 (left)
    dec edx ; edx <- lungime - 1 (right)

searchLoop:
    cmp eax, edx
    jg notFound

    mov ebx, eax
    add ebx, edx
    shr ebx, 1

    mov edi, [esi + ebx*4] ; edi <- sir[mijloc]
    cmp edi, ecx
    je found
    jl searchLeft
    jg searchRight

searchLeft:
    dec ebx
	mov edx, ebx
    jmp searchLoop

searchRight:
    inc ebx
	mov eax, ebx
    jmp searchLoop

found:
    mov [ebp-4], ebx 
    jmp endSearch

notFound:
    mov dword ptr [ebp-4], -1 

endSearch:
    mov eax, dword ptr[ebp-4]
    mov esp, ebp
    pop ebp
    ret 12

binSearch ENDP

start:
    push lungime
    push nr
    push OFFSET sir
    call binSearch
    cmp eax, -1
    jne element_gasit
    push nr
    push OFFSET mesajNegasit
    call printf
    add esp, 8 
    jmp sfarsit_program

element_gasit:
    push eax 
    push nr
    push OFFSET mesajGasit
    call printf
    add esp, 12 

sfarsit_program:
    push 0
    call exit
end start
