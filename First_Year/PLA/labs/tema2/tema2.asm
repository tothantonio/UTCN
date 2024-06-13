.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; includem msvcrt.lib, și declaram ce funcții vrem să importăm
includelib msvcrt.lib
extern exit: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; sectiunile programului, date, respectiv cod
.data
    M DWORD 3
    N DWORD 3
    F DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9
    k DWORD 2
    sum DWORD 0
    i DWORD 0
    j DWORD 0

.code
start:
    mov ecx, M         ; Inițializăm iterarea pe linii
outer_loop:
    cmp ecx, 0         ; Verificăm dacă s-au parcurs toate liniile
    je end_outer_loop

    mov edx, N         ; Inițializăm iterarea pe coloane
inner_loop:
    cmp edx, 0         ; Verificăm dacă s-au parcurs toate coloanele
    je end_inner_loop

    mov eax, ecx       ; EAX = i
    add eax, edx       ; EAX = i + j
    cdq                ; Extindem semnul lui EAX pentru a face diviziunea corectă
    idiv k             ; EDX:EAX = (i + j) / k, rămâne în EDX restul
    test edx, edx      ; Testăm dacă restul este zero
    jnz not_divisible  ; Sărim peste adunare dacă nu este zero
    mov eax, [F + ecx*4 - 4 + edx*4 - 4]  ; Încărcăm valoarea elementului curent din matrice
    add [sum], eax     ; Adunăm elementul la suma totală

not_divisible:
    inc edx            ; Incrementăm indexul coloanei
    cmp edx, N         ; Verificăm dacă s-au parcurs toate coloanele
    jl inner_loop      ; Continuăm bucla internă dacă nu s-au parcurs toate coloanele
end_inner_loop:
    inc ecx            ; Incrementăm indexul liniei
    cmp ecx, M         ; Verificăm dacă s-au parcurs toate liniile
    jl outer_loop      ; Continuăm bucla externă dacă nu s-au parcurs toate liniile

end_outer_loop:
    ; La acest punct, suma elementelor care îndeplinesc condiția este stocată în sum
    ; Poți adăuga aici codul pentru a afișa suma sau pentru a o utiliza în continuare

    push sum
    push offset formatSum
    call printf

    push 0
    call exit

formatSum db "Suma elementelor care îndeplinesc condiția este: %d", 10, 0
