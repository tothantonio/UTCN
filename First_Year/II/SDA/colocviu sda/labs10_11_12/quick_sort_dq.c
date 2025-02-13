#include <stdio.h>
#include <stdlib.h>


void swap(int *a, int *b){
    int aux = *a;
    *a = *b;
    *b = aux;
}

int partition(int *v, int st, int dr){
    int pivot = v[dr];
    int i = st - 1;
    for(int j = st; j < dr; j++){
        if(v[j] < pivot){
            i++;
            swap(&v[i], &v[j]);
        }
    }
    swap(&v[i + 1], &v[dr]);
    return i + 1;
}

void quick_sort(int *v, int st, int dr){
    if(st < dr){
        int pi = partition(v, st, dr);
        quick_sort(v, st, pi - 1);
        quick_sort(v, pi + 1, dr);
    }
}



int main(){

    int v[] = {9, 8, 7, 6, 5, 4, 3, 2, 1};
    int n = sizeof(v) / sizeof(v[0]);

    quick_sort(v, 0, n - 1);

    for(int i = 0; i < n; i++){
        printf("%d ", v[i]);
    }
    return 0;
}