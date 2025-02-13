#include <stdio.h>
#include <stdlib.h>

//descompune nr x, intr-o suma de puteri a lui 2 (1, 2, 4, ...), greedy

int x = 100;

void descompune(int x){
    int i = 0;
    int v[100];
    while(x > 0){
        v[i] = x % 2;
        x /= 2;
        i++;
    }
    for(int j = i-1; j >= 0; j--){
        if(v[j] == 1){
            printf("%d ", 1 << j);
        }
    }
}
int main(){  

    descompune(x);  
    return 0;
}