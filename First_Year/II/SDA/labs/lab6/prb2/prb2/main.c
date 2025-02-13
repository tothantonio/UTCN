#include <stdio.h>
#include <stdlib.h>

typedef struct cell {
    int key;
    int status;
} CELL;

enum { FREE, OCCUPIED };

int hFunction(int key, int m) {
    return key % m;
}

void insert(CELL* T, int k, int m) {
    int index = hFunction(k, m);
    int start_index = index;
    do {
        if (T[index].status == FREE || T[index].key == k) {
            T[index].key = k;
            T[index].status = OCCUPIED;
            return;
        }
        index = hFunction(index + 1, m);
    } while (index != start_index); // Evităm bucla infinită
}

void remove_dup(char* input, char* output) {
    FILE* fin = fopen(input, "r");
    if (!fin)
        return;
    FILE* fout = fopen(output, "w");
    if (!fout)
        return;

    int m, n, number;
    fscanf_s(fin, "%d", &m); // Citim dimensiunea tabelului hash
    CELL* T = (CELL*)calloc(m, sizeof(CELL)); // Inițializăm tabelul hash

    fscanf_s(fin, "%d", &n); // Citim numărul de elemente
    for (int i = 0; i < n; i++) {
        fscanf_s(fin, "%d", &number);
        insert(T, number, m);
    }

    for (int i = 0; i < m; i++) {
        if (T[i].status == OCCUPIED) {
            fprintf_s(fout, "%d ", T[i].key);
        }
    }

    fclose(fin);
    fclose(fout);
    free(T);
}

int main() {
    remove_dup("date.in", "date.out");
    return 0;
}
