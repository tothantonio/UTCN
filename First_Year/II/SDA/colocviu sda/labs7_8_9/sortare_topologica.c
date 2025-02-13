#include <stdio.h>
#include <stdlib.h>

typedef struct nod{
    char val;
    struct nod *next;
}NodeT;

typedef struct{
    int n;
    NodeT **t;
    int* f;
    int* color;
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

void citeste_graf(Graf *G, const char* filename){
    FILE *f = fopen(filename, "r");
    if(f == NULL){
        printf("Fisierul nu exista!\n");
        exit(1);
    }
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
    fclose(f);
}

void dfs(Graf G, char node, NodeT **stiva){
    G.color[node - 'a'] = 1;
    NodeT *it = G.t[node - 'a'];
    while(it != NULL){
        if(G.color[it->val - 'a'] == 0){
            dfs(G, it->val, stiva);
        }
        it = it->next;
    }
    push(stiva, node);
}

void sortare_topologica(Graf G){
    NodeT *stiva;
    init(&stiva);
    for(int i = 0; i < G.n; i++){
        if(G.color[i] == 0){
            dfs(G, i + 'a', &stiva);
        }
    }
    while(!empty(stiva)){
        printf("%c ", pop(&stiva));
    }
}

int main(){

    Graf G;
    citeste_graf(&G, "graf.txt");
    sortare_topologica(G);

    return 0;
}