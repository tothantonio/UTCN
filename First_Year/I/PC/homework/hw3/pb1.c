#include <stdio.h>

int main()
{
    int a, b, c;

    scanf("%d%d%d", &a, &b, &c);

    unsigned long long x = (1 << (2 * a)) + (1 << b);
    unsigned long long y = ((1 << c) -  1) << (2 * c) | ((1 << c) -  1);

    printf("%llu\n", x);
    printf("%llu", y);

    return 0;
}
