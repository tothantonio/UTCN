#ifndef SAH_H
#define SAH_H

typedef struct
{
    char c1, c2;
    int r1, r2;
} move;

typedef struct
{
    char table[8][8];
    move mv;
} config;

void run_tests();
int valid_move(config conf);
void citire(const char *nume_fisier, config configs[], int *n);
void afisare(const char *nume_fisier, int results[], int n);
#endif // SAH_H

