#include <stdio.h>
#include <stdlib.h>

// Functie pentru interschimbarea a doua elemente
void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

// Functie pentru sortarea vagoanelor
int sortareVagoane(int vagoane[], int n) {
    int i, j, operatii = 0;
    for (i = 0; i < n-1; i++) {
        for (j = 0; j < n-i-1; j++) {
            if (vagoane[j] > vagoane[j+1]) {
                swap(&vagoane[j], &vagoane[j+1]);
                operatii++;
            }
        }
    }
    return operatii;
}

int main() {
    int n, k;
    printf("Introduceti numarul de vagoane: ");
    scanf("%d", &n);
    printf("Introduceti numarul de vagoane pe care le poate lua macaraua: ");
    scanf("%d", &k);
    
    int *vagoane = (int*)malloc(n * sizeof(int));
    printf("Introduceti ordinea initiala a vagoanelor: ");
    for (int i = 0; i < n; i++) {
        scanf("%d", &vagoane[i]);
    }
    
    int operatii = sortareVagoane(vagoane, n);
    
    if (operatii <= k) {
        printf("Numarul minim de operatii este: %d\n", operatii);
    } else {
        printf("Nu este posibil.\n");
    }
    
    free(vagoane);
    return 0;
}