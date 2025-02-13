.386
.model flat, stdcall
.stack 4096

includelib msvcrt.lib
extern exit: proc

.data
    a dw 13
    y dw 4
    sum_result dw 0
    j dw 1
    power_result_a dw 1
    power_result_bx dw 1

.code
public start
start:
    mov ax, 5
    mov bx, 13
    mov di, 2

sum_loop:
    cmp j, 20
    jg end_sum

    ; Calculate (j * AX) / (a ^ y)
    mov cx, ax
    imul j
    call power_a
    xor dx, dx
    cwde
    idiv power_result_a

    ; Calculate (j * AX) / (a ^ y) - (BX ^ DI) 
    mov bx, ax
    call power_bx
    sub bx, ax

    ; Divide by (20 + j)
    add bx, 20
    add bx, j
    cwde
    idiv bx

    add sum_result, ax
    inc j
    jmp sum_loop

end_sum:
    mov ax, sum_result
    ; Exit the program
    push 0
    call exit

power_a proc
    mov ax, 1
    mov cx, y
power_loop_a:
    test cx, cx
    jz end_power_a
    imul a
    loop power_loop_a
end_power_a:
    ret
power_a endp

power_bx proc
    mov ax, 1
    mov cx, di
power_loop_bx:
    test cx, cx
    jz end_power_bx
    imul bx
    loop power_loop_bx
end_power_bx:
    ret
power_bx endp

end start