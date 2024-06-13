#include <stdio.h>
#include "sah.h"

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

void encode(char table[][8], char* fen)
{
    int index = 0; //index pt fen

    for (int i = 0; i < 8; i++)
    {
        int cnt = 0; //celule goale

        for (int j = 0; j < 8; j++)
        {
            char current = table[i][j]; //caracter curent

            if (current == '\0')
            {
                break; // Ieșim dacă întâlnim un caracter terminant de șir
            }

            if (current == ' ')
            {
                cnt++;
            }
            else
            {
                if (cnt > 0)
                {
                    fen[index++] = cnt + '0'; //adaugam nr de celule goale dintr-o secventa de piese
                    cnt = 0;
                }
                fen[index++] = current;
            }

        }
        if(cnt > 0){ // verificam nr de celule goale, la finalul fiecarui rand complet
            fen[index ++] = cnt + '0';
            cnt = 0;
        }
        if (i < 7) //daca nu suntem la ultimul rand adaugam / in notatia fen
        {
            fen[index++] = '/';
        }
    }

    fen[index] = '\0'; // Adăugăm caracterul terminant de șir pentru notația FEN
}

void decode(char table[][8], char* fen)
{
    int i = 0, j = 0;
    int index = 0;

    while (fen[index] != '\0') // parcurg fen-ul
    {
        if (fen[index] == '/')
        {
            i++; // rand nou
            j = 0; // resetam coloada
        }
        else if (fen[index] >= '1' && fen[index] <= '8')
        {
            int cnt = fen[index] - '0';  //din fen in val. numerica
            for (int k = 0; k < cnt; k++)
            {
                table[i][j++] = ' ';
            }
        }
        else
        {
            table[i][j++] = fen[index];
        }
        index++;
    }
}

