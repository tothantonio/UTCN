#include <stdio.h>
#include <stdlib.h>


int set[6] = {1, 3, 5, 7, 2, 6};
int n;
int sum;

void print_exp(int* subset, int subsetSize, int* signs) {
    for (int i = 0; i < subsetSize; i++) {
        if (i > 0) {
            printf("%c", signs[i] == 1 ? '+' : '-');
        }
        printf("%d", subset[i]);
    }
    printf("\n");
}

void backT(int index, int currentSum, int* subset, int subsetSize, int* signs) {
    if (index == n) {
        if (currentSum == sum) {
            print_exp(subset, subsetSize, signs);
        }
        return;
    }

    signs[subsetSize] = 1;
    subset[subsetSize] = set[index];
    backT(index + 1, currentSum + set[index], subset, subsetSize + 1, signs);

    signs[subsetSize] = -1;
    backT(index + 1, currentSum - set[index], subset, subsetSize + 1, signs);
}

int main() {

    n = 6;
    sum = 0;

    int subset[6];
    int signs[6];
    backT(0, 0, subset, 0, signs);

    return 0;
}
