#include <stdio.h>
#include <stdlib.h>

// avand un sir cu n numere, sa se imparta in k subsiruri care au aceeasi suma, backtracking

void printSolution(int *v, int n, int k){
    for(int i = 0; i < k; i++){
        for(int j = 0; j < n; j++){
            if(v[j] == i){
                printf("%d ", j);
            }
        }
        printf("\n");
    }
}

int isSafe(int *v, int n, int k, int *sum, int *sums, int *used, int index){
    if(used[index] == 1){
        return 0;
    }

    if(sums[v[index]] + sum[index] > sum[0]){
        return 0;
    }

    return 1;
}

void back(int *v, int n, int k, int *sum, int *sums, int *used, int index){
    if(index == n){
        printSolution(v, n, k);
        return;
    }

    for(int i = 0; i < k; i++){
        v[index] = i;
        if(isSafe(v, n, k, sum, sums, used, index)){
            sums[v[index]] += sum[index];
            used[index] = 1;
            back(v, n, k, sum, sums, used, index + 1);
            sums[v[index]] -= sum[index];
            used[index] = 0;
        }
    }
}

void divide(int *v, int n, int k){
    int sum[100], sums[100], used[100];
    for(int i = 0; i < n; i++){
        printf("Enter number %d: ", i+1);
        scanf("%d", &v[i]);
        sum[i] = rand() % 10 + 1;
        sums[i] = 0;
        used[i] = 0;
    }

    for(int i = 0; i < n; i++){
        printf("%d ", sum[i]);
    }
    printf("\n");

    back(v, n, k, sum, sums, used, 0);
}

int main(){

    int v[100], n = 5, k = 3;

    divide(v, n, k);
    
    return 0;
}