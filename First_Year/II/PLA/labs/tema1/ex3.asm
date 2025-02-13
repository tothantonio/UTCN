.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

; declaram simbolul start ca public - de acolo incepe executia
public start

; sectiunile programului, date, respectiv cod
.data
b dd 0
z dd 0
.code
start:
    ; Incarcam valorile pentru variabilele b si z
    mov ebx, 9
    mov edx, 16  
    mov esi, 13
    mov b, 19
    mov z, 20

    mov eax, ebx  ; Salveaza EBX in EAX pentru a face impartirea
    mov ecx, 5    ; ECX = 5 
    mov edx, 0    ; Resetam EDX la zero
    div ecx       ; EAX = EBX / 5
    mov ebx, eax  ; Rezultatul este salvat in EBX

    mov eax, b    ; Salveaza b in EAX pentru a face impartirea
    mov ecx, 6    ; ECX = 6 
    mov edx, 0    ; Resetam EDX la zero
    div ecx       ; EAX = b / 6
	mov ebp, eax

    mov eax, edx  ; Salveaza EDX in EAX pentru a face impartirea
    mov ecx, z    ; Incarcam z in ECX
    mov edx, 0    ; Resetam EDX la zero
    div ecx       ; EAX = EDX / z
    mov edx, eax  ; Rezultatul este salvat in EDX

    mov eax, z    ; Incarcam z in EAX
    sub eax, esi  ; Scadem ESI din z
    mov ecx, 15   ; Incarcam 15 in ECX
    mov edx, 0    ; Resetam EDX la zero
    div ecx       ; EAX = 15 / (z - ESI)

    imul edx, eax 
    add ebx, edx   

    ; Salvez rezultatul final in EAX
    mov eax, ebx

    ; Iesire
    push 0
    call exit

end start
