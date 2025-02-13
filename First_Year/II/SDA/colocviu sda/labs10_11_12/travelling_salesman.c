#include <stdio.h>
#include <stdlib.h>

int n = 4;
int a[4][4] = {
    {0, 10, 15, 20},
    {10, 0, 35, 25},
    {15, 35, 0, 30},
    {20, 25, 30, 0}
};

int viz[4];

void tsp(int nod){
    viz[nod] = 1;
    printf("%d ", nod);
    int min = 9999;
    int next = -1;
    for(int i = 0; i < n; i++){
        if(a[nod][i] < min && viz[i] == 0){
            min = a[nod][i];
            next = i;
        }
    }
    if(next != -1){
        tsp(next);
    }
}

int main(){

    tsp(0);
    return 0;
}