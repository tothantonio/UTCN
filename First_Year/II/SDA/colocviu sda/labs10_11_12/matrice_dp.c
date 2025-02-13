#include <stdio.h>
#include <stdlib.h>

void calculateMaxSubs(int n, int m, int **a, int *max_subs)
{
    for (int j = 0; j < m; j++)
    {
        int *dp = (int *)malloc(n * sizeof(int));
        for (int i = 0; i < n; i++)
        {
            dp[i] = 1; 
        }

        for (int i = 1; i < n; i++)
        {
            if (a[i][j] > a[i - 1][j])
            {
                dp[i] = dp[i - 1] + 1;
            }
        }

        int max_length = dp[0];
        for (int i = 1; i < n; i++)
        {
            if (dp[i] > max_length)
            {
                max_length = dp[i];
            }
        }

        max_subs[j] = max_length;
        free(dp);
    }
}

int main()
{
    int n, m;
    FILE *fin = fopen("inputPD.txt", "r");
    fscanf(fin, "%d%d", &n, &m);

    int **a = (int **)malloc(n * sizeof(int *));
    for (int i = 0; i < n; i++)
        a[i] = (int *)malloc(m * sizeof(int));

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            fscanf(fin, "%d", &a[i][j]);
        }
    }

    int *max_subs = (int *)malloc(m * sizeof(int));

    calculateMaxSubs(n, m, a, max_subs);

    FILE *fout = fopen("outputPD.txt", "w");
    for (int j = 0; j < m; j++)
    {
        fprintf(fout, "%d ", max_subs[j]);
    }

    for (int i = 0; i < n; i++)
    {
        free(a[i]);
    }
    free(a);
    free(max_subs);

    return 0;
}
