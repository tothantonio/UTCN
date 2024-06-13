#include <stdio.h>
#include <stdlib.h>
// sa se gaseasca punctele de articulatie ale unui graf neorientat
typedef struct nod{
    int val;
    struct nod* next;
}NodeT;

typedef struct{
    int n;
    NodeT** t;
    int* color;
    int* f;
    int* d;
    int* low;
    int* parent;
}GRAF;

enum{white, grey, black};

void push(NodeT** stack, int val){
    NodeT* new_node = (NodeT*)malloc(sizeof(NodeT));
    if(!new_node)
        return;
    new_node->val = val;
    new_node->next = (*stack);
    *stack = new_node;
}

int pop(NodeT** stack){
    int n = -1;
    if(*stack != NULL){
        NodeT* first_element = (*stack);
        *stack = (*stack)->next;
        n = first_element->val;
        free(first_element);
    }
    return n;
}

int empty(NodeT* stack){
    return stack == NULL;
}

void printErr() {
    printf("Memorie insuficienta!\n");
    exit(1);
}

void citesteGraf(FILE *f, GRAF *pG) {

    fscanf(f, "%d", &pG->n);  // citeste nr. de varfuri

    pG->t = (NodeT **) calloc(pG->n, sizeof(NodeT *));
    if (pG->t == NULL) printErr();  // alocare esuata

    pG->f = (int *) calloc(pG->n, sizeof(int));
    pG->color = (int *) calloc(pG->n, sizeof(int));
    pG->d = (int *) calloc(pG->n, sizeof(int));
    pG->low = (int *) calloc(pG->n, sizeof(int));
    pG->parent = (int *) calloc(pG->n, sizeof(int));

    int i;
    for (i = 0; i < pG->n; i++) {
        pG->t[i] = NULL;
    }

    int x, y;
    while (fscanf(f, "%d %d", &x, &y) == 2) {
        NodeT* new_node = (NodeT*)malloc(sizeof(NodeT));
        if(!new_node)
            return;
        new_node->val = y;
        new_node->next = pG->t[x];
        pG->t[x] = new_node;

        new_node = (NodeT*)malloc(sizeof(NodeT));
        if(!new_node)
            return;
        new_node->val = x;
        new_node->next = pG->t[y];
        pG->t[y] = new_node;
    }
}
void dfs_articulatie(GRAF *pG, int v, NodeT** stack) {
    pG->color[v] = grey;
    pG->d[v] = pG->low[v] = ++pG->n;
    NodeT* adj = pG->t[v];
    while (adj != NULL) {
        int w = adj->val;
        if (pG->color[w] == white) {
            pG->parent[w] = v;
            push(stack, w);
            dfs_articulatie(pG, w, stack);
            if (pG->low[w] < pG->low[v]) {
                pG->low[v] = pG->low[w];
            }
            if (pG->low[w] >= pG->d[v]) {
                printf("%d\n", v);
            }
        } else if (w != pG->parent[v] && pG->d[w] < pG->low[v]) {
            pG->low[v] = pG->d[w];
        }
        adj = adj->next;
    }
    pG->color[v] = black;
}

void puncte_articulatie(GRAF *pG) {
    int i;
    for (i = 0; i < pG->n; i++) {
        pG->color[i] = white;
        pG->parent[i] = -1;
    }

    NodeT* stack = NULL;
    for (i = 0; i < pG->n; i++) {
        if (pG->color[i] == white) {
            push(&stack, i);
            dfs_articulatie(pG, i, &stack);
        }
    }
}

int main() {
    FILE *f = fopen("graf.txt", "r");
    if (!f) {
        printf("Fisierul nu exista!\n");
        return 1;
    }

    GRAF G;
    citesteGraf(f, &G);
    puncte_articulatie(&G);

    fclose(f);
    return 0;
}