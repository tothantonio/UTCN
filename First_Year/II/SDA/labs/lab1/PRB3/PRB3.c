#include <stdio.h>
#include <stdlib.h>

void adaugaLaInceput(int* sir, int capacitate, int element, int* size) {
    if (*size < capacitate) {
        for (int i = *size; i > 0; i--) {
            sir[i] = sir[i - 1];
        }
        sir[0] = element;
        (*size)++;
    } else {
        printf("Spatiul este insuficient.\n");
    }
}

int main() {
    int CAPACITY, SIZE;

    scanf("%d %d", &CAPACITY, &SIZE);

    int* sir = (int*)malloc(CAPACITY * sizeof(int));
    if (!sir) 
        return -1;

    printf("Introduceti %d numere pentru a fi inserate in sir:\n", SIZE);
    for (int i = 0; i < SIZE; i++) {
        int element;
        scanf("%d", &element);
        adaugaLaInceput(sir, CAPACITY, element, &SIZE);

        printf("Sirul dupa adaugarea elementului %d: ", i + 1);
        for (int j = 0; j < SIZE; j++) {
            printf("%d ", sir[j]);
        }
        printf("\n");
    }

    free(sir);

    return 0;
}
