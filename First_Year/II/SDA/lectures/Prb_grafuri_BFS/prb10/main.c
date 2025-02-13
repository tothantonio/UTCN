#include <stdio.h>
#include <stdlib.h>

typedef struct NodeT
{
    int data;
    struct NodeT *next;
} QNode;

typedef struct
{
    QNode *head;
    QNode *tail;
} QUEUE;

typedef struct Graph
{
    int num;
    int *visited;
    QNode **adjList;
} GRAPH;

QUEUE *createQueue()
{
    QUEUE *q = (QUEUE *)malloc(sizeof(QUEUE));
    if (!q)
        return NULL;

    q->head = NULL;
    q->tail = NULL;

    return q;
}

int isEmpty(QUEUE *q)
{
    return q->head == NULL;
}

void enqueue(QUEUE *q, int data)
{
    QNode *new_node = (QNode *)malloc(sizeof(QNode));
    if (!new_node)
        return;

    new_node->data = data;
    new_node->next = NULL;

    if (isEmpty(q))
    {
        q->head = new_node;
        q->tail = new_node;
    }

    else
    {
        q->tail->next = new_node;
        q->tail = new_node;
    }
    printf("Enqueued: %d\n", data);
}

int dequeue(QUEUE *q)
{
    if (isEmpty(q))
        return -1;

    QNode *curr = q->head;
    int val = curr->data;
    q->head = q->head->next;
    if (q->head == NULL)
        q->tail = NULL;
    free(curr);
    printf("Dequeued: %d\n", val);
    return val;
}

void printQueue(QUEUE *q)
{
    QNode *curr = q->head;
    while (curr != NULL)
    {
        printf("%d ", curr->data);
        curr = curr->next;
    }
    printf("\n");
}

GRAPH *createGraph(int num)
{
    GRAPH *G = (GRAPH *)malloc(sizeof(GRAPH));
    if (!G)
        return NULL;

    G->num = num;
    G->visited = (int *)malloc(num * sizeof(int));
    G->adjList = (QNode **)malloc(num * sizeof(QNode *));

    for (int i = 0; i < num; i++)
    {
        G->visited[i] = 0;
        G->adjList[i] = NULL;
    }

    return G;
}

void addEdge(GRAPH *G, int src, int dest)
{
    QNode *new_node = (QNode *)malloc(sizeof(QNode));
    if (!new_node)
        return;
    new_node->data = dest;
    new_node->next = NULL;

    if (G->adjList[src] == NULL)
    {
        G->adjList[src] = new_node;
    }

    else
    {
        QNode *curr = G->adjList[src];
        while (curr->next != NULL)
            curr = curr->next;
        curr->next = new_node;
    }
}

void readGraphFromFile(GRAPH *G, const char *fileName)
{
    FILE *f = fopen(fileName, "r");
    if (!f)
        return;

    fscanf(f, "%d", &G->num);
    G->visited = (int *)malloc(G->num * sizeof(int));
    G->adjList = (QNode **)malloc(G->num * sizeof(QNode *));

    for (int i = 0; i < G->num; i++)
    {
        G->visited[i] = 0;
        G->adjList[i] = NULL;
    }

    int src, dest;
    while (fscanf(f, "%d%d", &src, &dest) != EOF)
    {
        addEdge(G, src, dest);
        // printf("%d %d\n", src, dest);
    }
    fclose(f);
}

int isOddCycle(GRAPH* G){
    int* color = (int*)malloc(G->num * sizeof(int)); // Allocate memory based on the number of vertices
    if(!color) // Check if memory allocation was successful
        return -1;

    for(int i = 0; i < G->num; i++)
        color[i] = -1; // Initialize all colors to -1
    
    for(int i = 0; i < G->num; i++){
        if(color[i] == -1){
            color[i] = 1;
            QUEUE* q = createQueue();
            enqueue(q, i);

            while(!isEmpty(q)){
                int u = dequeue(q);
                QNode* temp = G->adjList[u]; // Use a temporary pointer to traverse the adjacency list

                while(temp){ // Traverse the adjacency list of vertex u
                    int v = temp->data;
                    if(color[v] == -1){
                        color[v] = 1 - color[u];
                        enqueue(q, v);
                    }
                    else if(color[v] == color[u]){
                        free(color); // Free the color array before returning
                        return 1; // An odd cycle is found
                    }
                    temp = temp->next; // Move to the next adjacent vertex
                }
            }
            free(q); // Free the queue after processing each connected component
        }
    }
    free(color); // Free the color array if no odd cycle is found
    return 0; // No odd cycle is found
}


void printQUEUE(QUEUE *q)
{
    QNode *curr = q->head;
    while (curr != NULL)
    {
        printf("%d ", curr->data);
        curr = curr->next;
    }
    printf("\n");
}

int main()
{
    GRAPH *G = createGraph(0);
    readGraphFromFile(G, "graph.txt");

    // QUEUE* q = createQueue();
    // enqueue(q, 1);
    // enqueue(q, 2);
    // enqueue(q, 3);
    // printQUEUE(q);

    // dequeue(q);
    // printQUEUE(q);

    if (isOddCycle(G))
        printf("Graful contine un ciclu de lungime impara\n");
    else
        printf("Graful nu contine un ciclu de lungime impara\n");

    return 0;
}