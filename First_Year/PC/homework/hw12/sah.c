#include "sah.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define MAX_TESTS 500
#define max(a, b) ((a) > (b) ? (a) : (b))

void run_tests()
{
    config configs[MAX_TESTS];
    int n;
    citire("chess_in.bin", configs, &n);

    int res[MAX_TESTS];

    for(int i = 0; i < n; i++){
        res[i] = valid_move(configs[i]);
    }
    afisare("chess_out.txt", res, n);
}

int valid_move(config conf)
{
    int col1 = conf.mv.c1 - 'a';
    int col2 = conf.mv.c2 - 'a';
    int row1 = 8 - conf.mv.r1;
    int row2 = 8 - conf.mv.r2;
    char piesa = conf.table[row1][col1];
    int dr = row2 - row1;
    int dc = col2 - col1;
    int i, step;

    if (piesa == ' ' || row2 < 0 || row2 >= 8 || col2 < 0 || col2 >= 8){
        return 0;
    }

    switch(piesa)
    {
    case 'R': //turn
    case 'r':
        if(dr != 0 && dc != 0) return 0;
        step = ((dr != 0) ? (dr / abs(dr)) : (dc / abs(dc)));
        for(int i = 1; i < abs(dr + dc); i ++)
        {
            if (conf.table[row1 + (dr != 0) * i * step][col1 + (dc != 0) * i * step] != ' '){
                return 0;
            }
        }
        break;
    case 'B': //nebun
    case 'b':
        if(abs(dr) != abs(dc)) return 0;
        step = (dr / abs(dr));
        for (i = 1; i < abs(dr); i++)
        {
            if (conf.table[row1 + i * step][col1 + i * (dc / abs(dc))] != ' '){
                return 0;
            }
        }
        break;
    case 'Q': // Regina
    case 'q':
        if (dr != 0 && dc != 0 && abs(dr) != abs(dc)) return 0;

        int dr_step = (dr == 0) ? 0 : (dr / abs(dr));
        int dc_step = (dc == 0) ? 0 : (dc / abs(dc));

        for (i = 1; i < max(abs(dr), abs(dc)); i++)
        {
            if (conf.table[row1 + i * dr_step][col1 + i * dc_step] != ' '){
                return 0;
            }
        }
        break;
    case 'P': // Pion alb
        if (dr != -1 || (abs(dc) != 1 && dc != 0)) return 0;
        break;
    case 'p': // Pion negru
        if (dr != 1 || (abs(dc) != 1 && dc != 0)) return 0;
        break;
    default:
        return 0; // nu este o piesa relevanta
    }
    if ((isupper(piesa) && isupper(conf.table[row2][col2])) || (islower(piesa) && islower(conf.table[row2][col2]))){
        return 0;
    }
    return 1; // Mișcarea este validă
}

void citire(const char* nume_fisier, config configs[], int *n)
{
    FILE *file = fopen(nume_fisier, "rb");
    if(file == NULL){
        perror("Unable to open file:"); exit(-1);
    }

    fread(n, sizeof(int), 1, file);
    fread(configs, sizeof(config), *n, file);

    fclose(file);
}

void afisare(const char* nume_fisier, int results[], int n)
{
    FILE *file = fopen(nume_fisier, "w");
    if(file == NULL){
        perror("Unable to open file:"); exit(-1);
    }

    for(int i = 0; i < n; i++){
        fprintf(file, "%d\n", results[i]);
    }

    fclose(file);
}
