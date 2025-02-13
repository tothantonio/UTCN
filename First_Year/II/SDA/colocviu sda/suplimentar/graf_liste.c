#include <stdio.h>
#include <stdlib.h>

typedef struct nod{
    int val;
    struct nod* next;
}NodeT;

typedef struct coada{
    NodeT *first ,*last;
}Queue;

typedef struct{
    int n;
    int **t;
}Graf;

void initQ(Queue *q){
    q->first = q->last = NULL;
}

int isEmptyQ(Queue q){
    return q.first == NULL;
}

void enqueue(Queue *q, int val){
    NodeT *new = (NodeT*)malloc(sizeof(NodeT));
    new->val = val;
    new->next = NULL;
    if(q->first == NULL){
        q->first = q->last = new;
    }else{
        q->last->next = new;
        q->last = new;
    }
}

int dequeue(Queue *q){
    if(q->first != NULL){
        NodeT *aux = q->first;
        q->first = q->first->next;
        int val = aux->val;
        free(aux);
        return val;
    }
    return -1;
}


void citire_graf(Graf *g, char *nume_fisier){
    FILE *f = fopen(nume_fisier, "r");
    if(f == NULL){
        perror("Eroare la deschiderea fisierului");
        exit(1);
    }
    fscanf(f, "%d", &g->n);
    g->t = (int**)malloc(g->n * sizeof(int*));
    for(int i = 0; i < g->n; i++){
        g->t[i] = (int*)calloc(g->n, sizeof(int));
    }
    int x, y;
    while(fscanf(f, "%d %d", &x, &y) == 2){
        g->t[x][y] = 1;
        g->t[y][x] = 1;
    }
    fclose(f);
}

void afisare_graf(Graf g){
    for(int i = 0; i < g.n; i++){
        for(int j = 0; j < g.n; j++){
            printf("%d ", g.t[i][j]);
        }
        printf("\n");
    }
}


int drum(Graf g, int x, int y){
    Queue q;
    initQ(&q);
    int *viz = (int*)calloc(g.n, sizeof(int));
    enqueue(&q, x);
    viz[x] = 1;
    while(!isEmptyQ(q)){
        int nod = dequeue(&q);
        for(int i = 0; i < g.n; i++){
            if(g.t[nod][i] == 1 && viz[i] == 0){
                if(i == y){
                    return 1;
                }
                viz[i] = 1;
                enqueue(&q, i);
            }
        }
    }
    return 0;
}

int inmultire(int a, int b){
    if(a < 10 || b < 10){
        return a * b;
    }
    int m = a / 10;
    int n = a % 10;
    int p = b / 10;
    int q = b % 10;
    int ac = inmultire(m, p);
    int bd = inmultire(n, q);
    int ad_bc = inmultire(m + n, p + q) - ac - bd;
    return ac * 100 + (ad_bc * 10) + bd;
}

int main(){

    Graf g;
    citire_graf(&g, "Graf.in");
    afisare_graf(g);

    int x, y;
    printf("dati primul nod:\n");
    scanf("%d", &x);

    printf("dati al doilea nod:\n");
    scanf("%d", &y);

    if(drum(g, x, y)){
        printf("Exista drum intre nodurile %d si %d\n", x, y);

    }else{

        printf("Nu exista drum intre nodurile %d si %d\n", x, y);
    }

    printf("Inmultirea a doua numere este: %d\n", inmultire(12345, 56789));
    return 0;
}