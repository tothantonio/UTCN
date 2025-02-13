#include <stdio.h>

int main()
{
    int xx, yy;

    char nume_complet[50];

    printf("Nume Complet: ");
    gets(nume_complet); //scanf("%[^\n]s", nume_complet);

    printf("Numar laborator = ");
    scanf("%d", &xx);

    printf("Numar problema = ");
    scanf("%d", &yy);

    printf("D:\\%s\\lab%02d\\prb%02d.c", nume_complet, xx, yy);
    return 0;
}
