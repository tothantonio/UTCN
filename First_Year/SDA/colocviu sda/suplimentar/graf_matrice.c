#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct{
    int n;
    int **m;
    int *time;
    int *color;
}Graf;

typedef struct nod{
    int val;
    struct nod* next;
}NodeT;

enum {WHITE, GRAY, BLACK};

void dfs_visit(int v, Graf *G){
    G->color[v] = GRAY;
    printf("%d ", v);
    for(int i = 0; i < G->n; i++){
        if(G->m[v][i] == 1 && G->color[i] == WHITE){
            dfs_visit(i, G);
        }
    }
    G->color[v] = BLACK;
}

void dfs(Graf *G){
    G->color = (int*)malloc(G->n * sizeof(int));
    for(int i = 0; i < G->n; i++){
        G->color[i] = WHITE;
    }
    for(int i = 0; i < G->n; i++){
        if(G->color[i] == WHITE){
            dfs_visit(i, G);
        }
    }
}

void citire_graf(Graf *g, char *nume_fisier){
    FILE *f = fopen(nume_fisier, "r");
    if(f == NULL){
        perror("Eroare la deschiderea fisierului");
        exit(1);
    }
    fscanf(f, "%d", &g->n);
    g->m = (int**)malloc(g->n * sizeof(int*));
    for(int i = 0; i < g->n; i++){
        g->m[i] = (int*)calloc(g->n, sizeof(int));
    }
    int x, y;
    while(fscanf(f, "%d %d", &x, &y) == 2){
        g->m[x][y] = 1;
        g->m[y][x] = 1;
    }
    fclose(f);
}

void backtracking(char *s, int *visited, char *word, int pos, int len) {
    if (pos == len) {
        printf("%s\n", word);
        return;
    }

    for (int i = 0; i < len; i++) {
        if (!visited[i]) {
            visited[i] = 1;
            word[pos] = s[i];
            backtracking(s, visited, word, pos + 1, len);
            visited[i] = 0;
        }
    }
}

void generate_words(char *s) {
    int len = strlen(s);
    int *visited = (int*)calloc(len, sizeof(int));
    char *word = (char*)malloc((len + 1) * sizeof(char));
    word[len] = '\0';
    backtracking(s, visited, word, 0, len);
    free(visited);
    free(word);
}

int main(){

    Graf G;
    citire_graf(&G, "Graf.in");
    dfs(&G);

    printf("\n");
    generate_words("abc");

    return 0;
}