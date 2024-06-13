#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool ataca(int* sol, int k, int i) {
    for (int j = 0; j < k; j++) {
        if (sol[j] == i || abs(sol[j] - i) == abs(j - k)) {
            return true;
        }
    }
    return false;
}

void afisare_tabla(int* sol, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (sol[j] == i) {
                printf("R ");
            } else {
                printf(". ");
            }
        }
        printf("\n");
    }
    printf("\n");
}

void back(int n, int k, int* sol, int* viz, int* nr, int prev) {
    if (k == 0) {
        afisare_tabla(sol, n);
        (*nr)++;
    } else {
        for (int i = 0; i < n; i++) {
            if (viz[i] == 0 && !ataca(sol, k, i)) {
                sol[k - 1] = i;
                viz[i] = 1;
                back(n, k - 1, sol, viz, nr, i);
                viz[i] = 0;
            }
        }
    }
}

void aranjare_regine(int n) {
    int* sol = (int*)malloc(n * sizeof(int));
    int* viz = (int*)calloc(n, sizeof(int));
    int nr = 0;
    back(n, n, sol, viz, &nr, 0);
    printf("Numarul de solutii este: %d\n", nr);
    free(sol);
    free(viz);
}

int main() {
    aranjare_regine(4);
    return 0;
}