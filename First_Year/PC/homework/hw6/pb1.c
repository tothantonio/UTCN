#include <stdio.h>
#include <stdlib.h>

int **create(int n, int m, int L, int R)
{
    int **random_matrix = (int **)malloc(n * sizeof(int *));
    if(random_matrix == NULL)
    {
        perror("Alocare esuata");
        return NULL;
    }

    for (int i = 0; i < n; i++)
    {
        random_matrix[i] = (int *)malloc(m * sizeof(int));
        if(random_matrix[i] == NULL)
        {
            perror("Alocare esuata");
            return NULL;
        }
        for (int j = 0; j < m; j++)
        {
            random_matrix[i][j] = rand() % (R - L + 1) + L;
        }
    }

    return random_matrix;
}

void print(int **matrix, int rows, int cols)
{
    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < cols; j++)
        {
            printf("%d\t", matrix[i][j]);
        }
        printf("\n");
    }
}

int **select_rows(int **matrix, int rows, int cols, int l, int r)
{
    int **selected_rows = (int **)malloc((r - l + 1) * sizeof(int *));
    if(selected_rows == NULL)
    {
        perror("Alocare esuata");
        return NULL;
    }

    for (int i = 0; i < (r - l + 1); i++)
    {
        selected_rows[i] = (int *)malloc(cols * sizeof(int));
        if(selected_rows[i] == NULL)
        {
            perror("Alocare esuata");
            return NULL;
        }

        for (int j = 0; j < cols; j++)
        {
            selected_rows[i][j] = matrix[l + i][j];
        }
    }

    for (int i = r; i < rows; ++i)
    {
        free(matrix[i]);
    }
    free(matrix);

    return selected_rows;
}

int **add_cols(int **matrix, int rows, int cols, int L, int R, int k)
{
    int new_cols = cols + k;
    int **new_matrix = (int **)malloc(rows * sizeof(int *));

    if(new_matrix == NULL)
    {
        perror("Alocare esuata");
        return NULL;
    }
    for (int i = 0; i < rows; i++)
    {
        new_matrix[i] = (int *)malloc(new_cols * sizeof(int));
        if(new_matrix[i] == NULL)
        {
            perror("Alocare esuata");
            return NULL;
        }

        for (int j = 0; j < cols; j++)
        {
            new_matrix[i][j] = matrix[i][j]; // Copierea matricei existente
        }

        for (int j = cols; j < new_cols; j++)
        {
            new_matrix[i][j] = rand() % (R - L + 1) + L; // Generare numere aleatoare pentru noile coloane
        }
    }

    // Dezalocare matrice
    for (int i = 0; i < rows; ++i)
    {
        free(matrix[i]);
    }
    free(matrix);

    return new_matrix;
}

int main()
{
    int n = 3;
    int m = 4;
    int L = -1;
    int R = 3;

    // a) b) Creare și afișare
    int **matrix = create(n, m, L, R);
    printf("a) b)\n");
    print(matrix, n, m);
    printf("\n");

    // c) Selectare rânduri
    int l = 1;
    int r = 2;
    int **selected = select_rows(matrix, n, m, l, r);
    printf("c)\n");
    print(selected, r - l + 1, m);
    printf("\n");

    // d) Adăugare coloane și afișare
    int k = 2;
    int **extended_matrix = add_cols(selected, r - l + 1, m, L, R, k);
    printf("d)\n");
    print(extended_matrix, r - l + 1, m + k);
    printf("\n");

    // Eliberarea memoriei alocate pentru matrice
    for (int i = 0; i < r - l + 1; i++)
    {
        free(extended_matrix[i]);
    }
    free(extended_matrix);

    return 0;
}
