#include <stdio.h>
#include <stdlib.h>

typedef struct Node{
    int v;
    struct Node *next;
}NodeT;

typedef struct graf{
    int n;
    NodeT **t;
}GRAF;

typedef struct lista{
    NodeT* first;
    NodeT* last;
}LIST;

enum {white, grey, black};

LIST* create_queue(){
    LIST *q = (LIST*)malloc(sizeof(LIST));
    q->first = NULL;
    q->last = NULL;
    return q;
}

NodeT* create_node(int v){
    NodeT *new = (NodeT*)malloc(sizeof(NodeT));
    new->v = v;
    new->next = NULL;
    return new;
}

void enqueue(LIST *q, int v){
    NodeT *new = (NodeT*)malloc(sizeof(NodeT));
    new->v = v;
    new->next = NULL;
    if(q->first == NULL){
        q->first = new;
        q->last = new;
    }
    else{
        q->last->next = new;
        q->last = new;
    }
}

int dequeue(LIST *q){
    if(q->first == NULL){
        return -1;
    }
    NodeT *aux = q->first;
    q->first = q->first->next;
    int v = aux->v;
    free(aux);
    return v;
}

int isEmpty(LIST *q){
    return q->first == NULL;
}

void citesteGraf(FILE* f, GRAF* G){
    fscanf(f, "%d", &G->n);
    G->t = (NodeT**)malloc(G->n * sizeof(NodeT*));
    for(int i = 0; i < G->n; i++){
        G->t[i] = NULL;
    }
    int v, w;
    while(fscanf(f, "%d %d", &v, &w) == 2){
        NodeT *new = create_node(w);
        new->next = G->t[v];
        G->t[v] = new;
    }
}
int is_bipartite(GRAF G) {
    int *color = (int*)malloc(G.n * sizeof(int));
    for (int i = 0; i < G.n; i++) {
        color[i] = white;
    }

    LIST *q = create_queue();
    enqueue(q, 0);
    color[0] = grey;

    while (!isEmpty(q)) {
        int u = dequeue(q);
        NodeT *p = G.t[u];
        while (p != NULL) {
            int v = p->v;
            if (color[v] == white) {
                color[v] = (color[u] == grey) ? black : grey;
                enqueue(q, v);
            } else if (color[v] == color[u]) {
                free(color);
                return 0;
            }
            p = p->next;
        }
        color[u] = black;
    }

    free(color);
    return 1;
}

int main(){

    FILE *f = fopen("graf.txt", "r");
    if(!f)
        return -1;
    
    GRAF G;
    citesteGraf(f, &G);
    fclose(f);

    if (is_bipartite(G)) {
        printf("Graful este bipartit\n");
    } else {
        printf("Graful nu este bipartit\n");
    }

    return 0;
}