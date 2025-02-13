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
    int* count;
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
void printInfo(GRAPH* G);

int main(){

    GRAPH* G = createGraph(0);
    readGraphFromFile(G, "graph.txt");

    BFS(G, 0);

    printInfo(G);
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
    G->count = (int*)malloc(num * sizeof(int));
    G->dist = (int*)malloc(num * sizeof(int));

    for(int i = 0; i < num; i++){
        G->visited[i] = 0;
        G->adjList[i] = NULL;
        G->count[i] = 0;
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
        //printf("%d %d\n", src, dest);
    }

    fclose(pf);
}

void BFS(GRAPH* G, int start){ // O(varfuri + muchii)
    QUEUE* q = createQueue();

    G->visited[start] = 1;
    G->dist[start] = 0;
    G->count[start] = 1;

    enqueue(q, start);

    while(!isEmpty(q)){
        int curr = dequeue(q);
        printf("Visited: %d\n", curr);
        QNode* tmp = G->adjList[curr];
        while(tmp){
            int adj_val = tmp->val;

            if(G->visited[adj_val] == 0){
                G->visited[adj_val] = 1;
                G->dist[adj_val] = G->dist[curr] + 1;
                G->count[adj_val] = G->count[curr];
                enqueue(q, adj_val);
            }
            else if(G->dist[adj_val] == G->dist[curr] + 1){
                G->count[adj_val] += G->count[curr];
            }
            tmp = tmp->next;
        }
    }
    free(q);
}

void printInfo(GRAPH* G){
     printf("Graph info:\n");
     for(int i = 0; i < G->num; i++){
         printf("Node %d: %d %d\n", i, G->dist[i], G->count[i]);
     }
 }