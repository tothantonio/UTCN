#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define NDEBUG

void merge(int *a, int p, int m, int q){
    int* aux = (int*) malloc((q-p+1) * sizeof(int));
    int i = p, k = p, j = m + 1;
    while(i <= m && j <= q){
        if(a[i] <= a[j]){
            aux[k++] = a[i];
            i++;
        }
        else{
            aux[k++] = a[j];
            j++; 
        }
    }
    while(i <= m){
        aux[k++] = a[i++];
    }
    while(j <= q){
        aux[k++] = a[j++];
    }
    for(int kk = p; kk <= q; kk++){
        a[kk] = aux[kk];
    }
    free(aux);
}
void merge_sort(int *a, int p, int q) {
    if (p >= q)
        return;
    int m = (p + q) / 2;
    merge_sort(a, p, m);
    merge_sort(a, m+1, q);
    merge(a, p, m, q);
}

int main() {
    int numbers[] = {4, 9, 3, 1, 5, 7, 8, 6, 2};
    int expected[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

    int n = (int) (sizeof(numbers) / sizeof(int));
    merge_sort(numbers, 0, n-1);
    for (int i = 0; i < n; i++) {
        assert(numbers[i] == expected[i]);
    }
    return 0;
}