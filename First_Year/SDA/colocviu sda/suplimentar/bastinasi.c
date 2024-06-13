#include <stdio.h>

void traverseRiver(int n, int k) {
    int canibalsOnShoreA = n;
    int canibalsOnShoreB = 0;

    while (canibalsOnShoreA > 0) {
        int canibalsInBoat = canibalsOnShoreA > k ? k : canibalsOnShoreA;
        int nonCanibalsInBoat = k - canibalsInBoat;

        canibalsOnShoreA -= canibalsInBoat;
        canibalsOnShoreB += canibalsInBoat;

        printf("%d canibals and %d non-canibals crossed the river.\n", canibalsInBoat, nonCanibalsInBoat);

        if (canibalsOnShoreA > 0) {
            canibalsInBoat = canibalsOnShoreA > nonCanibalsInBoat ? nonCanibalsInBoat : canibalsOnShoreA;
            nonCanibalsInBoat = nonCanibalsInBoat - canibalsInBoat;

            canibalsOnShoreA -= canibalsInBoat;
            canibalsOnShoreB += canibalsInBoat;

            printf("%d canibals and %d non-canibals crossed the river.\n", canibalsInBoat, nonCanibalsInBoat);
        }
    }

    printf("All canibals have crossed the river safely.\n");
}

int main() {
    int n, k;
    printf("Enter the number of canibals (n): ");
    scanf("%d", &n);
    printf("Enter the maximum capacity of the boat (k): ");
    scanf("%d", &k);

    traverseRiver(n, k);

    return 0;
}