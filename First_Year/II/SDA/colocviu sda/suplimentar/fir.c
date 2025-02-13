#include <stdio.h>

void findVariations(int L, int lengths[], int numLengths) {
    int i, j, k;
    int variations = 0;
    int optimalVariation = 0;
    int optimalDifference = L;

    for (i = 0; i < numLengths; i++) {
        int sum = lengths[i];
        int difference = 1;

        if (sum == L) {
            variations++;
            optimalVariation = i;
            optimalDifference = 0;
        }

        for (j = i + 1; j < numLengths; j++) {
            sum += lengths[j];
            difference++;

            if (sum == L) {
                variations++;
                if (difference <= optimalDifference) {
                    optimalVariation = i;
                    optimalDifference = difference;
                }
            }
        }
    }

    printf("Total variations: %d\n", variations);
    printf("Optimal variation: ");

    if (optimalVariation != 0) {
        printf("%d", lengths[0]);
    }

    for (k = 1; k <= optimalVariation; k++) {
        printf(" + %d", lengths[k]);
    }

    printf("\n");
}

int main() {
    int L = 10;
    int lengths[] = {2, 3, 5, 7};
    int numLengths = sizeof(lengths) / sizeof(lengths[0]);

    findVariations(L, lengths, numLengths);

    return 0;
}