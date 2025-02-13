#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char nume[50];
    float medie;
    int nota1;
    int nota2;
} Candidat;

void calculMedii(Candidat candidati[], int n) {
    for (int i = 0; i < n; i++) {
        candidati[i].medie = (candidati[i].nota1 + candidati[i].nota2) / 2.0;
    }
}

void repartizareAdmisi(Candidat candidati[], int n, int m) {
    // Sortare candidati dupa medie in ordine descrescatoare
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (candidati[j].medie < candidati[j + 1].medie) {
                Candidat temp = candidati[j];
                candidati[j] = candidati[j + 1];
                candidati[j + 1] = temp;
            }
        }
    }

    // Repartizare candidati admisi dupa optiuni
    int admisi[100];
    for (int i = 0; i < m; i++) {
        admisi[i] = 0;
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (admisi[j] < m) {
                admisi[j]++;
                printf("Candidatul %s a fost admis la optiunea %d\n", candidati[i].nume, j + 1);
                break;
            }
        }
    }
}

void afisareNeadmis(Candidat candidati[], int n) {
    // Sortare candidati dupa medie in ordine descrescatoare
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (candidati[j].medie < candidati[j + 1].medie) {
                Candidat temp = candidati[j];
                candidati[j] = candidati[j + 1];
                candidati[j + 1] = temp;
            }
        }
    }

    // Afisare candidati neadmis
    printf("Candidatii neadmis:\n");
    for (int i = 0; i < n; i++) {
        if (candidati[i].medie < 5.00) {
            printf("%s - Medie: %.2f\n", candidati[i].nume, candidati[i].medie);
        }
    }
}

int main() {
    int n, m;

    printf("Introduceti numarul de candidati: ");
    scanf("%d", &n);

    Candidat candidati[100];

    for (int i = 0; i < n; i++) {
        printf("Introduceti numele candidatului %d: ", i + 1);
        scanf("%s", candidati[i].nume);
        printf("Introduceti nota 1 a candidatului %d: ", i + 1);
        scanf("%d", &candidati[i].nota1);
        printf("Introduceti nota 2 a candidatului %d: ", i + 1);
        scanf("%d", &candidati[i].nota2);
    }

    calculMedii(candidati, n);

    printf("Introduceti numarul de optiuni: ");
    scanf("%d", &m);

    repartizareAdmisi(candidati, n, m);

    afisareNeadmis(candidati, n);

    return 0;
}