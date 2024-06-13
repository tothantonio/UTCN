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

        NodeT *newNode2 = (NodeT*)malloc(sizeof(NodeT));
        newNode2->val = x;
        newNode2->next = G->t[y - 'a'];
        G->t[y - 'a'] = newNode2;
    }
}

void dfs(Graf G, int x, int *index, int *low, int *parent, int *articulatie){
    static int time = 0;
    index[x] = low[x] = time++;
    int children = 0;
    NodeT *p = G.t[x];
    while(p != NULL){
        int y = p->val - 'a';
        if(index[y] == -1){
            children++;
            parent[y] = x;
            dfs(G, y, index, low, parent, articulatie);
            low[x] = (low[x] < low[y]) ? low[x] : low[y];
            if(parent[x] == -1 && children > 1){
                articulatie[x] = 1;
            }
            if(parent[x] != -1 && low[y] >= index[x]){
                articulatie[x] = 1;
            }
        }else if(y != parent[x]){
            low[x] = (low[x] < index[y]) ? low[x] : index[y];
        }
        p = p->next;
    }
}

void puncte_de_articulatie(Graf G){
    int *index = (int*)malloc(G.n * sizeof(int));
    int *low = (int*)malloc(G.n * sizeof(int));
    int *parent = (int*)malloc(G.n * sizeof(int));
    int *articulatie = (int*)calloc(G.n, sizeof(int));
    for(int i = 0; i < G.n; i++){
        index[i] = -1;
        low[i] = -1;
        parent[i] = -1;
    }
    for(int i = 0; i < G.n; i++){
        if(index[i] == -1){
            dfs(G, i, index, low, parent, articulatie);
        }
    }
    for(int i = 0; i < G.n; i++){
        if(articulatie[i] == 1){
            printf("%c ", i + 'a');
        }
    }
}

int main(){
    FILE *f = fopen("graf.txt", "r");
    if(f == NULL){
        printf("Fisierul nu exista!\n");
        exit(1);
    }
    Graf G;
    citeste_graf(f, &G);
    fclose(f);

    // for(int i = 0; i < G.n; i++){
    //     NodeT *p = G.t[i];
    //     printf("%c: ", i + 'a');
    //     while(p != NULL){
    //         printf("%c ", p->val);
    //         p = p->next;
    //     }
    //     printf("\n");
    // }

    puncte_de_articulatie(G);

    return 0;
}