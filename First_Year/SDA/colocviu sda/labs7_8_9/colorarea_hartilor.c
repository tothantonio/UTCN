#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Functia pentru verificarea validitatii colorarii
int valid(int k, int* culori, int** vecini, int n) {
    for (int i = 0; i < n; i++) {
        if (vecini[k][i] == 1 && culori[k] == culori[i]) {
            return 0;
        }
    }
    return 1;
}

// Functia recursiva pentru generarea colorarilor
void colorare(int k, int* culori, int** vecini, int n, int m, char** nume_culori, FILE* fout) {
    if (k == n) {
        // Daca am colorat toate tarile, afisam solutia
        for (int i = 0; i < n; i++) {
            fprintf(fout, "%s ", nume_culori[culori[i]]);
        }
        fprintf(fout, "\n");
    } else {
        // Incercam fiecare culoare pentru tara curenta
        for (int i = 0; i < m; i++) {
            culori[k] = i;
            if (valid(k, culori, vecini, n)) {
                colorare(k + 1, culori, vecini, n, m, nume_culori, fout);
            }
            culori[k] = -1; // Resetam culoarea la valoarea initiala
        }
    }
}

int main() {
    FILE* fin = fopen("map.in", "r");
    FILE* fout = fopen("map.out", "w");

    int n, m;
    fscanf(fin, "%d", &n); // Numarul de tari
    fscanf(fin, "%d", &m); // Numarul de culori

    int* culori = (int*)malloc(n * sizeof(int));
    int** vecini = (int**)malloc(n * sizeof(int*));
    char** nume_culori = (char**)malloc(m * sizeof(char*));
    for (int i = 0; i < m; i++) {
        nume_culori[i] = (char*)malloc(20 * sizeof(char));
    }

    for (int i = 0; i < n; i++) {
        vecini[i] = (int*)malloc(n * sizeof(int));
        for (int j = 0; j < n; j++) {
            vecini[i][j] = 0; // Initializam matricea de adiacenta cu 0
        }
    }

    // Citim relatiile de vecinatate si construim matricea de adiacenta
    char tara1[20], tara2[20];
    while (fscanf(fin, "%s %s", tara1, tara2) == 2) {
        int index1 = tara1[0] - 'A'; // Presupunem ca tarile sunt reprezentate prin litere
        int index2 = tara2[0] - 'A';
        vecini[index1][index2] = 1;
        vecini[index2][index1] = 1;
    }

    // Citim numele culorilor
    for (int i = 0; i < m; i++) {
        fscanf(fin, "%s", nume_culori[i]);
    }

    // Initializam toate culorile cu -1 (necolorat)
    for (int i = 0; i < n; i++) {
        culori[i] = -1;
    }

    // Apelam functia de colorare
    colorare(0, culori, vecini, n, m, nume_culori, fout);

    // Eliberam memoria alocata
    for (int i = 0; i < n; i++) {
        free(vecini[i]);
    }
    for (int i = 0; i < m; i++) {
        free(nume_culori[i]);
    }
    free(vecini);
    free(nume_culori);
    free(culori);

    fclose(fin);
    fclose(fout);

    return 0;
}
