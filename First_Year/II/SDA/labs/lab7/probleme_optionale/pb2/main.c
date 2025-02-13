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

//citind doua noduri de la tastatura sa se afiseze distanta minima dintre ele

void BFS(GRAF *g, int start, int end){
    int *color = (int*)malloc(g->n * sizeof(int));
    int *d = (int*)malloc(g->n * sizeof(int));
    int *p = (int*)malloc(g->n * sizeof(int));
    for(int i = 0; i < g->n; i++){
        color[i] = white;
        d[i] = -1;
        p[i] = -1;
    }
    color[start] = grey;
    d[start] = 0;
    p[start] = -1;
    LIST *q = create_queue();
    enqueue(q, start);
    while(!isEmpty(q)){
        int u = dequeue(q);
        NodeT *aux = g->t[u];
        while(aux != NULL){
            if(color[aux->v] == white){
                color[aux->v] = grey;
                d[aux->v] = d[u] + 1;
                p[aux->v] = u;
                enqueue(q, aux->v);
            }
            aux = aux->next;
        }
        color[u] = black;
    }
    printf("Distanta minima dintre nodurile %d si %d este %d\n", start, end, d[end]);
}


void citesteGraf(FILE* f, GRAF *pG){
    fscanf(f, "%d", &pG->n);
    pG->t = (NodeT**)malloc(pG->n * sizeof(NodeT*));
    for(int i = 0; i < pG->n; i++){
        pG->t[i] = NULL;
    }

    for(int i = 0; i < pG->n; i++)
        pG->t[i] = NULL;
    
    int v, w;
    while(fscanf(f, "%d %d", &v, &w) == 2){
        NodeT* new_node = create_node(w);
        new_node->next = pG->t[v];
        pG->t[v] = new_node;
    }
}
int main(){

    FILE* f = fopen("graf.txt", "r");
    if(!f)
        return -1;
    
    GRAF G;
    citesteGraf(f, &G);
    fclose(f);

    printf("Dati cele doua noduri:\n");
    int start, end;
    scanf("%d %d", &start, &end);
    BFS(&G, start, end);
    return 0;
}