#include <stdio.h>
#include <stdlib.h>

void back(int n, int* sol, int k, int* viz){
    if(k == n){
        for(int i = 0; i < n; i++){
            printf("%d ", sol[i]);
        }
        printf("\n");
    }else{
        for(int i = 1; i <= n; i++){
            if(viz[i] == 0){
                sol[k] = i;
                viz[i] = 1;
                back(n, sol, k + 1, viz);
                viz[i] = 0;
            }
        }
    }
}

void generare_permutari(int n){
    int* sol = (int*)malloc(n * sizeof(int));
    int* viz = (int*)calloc(n + 1, sizeof(int));
    back(n, sol, 0, viz);
    free(sol);
    free(viz);
}


int main(){

    generare_permutari(3);
    
    return 0;
}