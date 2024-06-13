#include <stdio.h>
#include <stdlib.h>

/* Problema cu submultimi */
 
int sol[100], n;

void print(int *val)
{
    printf("{");
    for (int i = 1; i <= n; i++)
    {
        if (sol[i] == 1)
            printf(" %d", val[i]);
    }
    printf(" }\n");
}

void back(int *val, int k)
{
    if (k == n + 1)
        print(val);
    else
    {
        for (int i = 0; i <= 1; i++)
        {
            sol[k] = i;
            back(val, k+1);
        }
    }
}

int main() {

    scanf("%d", &n);
    int *val= (int*)malloc((n+1)*sizeof(int));
    for (int i = 1; i <= n; i++)
        scanf("%d", &val[i]);
    back(val, 1);

    return 0;
}
