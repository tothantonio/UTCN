#include <stdio.h>
#include "Toth_Antonio_s06_sah.h"

int main()
{
    char table[8][8];

    char cols[8];
    int rows[8];

    init(table);

    print(table);

    int nr = find(table, 'N', cols, rows);

    printf("nr = %d\n", nr);

    printf("rows = {");
    for(int i = 0; i < nr; i ++)
    {
        printf("%d ", rows[i]);
    }
    printf("}\n");

    printf("cols = {");
    for(int j = 0; j < nr; j ++)
    {
        printf("'%c' ", cols[j]);
    }
    printf("}");
    printf("\n");

    return 0;
}
