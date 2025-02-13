#include <stdio.h>
#include <stdlib.h>

typedef struct nod{
    char val;
    struct nod *next;
}NodeT;

typedef struct{
    int n;
    NodeT **t;
    int *f;
    int *color;
}Graf;

void push(NodeT **stiva, char val){
    NodeT *el = (NodeT*)malloc(sizeof(NodeT));
    el->val = val;
    el->next = *stiva;
    *stiva = el;
}

char pop(NodeT **stiva){
    if(*stiva != NULL){
        NodeT *firstElement = *stiva;
        *stiva = (*stiva)->next;
        char n = firstElement->val;
        free(firstElement);
        return n;
    }
    return -1;
}

int empty(NodeT *stiva){
    return stiva == NULL;
}

void init(NodeT **stiva){
    *stiva = NULL;
}

void citeste_graf(FILE* f, Graf* G){
    fscanf(f, "%d", &G->n);
    G->t = (NodeT**)malloc(G->n * sizeof(NodeT*));
    G->f = (int*)calloc(G->n, sizeof(int));
    G->color = (int*)calloc(G->n, sizeof(int));
    for(int i = 0; i < G->n; i++){
        G->t[i] = NULL;
    }
    char x, y;
    while(fscanf(f, " %c %c", &x, &y) == 2){
        NodeT *newNode = (NodeT*)malloc(sizeof(NodeT));
        newNode->val = y;
        newNode->next = G->t[x - 'a'];
        G->t[x - 'a'] = newNode;
    }
}

void tarjan(Graf G, int x, int *index, int *low, int *onStack, NodeT **stiva) {
    static int time = 0;
    index[x] = time;
    low[x] = time;
    time++;
    push(stiva, x + 'a');
    onStack[x] = 1;

    NodeT *p = G.t[x];
    while (p != NULL) {
        int y = p->val - 'a';
        if (index[y] == -1) {
            tarjan(G, y, index, low, onStack, stiva);
            low[x] = min(low[x], low[y]);
        } else if (onStack[y]) {
            low[x] = min(low[x], index[y]);
        }
        p = p->next;
    }

    if (low[x] == index[x]) {
        printf("Componenta puternic conexa: ");
        int w;
        do {
            w = pop(stiva);
            onStack[w] = 0;
            printf("%c ", w + 'a');
        } while (w != x);
        printf("\n");
    }
}

void findStronglyConnectedComponents(Graf G) {
    int *index = (int*)malloc(G.n * sizeof(int));
    int *low = (int*)malloc(G.n * sizeof(int));
    int *onStack = (int*)calloc(G.n, sizeof(int));
    NodeT *stiva;
    init(&stiva);

    for (int i = 0; i < G.n; i++) {
        index[i] = -1;
        low[i] = -1;
    }

    for (int i = 0; i < G.n; i++) {
        if (index[i] == -1) {
            tarjan(G, i, index, low, onStack, &stiva);
        }
    }

    free(index);
    free(low);
    free(onStack);
}

int main(){

    FILE *f = fopen("graf.txt", "r");
    if(f == NULL){
        printf("Fisierul nu exista!\n");
        exit(1);
    }

    Graf G;
    citeste_graf(f, &G);

    findStronglyConnectedComponents(G);
    return 0;
}