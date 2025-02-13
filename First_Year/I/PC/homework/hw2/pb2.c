#include <stdio.h>

int main()
{
    float S = 0;
    float D = 0;

    char C;
    float greutate;

    scanf(" %c %f kg", &C, &greutate);

    if (C == 'S')
    {
        S += greutate;
    }
    else if(C == 'D')
    {
        D += greutate;
    }

    scanf(" %c %f kg", &C, &greutate);

    if (C == 'D')
    {
        D += greutate;
    }
    else if(C == 'S')
    {
        S += greutate;
    }

    scanf(" %c %f kg", &C, &greutate);

    if (C == 'D')
    {
        D += greutate;
    }
    else if(C == 'S')
    {
        S += greutate;
    }

    if (S == D)
    {
        printf("Echilibrat\n");
    }
    else if (S < D)
    {
        printf("in D\n");
    }

    else
    {
        printf("in S\n");
    }

    return 0;
}
