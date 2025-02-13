#include <stdio.h>
#include <math.h>

int functie_a(int a[], int len)
{

    int mask = 0;

    for(int i = 0; i < len; i++)
    {
        mask |= (1 << a[i]);
    }

    return mask;
}

int functie_b(int mask, int a[])
{

    int cnt = 0;
    for(int i = 0; i < 32; i ++)
    {
        if((mask & (1 << i)) != 0)
        {
            a[cnt] = i;
            cnt ++;
        }
    }
    return cnt;
}

void functie_c(int a[], int b[], int lenA, int lenB)
{

    int maskA = functie_a(a, lenA);
    int maskB = functie_a(b, lenB);

    int mask_exclusive = maskA & (~maskB);

    int valori[32];
    int cnt = functie_b(mask_exclusive, valori);

    for(int i = 0; i < cnt; i++)
    {
        printf("%d ", valori[i]);
    }
    printf("\n");
}

void functie_d(int a[], int lenA)
{

    int total = pow(2, lenA);

    for(int i = 1; i < total; i ++)
    {

        printf("( ");
        for(int j = 0; j < lenA; j ++)
        {

            if(i & (1 << j))
            {
                printf("%d ", a[j]);
            }
        }
        printf(")\n");
    }
}

int main()
{
    int a[32], lenA;

    scanf("%d", &lenA);

    for(int i = 0; i < lenA; i++)
    {
        scanf("%d", &a[i]);
    }

    //a)
    printf("a) %d\n", functie_a(a, lenA));

    //b)
    int mask;

    scanf("%d", &mask);

    printf("b) %d\n", functie_b(mask, a));

    //c)
    int a2[32], b2[32];

    int lenA2, lenB2;

    scanf("%d", &lenA2);

    for(int i = 0; i < lenA2; i++)
    {
        scanf("%d", &a2[i]);
    }

    scanf("%d", &lenB2);

    for(int i = 0; i < lenB2; i ++)
    {
        scanf("%d", &b2[i]);
    }
    printf("c) ");
    functie_c(a2, b2, lenA2, lenB2);

    // d)

    int s[15], lenS;

    scanf("%d", &lenS);

    for(int i = 0; i < lenS; i++)
    {
        scanf("%d", &s[i]);
    }

    printf("d)\n");
    functie_d(s, lenS);

    return 0;
}
