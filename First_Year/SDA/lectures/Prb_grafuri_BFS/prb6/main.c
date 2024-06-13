#include <stdio.h>
#include <stdlib.h>

typedef struct NodeT{
    int val;
    struct NodeT* next;
}QNode;

typedef struct{
    QNode* head;
    QNode* tail;
}QUEUE;

typedef struct Graph{
    int num;
    int* visited;
    int** adjList;
    int* pred;
    int* dist;
}GRAPH;

QUEUE* createQueue();
int isEmpty(QUEUE* q);
void enqueue(QUEUE* q, int val);
int dequeue(QUEUE* q);
void printQueue(QUEUE* q);
GRAPH* createGraph(int num);
void addEdge(GRAPH* G, int src, int dest);
void BFS(GRAPH* G, int start);
void readGraphFromFile(GRAPH* G, const char* fileName);
void printPath(GRAPH* G, int start, int end);


int main(){

    // QUEUE* Q = createQueue();
    // enqueue(Q, 1);
    // enqueue(Q, 2);
    // enqueue(Q, 3);

    // printQueue(Q);

    // dequeue(Q);
    // printQueue(Q);

    GRAPH* G = createGraph(0);
    readGraphFromFile(G, "graph.txt");

    BFS(G, 0);
    printPath(G, 0, 6);

    return 0;
}

QUEUE* createQueue(){
    QUEUE* q = (QUEUE*)malloc(sizeof(QUEUE));
    if(!q)
        return NULL;
    q->head = NULL;
    q->tail = NULL;
    return q;
}

int isEmpty(QUEUE* q){
    return q->head == NULL;
}

void enqueue(QUEUE* q, int val){
    QNode* new_node = (QNode*)malloc(sizeof(QNode));
    if(!new_node)
        return;
    
    new_node->val = val;
    new_node->next = NULL;

    if(isEmpty(q)){
        q->head = new_node;
        q->tail = new_node;
    }
    else{
        q->tail->next = new_node;
        q->tail = new_node;
    }
    printf("Enqueued: %d\n", val);
}

int dequeue(QUEUE* q){
    if(isEmpty(q))
        return -1;
    
    QNode* curr = q->head;
    int val = curr->val;
    q->head = q->head->next;
    if(q->head == NULL)
        q->tail = NULL;
    free(curr);
    printf("Dequeued: %d\n", val);
    return val;
}

void printQueue(QUEUE* q){
    QNode* curr = q->head;
    while(curr != NULL){
        printf("%d ", curr->val);
        curr = curr->next;
    }
    printf("\n");
}

GRAPH* createGraph(int num){
    GRAPH* G = (GRAPH*)malloc(sizeof(GRAPH));
    if(!G)
        return NULL;
    G->num = num;
    G->visited = (int*)malloc(num * sizeof(int));
    G->adjList = (QNode**)malloc(num * sizeof(QNode*));
    G->pred = (int*)malloc(num * sizeof(int));
    G->dist = (int*)malloc(num * sizeof(int));

    for(int i = 0; i < num; i++)
    {
        G->adjList[i] = NULL;
        G->visited[i] = 0;
        G->pred[i] = -1;
        G->dist[i] = -1;
    }

    return G;
}

void addEdge(GRAPH* G, int src, int dest){
    QNode* new_node = (QNode*)malloc(sizeof(QNode));
    if(!new_node)
        return;
    
    new_node->val = dest;
    new_node->next = NULL;

    if(G->adjList[src] == NULL){
        G->adjList[src] = new_node;
    }
    else{
        QNode* curr = G->adjList[src];
        while(curr->next != NULL)
            curr = curr->next;
        curr->next = new_node;
    }
}

void BFS(GRAPH* G, int start){ // O(varfuri + muchii)
    QUEUE* Q = createQueue();
    G->visited[start] = 1;
    G->dist[start] = 0;

    enqueue(Q, start);

    while(!isEmpty(Q)){
        int curr = dequeue(Q);
        printf("Visited: %d\n", curr);

        QNode* tmp = G->adjList[curr];
        while(tmp){
            int adj_val = tmp->val;
            if(G->visited[adj_val] == 0){
                G->visited[adj_val] = 1;
                G->dist[adj_val] = G->dist[curr] + 1;
                G->pred[adj_val] = curr;
                enqueue(Q, adj_val);
            }
            tmp = tmp->next;
        }

    }
}

void readGraphFromFile(GRAPH* G, const char* fileName){
    FILE* pf = fopen(fileName, "r");
    if(!pf)
        return;
    
    fscanf(pf, "%d", &G->num);
    G->visited = (int*)malloc(G->num * sizeof(int));
    G->adjList = (QNode**)malloc(G->num * sizeof(QNode*));

    for(int i = 0; i < G->num; i++) {
        G->visited[i] = 0;
        G->adjList[i] = NULL;
    }

    int src, dest;
    while(fscanf(pf, "%d %d", &src, &dest) != EOF){
        addEdge(G, src, dest);
        printf("%d %d\n", src, dest);
    }

    fclose(pf);
}

void printPath(GRAPH* G, int start, int end){
    if(G->pred[end] == -1)
        {
            printf("Nu exista drum intre %d si %d\n", start, end);
            return;
        }
    
    int* path = (int*)malloc(G->num * sizeof(int));

    int len = 0;
    int crawl = end;
    path[len] = crawl;
    len++;

   printf("Reconstruim calea de la nodul %d la nodul %d.\n", end, start);
    while(crawl != start) {
        printf("Nodul curent: %d, Predecesorul: %d\n", crawl, G->pred[crawl]);
        crawl = G->pred[crawl];
        path[len] = crawl;
        len++;
    }

    printf("Lungimea drumului minim este: %d\n", G->dist[end]);
    printf("Drumul este: ");
    for(int i = len - 1; i >= 0; i--) {
        printf("%d ", path[i]);
    }
    printf("\n");
}
