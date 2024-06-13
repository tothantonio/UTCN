#include <stdio.h>
#include <stdlib.h>

void print_subset(int subset[], int len){
    for(int i = 0; i < len; i++)
        printf("%d ", subset[i]);
    printf("\n");
}

void backT(int set[], int subset[], int n, int len, int total, int nodeCount, int sum){
    if(total == sum){
        print_subset(subset, len);
        return;
    }

    for(int i = nodeCount; i < n; i++){
        subset[len] = set[i];
        backT(set, subset, n, len + 1, total + set[i], i + 1, sum);
    }
}

int main(){

    int set[] = {1, -3, 5, -7, 2, 6};
    int sum = 6;
    int len = sizeof(set) / sizeof(int);
    int* subset = (int*)malloc(len * sizeof(int));

    backT(set, subset, len, 0, 0, 0, sum);
    free(subset);
    return 0;
}