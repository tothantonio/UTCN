#include <stdio.h>
#include <stdlib.h>

typedef struct nod{
    int val;
    struct nod *next;
}NodeT;

typedef struct{
    int n;
    int **m;
}Graf;


int *colorare_graf(Graf g){
    int *culori = (int*)malloc(g.n * sizeof(int));
    for(int i = 0; i < g.n; i++){
        culori[i] = 0;
    }
    for(int i = 0; i < g.n; i++){
        for(int j = 0; j < g.n; j++){
            if(g.m[i][j] == 1 && culori[j] == 0){
                culori[j] = culori[i] + 1;
            }
        }
    }
    return culori;
}

Graf citeste_graf(const char* filename){
    FILE *f = fopen(filename, "r");
    Graf g;
    fscanf(f, "%d", &g.n);
    g.m = (int**)malloc(g.n * sizeof(int*));
    for(int i = 0; i < g.n; i++){
        g.m[i] = (int*)calloc(g.n, sizeof(int));
    }
    int x, y;
    while(fscanf(f, "%d %d", &x, &y) == 2){
        g.m[x][y] = 1;
        g.m[y][x] = 1;
    }
    fclose(f);
    return g;
}

int main(){

    Graf g = citeste_graf("graf.txt");

    for(int i = 0; i < g.n; i++){
        for(int j = 0; j < g.n; j++){
            printf("%d ", g.m[i][j]);
        }
        printf("\n");
    }

    printf("\n");
    int *culori = colorare_graf(g);

    for(int i = 0; i < g.n; i++){
        printf("%d ", culori[i]);
    }
    return 0;
}