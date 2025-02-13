.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
ANGAJAT struct
	nume DB 20 dup(0)
	salariu DW 0
ANGAJAT ends

nrAngajati DW 4
angajati ANGAJAT {"georgescu", 100} , {"pop", 100}, {"popescu", 300}, {"ionescu", 450}

s dw 0
.code
start:
	
	;aici se scrie codul
	lea esi, angajati ;esi e la "georgescu"
	mov eax, 0
	
	add ax, word ptr[esi + 20] ; adum 20 pt ca nume are 20 
	add esi, 22 ; adun 22 pt ca trec la urm element
	
	add ax, word ptr[esi + 20] ; adum 20 pt ca nume are 20 
	add esi, 22 ; adun 22 pt ca trec la urm element
	
	add ax, word ptr[esi + 20] ; adum 20 pt ca nume are 20 
	add esi, 22 ; adun 22 pt ca trec la urm element
	
	add ax, word ptr[esi + 20] ; adum 20 pt ca nume are 20 
	add esi, 22 ; adun 22 pt ca trec la urm element
	
	mov s, ax 
	
	;apel functie exit
	push 0
	call exit
end start



