.386
.model flat, stdcall
includelib msvcrt.lib
extern exit: proc
public start
.data
s1 dd 1, 3, 5
len1 dd ($ - s1) / 4
s2 dd 2, 4
len2 dd ($ - s2) / 4
s3 dd 100 dup(0)
.code
start:
	mov esi, 0
	mov edi, 0
	mov ebx, 0
	
	mov ecx, len1
	add ecx, len2
	
	et_loop:
		mov eax, s1[esi * 4]
		cmp eax, s2[edi * 4]
		jg greater
		
		smaller:
			cmp esi, len1
			jge greater
			
			mov s3[ebx * 4], eax
			
			inc esi
			inc ebx
			jmp finish
		
		greater:
			cmp edi, len2
			jge smaller
			
			mov eax, s2[edi * 4]
			mov s3[ebx * 4], eax
			
			inc edi
			inc ebx
	
	finish:
		loop et_loop
	
	push 0
	call exit
end start