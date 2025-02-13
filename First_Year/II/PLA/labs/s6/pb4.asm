.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern fgets: proc
extern fprintf: proc
extern fopen: proc
extern fclose: proc
extern fseek: proc
extern ftell: proc

public start

.data

strbuf db 100 dup(0)
seekline dd 20 dup(0)
maxlen dd 100
finname db "intrare.txt",0
foutname db "iesire.txt",0
readmode db "r",0
writemode db "w",0
writeformat db "%s",0

finaddr dd 0
foutaddr dd 0

.code
start:
    xor eax,eax
    xor ebx,ebx
    xor ecx, ecx
    push offset writemode
    push offset foutname
    call fopen
    add esp, 8
    mov foutaddr, eax 
    push offset readmode
    push offset finname
    call fopen
    add esp, 8 
    
    mov finaddr, eax 
    
    xor esi, esi ; esi will be used to index the seekline array
nlloop:
    ; read line
    push finaddr
    push maxlen
    push offset strbuf
    call fgets
    add esp, 12
    
    mov ebx, eax ; ebx stores fgets return val
    
    push finaddr
    call ftell
    add esp, 4
    mov [seekline + esi*4], eax ; store end of line offset
    inc esi
    
    cmp ebx, 0
    je printloop ; if we've reached EOF, jump to printloop

printloop:
    dec esi
    push 0
    push [seekline + esi*4]
    push finaddr
    call fseek
    add esp, 12
    
    push finaddr
    push maxlen
    push offset strbuf
    call fgets
    add esp, 12
    
    push offset strbuf
    push offset writeformat
    push foutaddr
    call fprintf
    add esp, 12
    
    cmp esi, 0
    jne printloop ; if esi is not 0, there are more lines to print

    ; The first line at offset 0 is not taken in the array
    push 0
    push 0
    push finaddr
    call fseek
    add esp, 12
    
    push finaddr
    push maxlen
    push offset strbuf
    call fgets
    add esp, 12
    
    push offset strbuf
    push offset writeformat
    push foutaddr
    call fprintf
    add esp, 12
    
    ; close files
    push finaddr
    call fclose
    add esp, 4
    push foutaddr
    call fclose
    add esp, 4
    
    push 0
    call exit
end start
