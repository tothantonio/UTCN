#include <stdio.h>

int main()
{
    int n, m;
    char c;

    scanf("%c", &c);
    scanf("%d%d" , &n, &m);

    // a)

    for(int i = 0; i < n; i++)
    {
        for(int j = 0; j < m; j ++)
        {
            printf("%c", c);
        }
        printf("\n");
    }
    printf("\n");

    // b)

    scanf("%d", &n);

    for(int i = 0 ; i < n; i ++)
    {
        for(int j = 0; j < n - i - 1; j ++)
        {
            printf(" ");
        }
        for(int j = 0; j < 2 * i + 1; j ++)
        {
            printf("%c", c);
        }
        printf("\n");
    }
    printf("\n");

    // c)

    scanf("%d", &n);

    for(int i = 0; i < n; i ++)
    {
        for(int j = 0 ; j < n - i - 1; j ++)
        {
            printf(" ");
        }
        for(int j = 0; j < 2 * i + 1; j ++)
        {
            printf("%c", c);
        }
        printf("\n");
    }

    for(int i = n - 2; i >= 0; i--)
    {
        for(int j = 0; j < n - i - 1; j ++)
        {
            printf(" ");
        }
        for(int j = 0; j < 2 * i + 1; j ++)
        {
            printf("%c", c);
        }
        printf("\n");
    }

    // d)

    scanf("%d", &n);

    for(int i = -n; i <= n; i ++)
    {
        for(int j = -n; j <= n; j ++)
        {
            if(i * i + j * j <= n * n){
                printf("%c ", c);
            }
            else{
                printf("  ");
            }
        }
        printf("\n");
    }

    return 0;
}
