.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; includem msvcrt.lib, și declaram ce funcții vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; sectiunile programului, date, respectiv cod
.data
    b dw 9
    x dw 19
.code
start:
    ; Inițializăm variabilele
    mov DI, 10
    mov DX, 11
    mov SI, 18

    ; Calculăm (b ^ DI)
    mov ax, b
    xor ax, DI

    ; Înmulțim rezultatul cu 4 (echivalent cu (b ^ DI) << 2)
    shl ax, 2

    ; Calculăm (x << 4)
    mov bx, x
    shl bx, 4

    ; Calculăm (SI | DX)
    mov cx, SI
    or cx, DX

    ; Calculăm (x << 4) ^ (SI | DX)
    xor bx, cx

    ; Negăm rezultatul ((x << 4) ^ (SI | DX))
    not bx

    ; Aplicăm operația AND între rezultatul (b ^ DI) << 2 și ~((x << 4) ^ (SI | DX))
    and ax, bx

    ; Rezultatul final este înregistrul AX

    ; Iesire
    push 0
    call exit
end start
