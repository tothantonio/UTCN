#include <stdio.h>
#include <stdlib.h>

void interclasare(int *v, int st, int mij, int dr){
    int n1 = mij - st + 1;
    int n2 = dr - mij;
    int *L = (int*)malloc(n1 * sizeof(int));
    int *R = (int*)malloc(n2 * sizeof(int));
    for(int i = 0; i < n1; i++){
        L[i] = v[st + i];
    }
    for(int i = 0; i < n2; i++){
        R[i] = v[mij + 1 + i];
    }
    int i = 0, j = 0, k = st;
    while(i < n1 && j < n2){
        if(L[i] <= R[j]){
            v[k] = L[i];
            i++;
        }else{
            v[k] = R[j];
            j++;
        }
        k++;
    }
    while(i < n1){
        v[k] = L[i];
        i++;
        k++;
    }
    while(j < n2){
        v[k] = R[j];
        j++;
        k++;
    }
    free(L);
    free(R);
}

void merge_sort(int *v, int st, int dr){
    if(st < dr){
        int mij = (st + dr) / 2;
        merge_sort(v, st, mij);
        merge_sort(v, mij + 1, dr);
        interclasare(v, st, mij, dr);
    }
}

int main(){

    int v[] = {9, 8, 7, 6, 5, 4, 3, 2, 1};
    int n = sizeof(v) / sizeof(v[0]);

    merge_sort(v, 0, n - 1);

    for(int i = 0; i < n; i++){
        printf("%d ", v[i]);
    }
    return 0;
}