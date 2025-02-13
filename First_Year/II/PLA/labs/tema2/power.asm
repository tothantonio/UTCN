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
    ; Initialize sum_result to 0
    mov sum_result, 0

    ; Loop from j = 1 to j = 20
    mov j, 1
sum_loop:
    cmp j, 21
    jge end_sum

    ; Calculate a^y and store in power_result_a
    mov ax, a
    mov cx, y
    call power
    mov power_result_a, ax

    ; Calculate BX^DI and store in power_result_bx
    mov ax, 13       ; BX value
    mov cx, 2        ; DI value
    call power
    mov power_result_bx, ax

    ; Perform the calculation for the expression
    mov ax, 5        ; AX value
    imul j
    idiv power_result_a
    sub ax, power_result_bx
    mov bx, 20
    add bx, j
    idiv bx

    ; Add the result to sum_result
    add sum_result, ax

    ; Increment j and repeat the loop
    inc j
    jmp sum_loop

end_sum:
    ; Move the sum_result to AX to return it
    mov ax, sum_result

    ; Exit the program
    push 0
    call exit

power proc
    ; Power calculation procedure
    mov ax, 1
power_loop:
    test cx, cx
    jz end_power
    imul a
    loop power_loop
end_power:
    ret
power endp

end start
