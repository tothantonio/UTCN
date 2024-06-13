.386
.model flat, stdcall
.stack 4096

includelib msvcrt.lib
extern exit: proc

.data
M equ 2 ; rows
N equ 3 ; cols
k dd 2 
F dd 1, 2, 3,
	 5, 6, 4
	 
sum dd 0 
vector dd M dup(0) ; Vectorul pentru a stoca nr de elemente mai mari decât k

.code
start:
    mov ecx, 0 ; Cnt pentru rânduri
    lea esi, F ; Adresa de început a matricei F

calculate_sum:
    cmp ecx, M
    jge calculate_vector ; Dacă am terminat cu rândurile, trecem la calculul vectorului
    mov ebx, 0 ; Resetăm contorul pentru coloane

next_column_sum:
    cmp ebx, N
    jge increment_row_sum ; Dacă am terminat cu coloanele, incrementăm rândul
    mov eax, ecx
    add eax, ebx
    cdq ;sign extension
    idiv dword ptr [k]
    cmp edx, 0
    jne skip_element_sum ; Dacă (i + j) % k != 0, sărim peste element
    mov eax, dword ptr [esi+ebx*4] ; Încărcăm elementul din matrice în eax
    add [sum], eax ; 

skip_element_sum:
    inc ebx ;contorul coloanei
    jmp next_column_sum 

increment_row_sum:
    add esi, N*4 ; Mergem la următorul rând în matrice
    inc ecx ; Incrementăm contorul rândului
    jmp calculate_sum ; Trecem la următorul rând

calculate_vector:
    mov ecx, 0 ; Resetăm contorul pentru rânduri
    lea esi, F ; Resetăm adresa de început a matricei F
    lea edi, vector ; Adresa de început a vectorului

fill_vector:
    cmp ecx, M
    jge end_program 
    mov ebx, 0 ; Resetăm contorul pentru coloane
    xor edx, edx ; Resetăm contorul pentru elemente mai mari decât k

next_column_vector:
    cmp ebx, N
    jge store_count ; Dacă am terminat cu coloanele, stocăm contorul
    mov eax, dword ptr [esi+ebx*4] ; Încărcăm elementul din matrice în eax
    cmp eax, dword ptr [k]
    jle skip_count ; Dacă elementul nu este mai mare decât k, sărim peste
    inc edx ; Incrementăm contorul pentru elemente mai mari decât k

skip_count:
    inc ebx ; Incrementăm contorul coloanei
    jmp next_column_vector 

store_count:
    mov [edi+ecx*4], edx ; Stocăm contorul în vector
    add esi, N*4 ; Mergem la următorul rând în matrice
    inc ecx ; Incrementăm contorul rândului
    jmp fill_vector ; Trecem la următorul rând

end_program:
    mov eax, [sum] 
    push 0
    call exit
end start
