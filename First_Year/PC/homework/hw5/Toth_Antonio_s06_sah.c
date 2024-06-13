#include <stdio.h>
#include "Toth_Antonio_s06_sah.h"

void init(char table[][8])
{

    char piese[] = "rnbqkbnr";

    for(int j = 0; j < 8; j ++)
    {
        table[0][j] = piese[j];
        table[1][j] = 'p';
        for(int i = 2; i < 6; i ++)
        {
            table[i][j] = ' ';
        }
        table[6][j] = 'P';
        table[7][j] = piese[j] - 32;
    }

}
void print(char table[][8])
{

    for(int i = 0; i < 8; i++)
    {
        for(int j = 0; j < 8; j ++)
        {
            printf("%c ", table[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int find(char table[][8], char piece, char cols[], int rows[])
{

    int nr = 0, col_index = 0, row_index = 0;
    for(int i = 0 ; i < 8; i ++)
    {
        for(int j = 0; j < 8; j ++)
        {
            if(piece == table[i][j])
            {
                nr ++;
                cols[col_index++] = 'a' + j;
                rows[row_index++] = 8 - i;
            }
        }
    }
    return nr;

}

