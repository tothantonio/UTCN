#include <stdio.h>
#include <string.h>
#include "sah.h"

int main()
{

    //1)
    char table1[64][64];

    init(table1);

    char fen1[100];

    encode(table1, fen1);
    printf("%s\n", fen1);

    //2)
    char table2[64][64];
    char fen2[] = "7q/8/8/8/8/8/8/P7";

    decode(table2, fen2);
    print(table2);

    return 0;
}
