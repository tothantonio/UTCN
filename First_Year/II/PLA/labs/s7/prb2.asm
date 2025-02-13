.386
.model flat, stdcall

includelib msvcrt.lib
extern printf: proc
extern exit: proc

; Declaram simbolul start ca public - de acolo incepe executia
public start

; Sectiunile programului, date, respectiv cod
.data
format db '%d', 0 

.code
; EAX pentru primul parametru, EDX pentru al doilea
IsDivisible proc
    mov eax, ecx        ; Primul parametru
    mov edx, 0          
    div dword ptr [esp+4]
    cmp edx, 0          
    je IsDivisible_End  ; Daca restul este 0, numerele sunt divizibile
    mov eax, 0          ;false
    ret
IsDivisible_End:
    mov eax, 1          ;true
    ret
IsDivisible endp

IsPrime proc
    push ebp
    mov ebp, esp
    mov ecx, [ebp+8]    ; Primul parametru 
    cmp ecx, 2
    jl NotPrime         ; Daca numarul este mai mic decat 2, nu este prim
    cmp ecx, 2
    je Prime            ; Daca numarul este 2, este prim
    mov ebx, 2          ; Incepe cu divizorul 2
CheckLoop:
    mov eax, ecx
    push ebx            
    call IsDivisible    
    pop ebx             ; Restaureaza divizorul
    test eax, eax
    jne NotPrime        ; Daca este divizibil, nu este prim
    inc ebx
    cmp ebx, ecx
    jl CheckLoop        ; Continua pana cand EBX este egal cu ECX
Prime:
    mov eax, 1          ; Numarul este prim
	ret
NotPrime:
    mov eax, 0          ; Numarul nu este prim
	ret
IsPrime endp

start:
    push 3           
    call IsPrime
    push eax            
    push offset format  
    call printf
    add esp, 8        

    ; Terminarea programului
    push 0
    call exit
end start
