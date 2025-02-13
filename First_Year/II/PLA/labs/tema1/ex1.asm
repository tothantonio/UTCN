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
.code
start:
    ; initializez registrele
    mov cl, 16   
    mov dh, 11   

    ; Facem 12 - DH
    mov al, 12   ; Încărcăm 12 în AL
    sub al, dh   ; Scădem valoarea din DH din AL
    mov bl, al   ; Salvăm rezultatul în BL 

    ; Facem 10 / CL
    mov al, 10   ; Încărcăm 10 în AL
    mov ah, 0   ; Setăm registrul EAX la zero pentru a face impartirea
    div cl       ; Facem împărțirea: 10 / CL
    mov cl, al   ; Salvăm rezultatul în CL

    ; Adunăm rezultatul împărțirii la valoarea anterioară
    mov al, bl   ; Restaurăm rezultatul inițial al lui 12 - DH
    add al, cl   ; Adăugăm valoarea rezultatului împărțirii

    ; Rezultatul corect este în AL

    ; Iesire
    push 0
    call exit
end start
