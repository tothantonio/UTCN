#include <stdio.h>
#include <stdlib.h>

//problema rucsacului

int n = 3;
int w[3] = {10, 20, 30};
int v[3] = {60, 100, 120};

int W = 40;

void rucsac(int w[], int v[], int W){
    int x[100];
    for(int i = 0; i < n; i++){
        x[i] = 0; // obiecte
    }
    int weight = 0;
    int value = 0;
    for(int i = 0; i < n; i++){
        if(weight + w[i] < W){
            x[i] = 1;
            weight += w[i];
            value += v[i];
        }else{
            x[i] = (W - weight) / w[i];
            weight += x[i] * w[i];
            value += x[i] * v[i];
        }
    }
    printf("Greutatea: %d\n", weight);
    printf("Valoarea: %d\n", value);
    for(int i = 0; i < n; i++){
        printf("%d ", x[i]);
    }
}

int main(){

    rucsac(w, v, W);
    return 0;
}