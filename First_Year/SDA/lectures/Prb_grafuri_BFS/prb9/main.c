#include <stdio.h>
#include <stdlib.h>

typedef struct node_type{
    int data;
    struct node_type *next;
}QNode;

typedef struct{
    QNode* head, *tail;
}QUEUE;

typedef struct Graph{
    int num;
    int* visited;
    QNode** adjList;
}GRAPH;

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
    
    new_node->data = val;
    new_node->next = NULL;

    if(isEmpty(q)){
        q->head = new_node;
        q->tail = new_node;
    }

    else{
        q->tail->next = new_node;
        q->tail = new_node;
    }

    printf("Enqueued %d\n", val);
}

int dequeue(QUEUE* q){
    if(isEmpty(q))
        return -1;
    
    QNode* curr = q->head;
    int val = curr->data;
    q->head = q->head->next;
    if(q->head == NULL)
        q->tail = NULL;

    free(curr);
    printf("Dequeued %d\n", val);
    return val;
}

void printQueue(QUEUE* q){
    QNode* curr = q->head;
    while(curr){
        printf("%d ", curr->data);
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

    for(int i = 0; i < num; i++){
        G->visited[i] = 0;
        G->adjList[i] = NULL;
    }

    return G;
}

void addEdge(GRAPH* G, int src, int dest){
    QNode* new_node = (QNode*)malloc(sizeof(QNode));
    if(!new_node)
        return;
    new_node->data = dest;
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
    FILE* f = fopen(fileName, "r");
    if(!f)
        return;
    
    fscanf(f, "%d", &G->num);
    G->visited = (int*)malloc(G->num * sizeof(int));
    G->adjList = (QNode**)malloc(G->num * sizeof(QNode*));

    for(int i = 0; i < G->num; i++){
        G->visited[i] = 0;
        G->adjList[i] = NULL;
    }

    int src, dest;
    while(fscanf(f, "%d%d", &src, &dest) != EOF){
        addEdge(G, src, dest);
        //printf("%d %d\n", src, dest);
    }
    fclose(f);
}

int countPathsUtil(GRAPH* G, int x, int y, int k) {
    if (k == 0 && x == y) return 1;
    if (k == 1 && G->adjList[x] != NULL) {
        QNode* temp = G->adjList[x];
        while (temp != NULL) {
            if (temp->data == y) return 1;
            temp = temp->next;
        }
        return 0;
    }
    if (k <= 0) return 0;

    int count = 0;
    QNode* temp = G->adjList[x];
    while (temp != NULL) {
        count += countPathsUtil(G, temp->data, y, k - 1);
        temp = temp->next;
    }
    return count;
}

int countPaths(GRAPH* G, int x, int y, int k) {
    return countPathsUtil(G, x, y, k);
}
int main(){

    GRAPH* G = createGraph(0);
    readGraphFromFile(G, "graph.txt");


    int x = 0, y = 4, k = 2;
    printf("Numarul de drumuri de la %d la %d cu lungimea %d este %d\n", x, y, k, countPaths(G, x, y, k));
    return 0;
}