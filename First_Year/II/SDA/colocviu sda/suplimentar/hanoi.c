#include <stdio.h>
#include <stdlib.h>


void hanoi(int n, char a, char b, char c){
    if(n == 1){
        printf("Mutam discul 1 de pe tija %c pe tija %c\n", a, c);
        return;
    }
    hanoi(n - 1, a, c, b);
    printf("Mutam discul %d de pe tija %c pe tija %c\n", n, a, c);
    hanoi(n - 1, b, a, c);
}
int main(){

    int n = 3;
    hanoi(n, 'A', 'B', 'C');
    return 0;
}