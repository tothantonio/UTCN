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

NodeT* ciclu(Graf G){
    NodeT *stiva = NULL;
    for(int i = 0; i < G.n; i++){
        if(G.color[i] == 0){
            push(&stiva, i + 'a');
            G.color[i] = 1;
            while(!empty(stiva)){
                char u = pop(&stiva);
                NodeT *p = G.t[u - 'a'];
                while(p != NULL){
                    if(G.color[p->val - 'a'] == 0){
                        push(&stiva, p->val);
                        G.color[p->val - 'a'] = 1;
                    }else if(G.color[p->val - 'a'] == 1){
                        return p;
                    }
                    p = p->next;
                }
                G.color[u - 'a'] = 2;
            }
        }
    }
    return NULL;
}

void print_ciclu(NodeT *c){
    NodeT *p = c;
    while(p != NULL){
        printf("%c ", p->val);
        p = p->next;
    }
    printf("\n");
}

int main(){

    FILE* f = fopen("graf.txt", "r");
    if(f == NULL){
        printf("Fisierul nu exista!\n");
        exit(1);
    }

    Graf G;
    citeste_graf(f, &G);

    NodeT *c = ciclu(G);
    if(c != NULL){
        printf("Ciclu: ");
        print_ciclu(c);
    }else{
        printf("Nu exista ciclu\n");
    }


    return 0;
}