#include <stdio.h>
#include <stdlib.h>

void adaugaLast(int *v, int *size, int capacity, int element) {
    if (*size < capacity) {
        v[*size] = element;
        (*size)++;
        
    } else{
            printf("Vectorul este plin:");
        }
}
int main() {
    int CAPACITY, SIZE;
    scanf("%d %d", &CAPACITY, &SIZE);

    int *v = (int *)malloc(CAPACITY * sizeof(int));
    if (!v)
        return -1;
    for (int i = 0; i < SIZE; i++) {
        int element;
        scanf("%d", &element);
        adaugaLast(v, &SIZE, CAPACITY, element);

        for (int j = 0; j < SIZE; j++) {
            printf("%d ", v[j]);
        }
        printf("\n");
    }
    free(v);
    return 0;
}
