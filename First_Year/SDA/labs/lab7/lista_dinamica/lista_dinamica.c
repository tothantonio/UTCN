#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
    int v;
    struct nod *next;
} NodeT;

typedef struct Q
{
    NodeT *front;
    NodeT *rear;
} Coada;

typedef struct
{
    int n;
    NodeT **t;
} GRAF;

enum
{
    NEVIZITAT,
    VIZITAT
};

void enqueue(Coada *Q, int val)
{
    NodeT *nou = (NodeT *)malloc(sizeof(NodeT));
    nou->v = val;
    nou->next = NULL;
    if (Q->front == NULL)
    {
        Q->front = nou;
        Q->rear = nou;
    }
    else
    {
        Q->rear->next = nou;
        Q->rear = nou;
    }
}

int dequeue(Coada *Q)
{
    if (Q->front == NULL)
    {
        return -1;
    }
    NodeT *aux = Q->front;
    Q->front = Q->front->next;
    int val = aux->v;
    free(aux);
    return val;
}

int empty(Coada *Q)
{
    return Q->front == NULL;
}

void init(Coada *Q)
{
    Q->front = NULL;
    Q->rear = NULL;
}

void bfs(GRAF G, int nod_sursa)
{
    int *viz = calloc(G.n, sizeof(int));
    Coada *Q;
    init(Q);

    int i, v, w;
    for (i = 0; i < G.n; i++)
        viz[i] = NEVIZITAT;
    viz[nod_sursa] = VIZITAT;

    enqueue(Q, nod_sursa);

    while (!empty(Q))
    {
        v = dequeue(Q);
        printf("%d ", v);
        for (NodeT *p = G.t[v]; p != NULL; p = p->next)
        {
            w = p->v;
            if (viz[w] == NEVIZITAT)
            {
                viz[w] = VIZITAT;
                enqueue(Q, w);
            }
        }
    }
}
void citesteGraf(FILE *f, GRAF *G)
{
    fscanf(f, "%d", &G->n);
    G->t = calloc(G->n, sizeof(NodeT *));
    for (int i = 0; i < G->n; i++)
        G->t[i] = NULL;

    int v, w;
    while (fscanf(f, "%d%d", &v, &w) == 2)
    {
        NodeT *nou = (NodeT *)malloc(sizeof(NodeT));

        nou->v = w;
        nou->next = G->t[v];
        G->t[v] = nou;

        nou = (NodeT *)malloc(sizeof(NodeT));

        nou->v = v;
        nou->next = G->t[w];
        G->t[w] = nou;
    }
}
int main()
{

    FILE *f = fopen("graf.txt", "r");

    GRAF G;
    citesteGraf(f, &G);

    int v;
    printf("Nr de noduri: %d, dati nod sursa: ", G.n);
    scanf("%d", &v);
    bfs(G, v);
    return 0;
}