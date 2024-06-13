#include <stdio.h>
#include <stdlib.h>

int v[100], n, k, count = 0;

void out()
{
    for(int i = 1; i <= k; i++){
        printf("%d ", v[i]);
    }
    printf("\n");
    count++;
}

void backt(int pos, int last)
{
    if (pos > k)
    {
        out();
        return;
    }
    
    for(int i = last + 1; i <= n; i++)
    {
        v[pos] = i;
        backt(pos + 1, i);
    }
}

int main()
{
    printf("n> ");
    scanf("%d", &n);
    printf("m> ");
    scanf("%d", &k);

    backt(1, 0);

    printf("%d total solutions.\n", count);

    return 0;
}