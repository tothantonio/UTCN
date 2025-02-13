#include <stdio.h>
#include <stdlib.h>

typedef struct{
    int n;
    int **m; 
}graf;

typedef struct nod{
    int val;
    struct nod *next;
}NodeT;

typedef struct coada{
    NodeT *first, *last;
}queue;


void initQueue(queue *q){
    q->first = q->last = NULL;
}

int isEmpty(queue q){
    return q.first == NULL;
}

void enqueue(queue *q, int val){
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

int dequeue(queue *q){
    if(q->first != NULL){
        int val = q->first->val;
        NodeT *tmp = q->first;
        q->first = q->first->next;
        free(tmp);
        return val;
    }
    return -1;
}

void bfs(graf g, int start){
    int *visited = (int*)calloc(g.n, sizeof(int));
    queue q;
    initQueue(&q);
    visited[start] = 1;
    enqueue(&q, start);
    while(!isEmpty(q)){
        int node = dequeue(&q);
        printf("%d ", node);
        for(int i = 0; i < g.n; i++){
            if(g.m[node][i] == 1 && visited[i] == 0){
                visited[i] = 1;
                enqueue(&q, i);
            }
        }
    }
    free(visited);
}

graf readGraph(const char *filename){
    graf g;
    FILE *f = fopen(filename, "r");
    if(f == NULL){
        perror("File not found");
        exit(1);
    }
    fscanf(f, "%d", &g.n);
    g.m = (int**)malloc(g.n * sizeof(int*));
    for(int i = 0; i < g.n; i++){
        g.m[i] = (int*)calloc(g.n, sizeof(int));
    }
    int x, y;
    while(fscanf(f, "%d %d", &x, &y) == 2){
        g.m[x][y] = g.m[y][x] = 1;
    }
    fclose(f);
    return g;
}

int main(){

    graf g = readGraph("graf.txt");
    bfs(g, 0);
    printf("\n");
    for(int i = 0; i < g.n; i++){
        free(g.m[i]);
    }
    free(g.m);
    return 0;
}