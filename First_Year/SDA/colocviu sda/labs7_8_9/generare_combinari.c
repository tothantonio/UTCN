#include <stdio.h>
#include <stdlib.h>

void back(int n, int k, int* sol, int* viz, int* nr, int prev){
    if(k == 0){
        for(int i = 1; i <= n; i++){
            if(viz[i] == 1){
                printf("%d ", i);
            }
        }
        printf("\n");
        (*nr)++;
    }else{
        for(int i = prev + 1; i <= n; i++){ 
            if(viz[i] == 0){
                sol[k - 1] = i;
                viz[i] = 1;
                back(n, k - 1, sol, viz, nr, i); 
                viz[i] = 0;
            }
        }
    }
}

void generare_combinari(int n, int k){
    int* sol = (int*)malloc(k * sizeof(int));
    int* viz = (int*)calloc(n + 1, sizeof(int));
    int nr = 0;
    back(n, k, sol, viz, &nr, 0); 
    printf("Numarul de solutii este: %d\n", nr);
    free(sol);
    free(viz);
}

int main(){
    generare_combinari(5, 4);
    return 0;
}
