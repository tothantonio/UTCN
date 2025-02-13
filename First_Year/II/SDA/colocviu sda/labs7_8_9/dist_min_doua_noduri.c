#include <stdio.h>
#include <stdlib.h>

typedef struct nod{
    int val;
    struct nod *next;
}NodeT;

typedef struct coada{
    NodeT *first, *last;
}Queue;

typedef struct{
    int n;
    int **m;
}Graf;

void initQueue(Queue *q){
    q->first = q->last = NULL;
}

int isEmpty(Queue q){
    return q.first == NULL;
}

void enqueue(Queue *q, int val){
    NodeT *newNode = (NodeT*)malloc(sizeof(NodeT));
    newNode->val = val;
    newNode->next = NULL;
    if(q->first == NULL){
        q->first = q->last = newNode;
    }else{
        q->last->next = newNode;
        q->last = newNode;
    }
}

int dequeue(Queue *q){
    if(q->first != NULL){
        int val = q->first->val;
        NodeT *tmp = q->first;
        q->first = q->first->next;
        free(tmp);
        return val;
    }
    return -1;
}

Graf read_graph(const char* filename){
    FILE *f = fopen(filename, "r");
    Graf g;
    fscanf(f, "%d", &g.n);
    g.m = (int**)malloc(g.n * sizeof(int*));
    for(int i = 0; i < g.n; i++){
        g.m[i] = (int*)calloc(g.n, sizeof(int));
    }
    int x, y;
    while(fscanf(f, "%d %d", &x, &y) == 2){
        g.m[x][y] = g.m[y][x] = 1;
    }
    return g;
}

int min_dist(Graf g, int v, int w){
    Queue q;
    initQueue(&q);
    enqueue(&q, v);
    int *dist = (int*)calloc(g.n, sizeof(int));
    dist[v] = 1;
    while(!isEmpty(q)){
        int node = dequeue(&q);
        for(int i = 0; i < g.n; i++){
            if(g.m[node][i] == 1 && dist[i] == 0){
                dist[i] = dist[node] + 1;
                enqueue(&q, i);
            }
        }
    }
    return dist[w] - 1;
}

int main(){

    Graf g = read_graph("graf.txt");

    int v, w;
    printf("Introduceti nodurile v si w: ");
    scanf("%d %d", &v, &w);

    printf("Distanta minima dintre %d si %d este: %d\n", v, w, min_dist(g, v, w));
    return  0;
}