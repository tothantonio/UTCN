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
    fclose(f);
    return g;
}

int connected(Graf g, int v, int w){
    int *visited = (int*)calloc(g.n, sizeof(int));
    Queue q;
    initQueue(&q);
    visited[v] = 1;
    enqueue(&q, v);
    while(!isEmpty(q)){
        int node = dequeue(&q);
        for(int i = 0; i < g.n; i++){
            if(g.m[node][i] == 1 && visited[i] == 0){
                visited[i] = 1;
                enqueue(&q, i);
            }
        }
    }
    int result = visited[w];
    free(visited);
    return result;
}

int main(){
    Graf g = read_graph("graf.txt");

    int v, w;
    printf("Introduceti nodurile v si w: ");
    scanf("%d %d", &v, &w);

    if(connected(g, v, w)){
        printf("Nodurile %d si %d sunt conectate.\n", v, w);
    }else{
        printf("Nodurile %d si %d nu sunt conectate.\n", v, w);
    }
    
    return 0;
}