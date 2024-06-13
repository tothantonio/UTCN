#include <stdio.h>
#include <stdlib.h>

typedef struct nod{
    int val;
    struct nod* next;
}NodeT;

typedef struct{
    int n;
    NodeT **t; //tablou de liste
    int *color;
    int *pi;
}Graf;

void push(NodeT **stiva, int val){
    NodeT *new = (NodeT*)malloc(sizeof(NodeT));
    new->val = val;
    new->next = *stiva;
    *stiva = new;
}

void citire_graf(Graf *g, char *nume_fisier){
    FILE *f = fopen(nume_fisier, "r");
    if(f == NULL){
        perror("Eroare la deschiderea fisierului");
        exit(1);
    }
    fscanf(f, "%d", &g->n);
    g->t = (NodeT**)malloc(g->n * sizeof(NodeT*));
    for(int i = 0; i < g->n; i++){
        g->t[i] = (NodeT*)calloc(g->n, sizeof(NodeT));
    }
    int x, y;
    while(fscanf(f, "%d %d", &x, &y) == 2){
        push(&g->t[x], y);
        push(&g->t[y], x);
    }
    fclose(f);
}

void afisare_graf(Graf g){
    for(int i = 0; i < g.n; i++){
        printf("%d: ", i);
        NodeT *p = g.t[i];
        while(p != NULL){
            printf("%d ", p->val);
            p = p->next;
        }
        printf("\n");
    }
}

//dfs iterativ

// void dfs_iterativ(Graf *G){
//     NodeT *stiva;
//     init_stiva(&stiva);
//     int *vizitat = (int*)calloc(G->n, sizeof(int));
//     int v;
//     for(int i = 0; i < G->n; i++){
//         if(vizitat[i] == 0){
//             push(&stiva, i);
//             while(!empty(stiva)){
//                 v = pop(&stiva);
//                 if(vizitat[v] == 0){
//                     printf("%d ", v);
//                     vizitat[v] = 1;
//                     NodeT *p = G->t[v];
//                     while(p != NULL){
//                         if(vizitat[p->val] == 0){
//                             push(&stiva, p->val);
//                         }
//                         p = p->next;
//                     }
//                 }
//             }
//         }
//     }
//     free(vizitat);
// }

//dfs recursiv

void dfs_visit(int v, Graf *G){
    G->color[v] = 1;
    printf("%d ", v);
    NodeT *p = G->t[v];
    while(p != NULL){
        if(G->color[p->val] == 0){
            G->pi[p->val] = v;
            dfs_visit(p->val, G);
        }
        p = p->next;
    }
}

void dfs(Graf *G){
    G->color = (int*)calloc(G->n, sizeof(int));
    G->pi = (int*)malloc(G->n * sizeof(int));
    for(int i = 0; i < G->n; i++){
        if(G->color[i] == 0){
            dfs_visit(i, G);
        }
    }
}

int main(){

    Graf G;
    citire_graf(&G, "Graf.in");

    afisare_graf(G);

    // printf("Dfs iterativ: ");
    // dfs_iterativ(&G);

    printf("\nDfs recursiv: ");
    dfs(&G);
    return 0;
}