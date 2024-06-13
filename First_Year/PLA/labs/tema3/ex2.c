/* Sa se scrie un program care calculeaza produsul cartezian a doua multimi A si
 B citite de la tastatura si il afiseaza pe ecran. Programul va folosi cel putin o
 functie (conventia stdcall).
 Exemplu: A = {1,2}; B = {3,4}; A×B = {(1,3),(1,4),(2,3),(2,4)}*/

#include <stdio.h>
#include <stdlib.h>

void produs_cartezian(int *a, int *b, int n, int m){
    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            printf("(%d, %d) ", a[i], b[j]);
        }
    }
}

int main(){
    int a[2] = {1, 2};
    int b[2] = {3, 4};
    produs_cartezian(a, b, 2, 2);
    return 0;
}