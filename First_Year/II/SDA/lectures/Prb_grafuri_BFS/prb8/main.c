#include <stdio.h>
#include <stdlib.h>

typedef struct NodeT{
    int data;
    struct NodeT *next;
}QNode;

typedef struct{
    QNode *head;
    QNode *tail;
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
    //printf("Enqueued %d\n", val);
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
    //printf("Dequeued %d\n", val);
    return val;
}

void printQueue(QUEUE* q){
    QNode* curr = q->head;
    while(curr != NULL){
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
    G->adjList = (int**)malloc(num * sizeof(int*));
    if(!G->adjList)
        return NULL;
    for(int i = 0; i < num; i++){
        G->visited[i] = 0;
        G->adjList[i] = NULL;
    }
    return G;
}

void addEdge(GRAPH* G, int v, int w){
    QNode* new_node = (QNode*)malloc(sizeof(QNode));
    if(!new_node)
        return;
    
    new_node->data = w;
    new_node->next = NULL;

    if(G->adjList[v] == NULL){
        G->adjList[v] = new_node;
    }

    else{
        QNode* curr = G->adjList[v];
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

void findAllPathsUtil(GRAPH* G, int start, int end, int path[], int path_index) { // O(v + e)
    G->visited[start] = 1;
    path[path_index] = start;
    path_index++;

    if (start == end) {
        for (int i = 0; i < path_index; i++) {
            printf("%d ", path[i]);
        }
        printf("\n");
    } else {
        QNode* temp = G->adjList[start];
        while (temp != NULL) {
            int adjVertex = temp->data;
            if (!G->visited[adjVertex]) {
                findAllPathsUtil(G, adjVertex, end, path, path_index);
            }
            temp = temp->next;
        }
    }

    path_index--;
    G->visited[start] = 0;
}

void findAllPaths(GRAPH* G, int start, int end) {
    int* path = malloc(G->num * sizeof(int));
    int path_index = 0;
    for (int i = 0; i < G->num; i++) {
        G->visited[i] = 0;
    }
    findAllPathsUtil(G, start, end, path, path_index);
    free(path);
}


int main(){
    GRAPH* G = createGraph(0);

    readGraphFromFile(G, "graph.txt");
    findAllPaths(G, 0, 4);
    return 0;
}