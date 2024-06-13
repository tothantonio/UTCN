#include <stdio.h>
#include <stdlib.h>

/*      Problema cu aranjamente   */

int v[100], n, m;

int bun(int k)
{
    for(int i=1; i<k; i++)
    {
        if(v[k]==v[i])
        {
            return 0;
        }
    }
    return 1;
}

void out()
{
    for(int i=1; i<=m; i++)
        printf("%d ", v[i]);
    printf("\n");
}

void backt(int k)
{
    for(int i=1; i<=n; i++)
    {
        v[k]=i;
        if(bun(k))
        {
            if(k==m)
            {
                out();
            }
            else{
                backt(k+1);
            }
        }
    }
}

int main()
{
    printf("n>");
    scanf("%d", &n);
    printf("m>");
    scanf("%d", &m);

    backt(1);

    return 0;
}