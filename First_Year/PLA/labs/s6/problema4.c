/* Scrieti un program care citeste un fisier text pe mai multe linii si scrie liniile ntr-un
 alt fisier in ordine inversa. Se considera ca o linie se poate pastra in memorie, dar
 nu si intreg continutul fisierului. Pentru deplasare in cadrul unui fisier se poate folosi
 functia fseek.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    FILE *fisier1, *fisier2;
    char c;
    int i = 0, j = 0;
    char *linie[1000]; // Presupunem că nu avem mai mult de 1000 de linii
    char buffer[1000]; // Buffer pentru citirea fiecărei linii, presupunem că o linie nu depășește 1000 de caractere

    fisier1 = fopen("fisier1.txt", "r");
    fisier2 = fopen("fisier2.txt", "w");

    if (fisier1 == NULL || fisier2 == NULL) {
        printf("Unul dintre fisiere nu a putut fi deschis\n");
        exit(1);
    }

    // Citim fiecare linie și o stocăm în array-ul linie
    while (fgets(buffer, 1000, fisier1)) {
        linie[i] = malloc((strlen(buffer) + 1) * sizeof(char));
        if (linie[i] == NULL) {
            printf("Alocare memorie esuata\n");
            exit(1);
        }
        strcpy(linie[i], buffer);
        i++;
    }

    // Adăugăm manual un sfârșit de linie la ultima linie, dacă este necesar
    if (i > 0 && linie[i-1][strlen(linie[i-1]) - 1] != '\n') {
        int len = strlen(linie[i-1]);
        linie[i-1][len] = '\n';
        linie[i-1][len + 1] = '\0';
    }

    // Scriem liniile în ordine inversă în fisier2
    for (j = i - 1; j >= 0; j--) {
        fprintf(fisier2, "%s", linie[j]); // Buffer-ul include deja caracterul '\n'
        free(linie[j]); // Eliberăm memoria alocată pentru fiecare linie
    }

    fclose(fisier1);
    fclose(fisier2);

    return 0;
}
