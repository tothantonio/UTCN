 .386
.model flat, stdcall

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern printf: proc
extern scanf: proc
extern exit: proc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; declaram simbolul start ca public - de acolo incepe executia
public start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; sectiunile programului, date, respectiv cod
.data
array1 dd 2 dup(0)                    
array2 dd 2 dup(0)                    
format_input db "%d", 0               
format_cartesian db "(%d, %d) ", 0    

.code
CartesianProduct proc
    mov esi, offset array1            
    mov edi, offset array2            
    mov ecx, 2                        

outer_loop:
    push ecx                          
    mov ebx, 2                        ; resetez cnt pentru bucla interioara

inner_loop:
    push ebx                          ; salvez cnt pentru bucla interioara

    ; afisam perechea curenta
    push dword ptr [edi]              ; al doilea element al perechii
    push dword ptr [esi]              ; primul element al perechii
    push offset format_cartesian
    call printf
    add esp, 12                       

    pop ebx                           
    add edi, 4                        ; trecem la urmatorul element din al doilea sir
    dec ebx                           ; decrementam contorul pentru bucla interioara
    jnz inner_loop                    ; continuam bucla int daca mai sunt elemente

    pop ecx                           
    add esi, 4                        
    mov edi, offset array2            
    loop outer_loop                   

    ret
CartesianProduct endp
start:
    ; citim valorile in primul sir
    lea eax, [array1]
    push eax
    push offset format_input
    call scanf
    add esp, 8

    lea eax, [array1+4]
    push eax
    push offset format_input
    call scanf
    add esp, 8

    ; citim valorile in al doilea sir
    lea eax, [array2]
    push eax
    push offset format_input
    call scanf
    add esp, 8

    lea eax, [array2+4]
    push eax
    push offset format_input
    call scanf
    add esp, 8

    call CartesianProduct

    ; terminarea programului
    push 0
    call exit
end start
