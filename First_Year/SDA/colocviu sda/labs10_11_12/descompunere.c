#include <stdio.h>
#include <stdlib.h>

//sa se descompuna suma x folosind cat mai putine bancnote(greedy)

int x = 751;
int a[] = {1, 5, 10, 50, 100, 200, 500};

void descompunere(int x, int a[]){
    int i = 6;
    while(x > 0){
        if(x >= a[i]){
            printf("%d ", a[i]);
            x -= a[i];
        }else{
            i--;
        }
    }
}

int main(){

    descompunere(x, a);
    return 0;
}