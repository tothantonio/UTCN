.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
x dd 1
y dd 2
z dd 3
w dd 4
.code
func_cdecl proc
	push ebp
	mov ebp, esp
	
	mov eax, dword ptr[ebp + 8]
	add eax, dword ptr[ebp + 12]
	add eax, dword ptr[ebp + 16]
	add eax, dword ptr[ebp + 20]
	
	mov esp, ebp
	pop ebp
	ret 
func_cdecl endp
funct_stdcall proc
	push ebp
	mov ebp, esp
	
	mov eax, dword ptr[ebp + 8]
	add eax, dword ptr[ebp + 12]
	add eax, dword ptr[ebp + 16]
	add eax, dword ptr[ebp + 20]
	
	mov esp, ebp
	pop ebp
	ret 4
funct_stdcall endp

func_fastcall proc
	push ebp
	mov ebp, esp
	
	mov eax, ecx
	add eax, edx
	add eax, dword ptr[ebp + 8]
	add eax, dword ptr[ebp + 12]
	
	mov esp, ebp
	pop ebp
	ret 4
func_fastcall endp
start:
	;aici se scrie codul
	mov ecx, x
	mov edx, y
	push w 
	push z
	call func_fastcall
	;terminarea programului
	push 0
	call exit
end start
