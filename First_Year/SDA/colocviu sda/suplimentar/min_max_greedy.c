#include <stdio.h>
#include <stdlib.h>


int minim(int *v, int n){
    int min = v[0];
    for(int i = 1; i < n; i++){
        if(v[i] < min){
            min = v[i];
        }
    }
    return min;
}


int maxim(int *v, int n){
    int max = v[0];
    for(int i = 1; i < n; i++){
        if(v[i] > max){
            max = v[i];
        }
    }
    return max;
}


int main(){

    int v[] = {2, 3, 1};

    int n = sizeof(v) / sizeof(v[0]);

    printf("Minimul este: %d\n", minim(v, n));
    printf("Maximul este: %d\n", maxim(v, n));
    return 0;
}