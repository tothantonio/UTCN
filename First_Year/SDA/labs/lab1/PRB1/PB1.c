#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char nume[31];
    char prenume[31];
    int varsta;
    int note[3];
    float medie;
} Student;

int main() {
    FILE *fisier = fopen("input.txt", "r");
    if (!fisier){
        return -1;
    }

    int n;
    fscanf(fisier, "%d", &n);

    Student *studenti = (Student*)malloc(n * sizeof(Student));
    if (!studenti)
        return -2;

    for (int i = 0; i < n; i++) {
        fscanf(fisier, "%s %s %d", studenti[i].nume, studenti[i].prenume, &studenti[i].varsta);
        for (int j = 0; j < 3; j++) {
            fscanf(fisier, "%d", &studenti[i].note[j]);
        }
    }

    fclose(fisier);

    printf("Studentii si mediile lor:\n");
    for (int i = 0; i < n; i++) {
        float sumaNote = 0;
        for (int j = 0; j < 3; j++) {
            sumaNote += studenti[i].note[j];
        }
        studenti[i].medie = sumaNote / 3;

        printf("%s %s, varsta: %d, note:", studenti[i].nume, studenti[i].prenume, studenti[i].varsta);
        for (int j = 0; j < 3; j++) {
            printf(" %d", studenti[i].note[j]);
        }
        printf(", media: %.2f\n", studenti[i].medie);
    }

    printf("\nIncrementam notele pentru fiecare student:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < 3; j++) {
            studenti[i].note[j]++;
        }
    }

    printf("Studentii cu notele incrementate:\n");
    for (int i = 0; i < n; i++) {
        printf("%s %s, note:", studenti[i].nume, studenti[i].prenume);
        for (int j = 0; j < 3; j++) {
            printf(" %d", studenti[i].note[j]);
        }
        printf("\n");
    }
    free(studenti);
    return 0;
}
