#include <stdio.h>
#include <stdbool.h>
#include <string.h>

int n, m;
char colors[10][10]; 
int adjacency[50][50]; 
char countryNames[50][10]; 

int getCountryIndex(char *name) {
    for (int i = 0; i < n; i++) {
        if (strcmp(countryNames[i], name) == 0) {
            return i;
        }
    }
    return -1; 
}

bool isSafe(int country, int color, int result[]) {
    for (int i = 0; i < n; i++) {
        printf("test isSafe pentru tara %d și culoarea %d\n", country, color);
        if (adjacency[country][i] && result[i] == color) {
            return false;
        }
    }
    return true;
}

bool colorMapUtil(int result[], int country) {
    if (country == n) {
        return true;
    }

    for (int i = 0; i < m; i++) {
        printf("Încercăm culoarea %d pentru țara %d\n", i, country);

        if (isSafe(country, i, result)) {
            result[country] = i;

            if (colorMapUtil(result, country + 1)) {
                return true;
            }

            result[country] = -1;
        }
    }

    return false;
}

void colorMap(FILE* fout) {
    int result[50];

    for (int i = 0; i < n; i++) {
        result[i] = -1;
    }

    if (colorMapUtil(result, 0)) {
        for (int i = 0; i < n; i++) {
            fprintf(fout, "%s: %s\n", countryNames[i], colors[result[i]]);
        }
    } else {
        fprintf(fout, "No valid coloring exists.\n");
    }
}

int main() {
    FILE *inputFile = fopen("input.txt", "r");
    FILE *outputFile = fopen("output.txt", "w");

    fscanf(inputFile, "%d", &n);
    for (int i = 0; i < n; i++) {
        fscanf(inputFile, "%s", countryNames[i]);
    }

    char country1[10], country2[10];
    while (fscanf(inputFile, "%s %s", country1, country2) == 2) {
        int index1 = getCountryIndex(country1);
        int index2 = getCountryIndex(country2);
        if (index1 != -1 && index2 != -1) {
            adjacency[index1][index2] = 1;
            adjacency[index2][index1] = 1;
        }
    }

    char line[256];
    fgets(line, sizeof(line), inputFile); // Citim întreaga linie
    sscanf(line, "%d", &m); // Extragem numărul de culori din linia citită

    for (int i = 0; i < m; i++) {
        fscanf(inputFile, "%s", colors[i]); 
        printf("Culoarea %d: %s\n", i, colors[i]);  
    }
    printf("Culorile disponibile:\n");
    for (int i = 0; i < m; i++) {
        printf("%s\n", colors[i]);
    }

    fclose(inputFile);

    colorMap(outputFile);

    fclose(outputFile);

    printf("Nr de tari: %d\n", n);
    for (int i = 0; i < n; i++) {
    printf("tara %d: %s\n", i + 1, countryNames[i]);
    }

    printf("mat de adiacenta:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d ", adjacency[i][j]);
        }
    printf("\n");
    }

    return 0;
}
