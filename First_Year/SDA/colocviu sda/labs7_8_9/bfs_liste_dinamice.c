#include <stdio.h>
#include <stdlib.h>

typedef struct{
    int n;
    int** t;
}Graf;

typedef struct nod{
    int val;
    struct nod* next;
}NodeT;

typedef struct{
    NodeT* first, * last;
}Queue;

void initQueue(Queue* q){
    q->first = q->last = NULL;
}

int isEmpty(Queue q){
    return q.first == NULL;
}

void enqueue(Queue* q, int val){
    NodeT* newNode = (NodeT*)malloc(sizeof(NodeT));
    newNode->val = val;
    newNode->next = NULL;
    if(q->first == NULL){
        q->first = q->last = newNode;
    }else{
        q->last->next = newNode;
        q->last = newNode;
    }
}

int dequeue(Queue* q){
    if(q->first != NULL){
        int val = q->first->val;
        NodeT* tmp = q->first;
        q->first = q->first->next;
        free(tmp);
        return val;
    }
    return -1;
}

void bfs(Graf g, int start){
    int* visited = (int*)calloc(g.n, sizeof(int));
    Queue q;
    initQueue(&q);
    visited[start] = 1;
    enqueue(&q, start);
    while(!isEmpty(q)){
        int node = dequeue(&q);
        printf("%d ", node);
        for(int i = 0; i < g.n; i++){
            if(g.t[node][i] == 1 && visited[i] == 0){
                visited[i] = 1;
                enqueue(&q, i);
            }
        }
    }
}

Graf readGraph(const char* fileName){
    Graf g;
    FILE* f = fopen(fileName, "r");
    fscanf(f, "%d", &g.n);
    g.t = (int**)malloc(g.n * sizeof(int*));
    for(int i = 0; i < g.n; i++){
        g.t[i] = (int*)calloc(g.n, sizeof(int));
    }
    int x, y;
    while(fscanf(f, "%d %d", &x, &y) != EOF){
        g.t[x][y] = g.t[y][x] = 1;
    }
    fclose(f);
    return g;
}

int main(){

    Graf g = readGraph("graf.txt");
    bfs(g, 0);

    return  0;
}