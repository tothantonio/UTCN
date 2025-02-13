#include <stdio.h>
#include <stdlib.h>

int min_num_bancnotes = INT_MAX;

void backtracking(int *valori, int n, int rest, int current_num_bancnotes, int index) {
    if (rest == 0) {
        if (current_num_bancnotes < min_num_bancnotes) {
            min_num_bancnotes = current_num_bancnotes;
        }
        return;
    }

    if (index >= n || current_num_bancnotes >= min_num_bancnotes) {
        return;
    }

    int max_num_bancnotes = rest / valori[index];
    for (int i = max_num_bancnotes; i >= 0; i--) {
        backtracking(valori, n, rest - i * valori[index], current_num_bancnotes + i, index + 1);
    }
}

int numarare_rest(int *valori, int n, int rest) {
    min_num_bancnotes = INT_MAX;
    backtracking(valori, n, rest, 0, 0);
    return min_num_bancnotes;
}

int main() {
    int valori[] = {10, 10, 5, 20, 5, 5};
    int n = 6;
    int rest = 50;
    printf("Numarul minim de bancnote si monede necesare pentru a plati restul %d este %d\n", rest, numarare_rest(valori, n, rest));

    return 0;
}