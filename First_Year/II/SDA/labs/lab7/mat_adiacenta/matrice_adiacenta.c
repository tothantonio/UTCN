#include <stdio.h>
#include <stdlib.h>

typedef struct{
    int n; 
    int** m; 
}GRAF;

typedef struct nod{
    int data;
    struct nod* next;
}NodeT;

typedef struct{
    NodeT* head;
    NodeT* tail;
}Coada;

enum{NEVIZITAT, VIZITAT};

void printerr(){
    printf("Eroare!\n");
    exit(1);
}

void enqueue(Coada* Q, int val){
    NodeT* nou = malloc(sizeof(NodeT));
    if(nou == NULL)
        printerr();
    nou->data = val;
    nou->next = NULL;
    if(Q->head == NULL){
        Q->head = Q->tail = nou;
    }
    else{
        Q->tail->next = nou;
        Q->tail = nou;
    }
}

int dequeue(Coada* Q){
    if(Q->head == NULL)
        return -1;
    NodeT* aux = Q->head;
    int val = aux->data;
    Q->head = Q->head->next;
    if(Q->head == NULL)
        Q->tail = NULL;
    free(aux);
    return val;
}

int empty(Coada* Q){
    return Q == NULL;
}

void init(Coada* Q){
    Q->head = Q->tail = NULL;
}

void bfs(GRAF G, int nod_sursa){
    int* viz = calloc(G.n, sizeof(int));

    Coada Q;
    init(&Q);

    int i, v, w;
    for(i = 0; i < G.n; i++){
        viz[i] = NEVIZITAT;
        viz[nod_sursa] = VIZITAT;
        enqueue(&Q, nod_sursa);
        while(!empty(&Q)){
        v = dequeue(&Q);
        for(w = 0; w < G.n; w++){
            if(G.m[v][w] == 1 && viz[w] == NEVIZITAT){
                viz[w] = VIZITAT;
                printf("%d ", w);
                enqueue(&Q, w);
                }
            }
        }
    }
}

void citesteGraf(FILE* f, GRAF* G){
    fscanf(f, "%d", &G->n);
    G->m = calloc(G->n, sizeof(int*));
    for(int i = 0; i < G->n; i++)
        G->m[i] = calloc(G->n, sizeof(int));
    
    int v, w;
    while(fscanf(f, "%d%d", &v, &w) == 2){
        G->m[v][w] = G->m[w][v] = 1;
    }
}

int main(){

    FILE* f = fopen("graf.txt", "r");
    
    GRAF G;
    citesteGraf(f, &G);
    fclose(f);

    int v;
    printf("Dati nodul de start:");
    scanf("%d", &v);

    bfs(G, v);

    return 0;
}