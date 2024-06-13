.model flat, stdcall

; Includem biblioteci și declaram ce funcții vrem să importam
includelib msvcrt.lib
extern exit: proc

; Declaram simbolul start ca public - de acolo incepe executia
public start

; Sectiunile programului, date, respectiv cod
.data
    ; Aici declaram date
    n dd 3
    m dd 4

    F dd 1, 2, 3, 4,
		 5, 6, 7, 8,
		 9, 10, 11, 12

    k dd 3

.code
start:
    ; Iteram prin matricea F
    mov esi, 0 ; i
bucla:
    cmp esi, n
    jae final
    mov edi, 0 ; j

    ; Verificam conditia (i + j) % k = 0
    mov eax, esi
    add eax, edi
    mov ebx, k
    xor edx, edx
    div ebx
    test edx, edx
    jnz nu_este_divizibil

    ; Suma elementelor F[i][j]
    mov eax, esi
    imul eax, 4 ; F are elemente de 4 bytes
    add eax, edi
    imul eax, 4 ; F[i][j] este la offset-ul (i * 4 + j) * 4
    add eax, offset F
    add edx, [eax]

nu_este_divizibil:
    inc edi
    jmp bucla

final:
    ; Generam vectorul cerut
    mov esi, 0 ; i
    mov edi, 0 ; contor pentru vector
generare_vector:
    cmp esi, m
    jae sfarsit_generare
    mov eax, esi
    imul eax, 4 ; F are elemente de 4 bytes
    add eax, offset F
    mov ebx, k
    xor edx, edx
    mov ecx, 0 ; numarul de elemente mai mari decat k
verificare_element:
    add edx, [eax]
    cmp [eax], ebx
    jle nu_este_mai_mare
    inc ecx

nu_este_mai_mare:
    add eax, 4
    loop verificare_element

    ; Adaugam numarul de elemente la vector
    mov eax, esi
    imul eax, 4 ; Vectorul are elemente de 4 bytes
    add eax, offset F
    add eax, edi
    mov [eax], ecx

    inc esi
    inc edi
    jmp generare_vector

sfarsit_generare:
    ; Terminarea programului
    push 0
    call exit
end start
