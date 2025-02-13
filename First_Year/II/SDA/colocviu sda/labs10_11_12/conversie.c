#include <stdio.h>
#include <stdlib.h>

// sa se det x in baza b, greedy

int x = 2;
int b = 2;

void conversie(int x, int b){
    int i = 0;
    int v[100];
    while(x > 0){
        v[i] = x % b;
        x /= b;
        i++;
    }
    for(int j = i-1; j >= 0; j--){
        printf("%d", v[j]);
    }
}
int main(){

    conversie(x, b);
    return 0;
}