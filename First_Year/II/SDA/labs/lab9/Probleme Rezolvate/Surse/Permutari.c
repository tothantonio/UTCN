#include <stdio.h>
#include <stdlib.h>

/*      Problema cu permutari   */

// trebuie sa afiisez orice sol explorata

void afisare(int k, int n, int *sol, int* viz)
{
    for (int i=1; i<=k; i++)
    {
        printf("%d ", sol[i]);
    }
    if(k == n && !viz[sol[k]]){
        printf(" - solution");
    }
    printf("\n");
}

void back(int k, int *viz, int *sol, int n)
{
    if(k <= n)
    {
        for (int i=1; i<=n; i++)
        {
            sol[k] = i;
            afisare(k, n, sol, viz);
            if (!viz[i])
            {
                viz[i] = 1;
                back(k + 1, viz, sol, n);
                viz[i] = 0;
            }
        }
    }
}

int main ()
{
    int *viz, *sol, n;
    scanf("%d", &n);
    viz = (int *)calloc(n+1, sizeof(int));
    sol = (int *)malloc((n+1)* sizeof(int));


    back(1, viz, sol, n);

    return 0;
}