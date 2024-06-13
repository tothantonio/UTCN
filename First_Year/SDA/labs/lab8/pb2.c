#include <stdio.h>
#include <stdlib.h>

typedef struct nod{
    int val;
    struct nod* next;
}NodeT;

typedef struct{
    int n;
    NodeT** t;
    int* color;
    int* f;
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

    int i;
    for (i = 0; i < pG->n; i++) {
        pG->t[i] = NULL;
    }

    int v, w;
    while (fscanf(f, "%d %d", &v, &w) == 2) {
        push(&pG->t[v], w);
    }
}

int dfs(GRAF *pG, int v, NodeT** stack) {
    pG->color[v] = grey;
    NodeT* adj = pG->t[v];
    while (adj != NULL) {
        int w = adj->val;
        if (pG->color[w] == grey) {
            push(stack, w);
            push(stack, v);
            return 1;
        } else if (pG->color[w] == white && dfs(pG, w, stack)) {
            push(stack, v);
            return 1;
        }
        adj = adj->next;
    }
    pG->color[v] = black;
    return 0;
}

void print_cycle(NodeT* stack){
    if(stack == NULL)
        return;
    
    printf("ciclu: ");
    while(stack){
        printf("%d ", stack->val);
        stack = stack->next;
    }
    printf("\n");
}

int hasCycle(GRAF *pG) {
    int i;
    for (i = 0; i < pG->n; i++) {
        pG->color[i] = white;
    }

    NodeT* stack = NULL;
    for (i = 0; i < pG->n; i++) {
        if (pG->color[i] == white) {
            if (dfs(pG, i, &stack)) {
                print_cycle(stack);
                return 1; 
            }
        }
    }
    return 0; 
}


int main(){

    FILE *f = fopen("graf.txt", "r");
    GRAF G;
    citesteGraf(f, &G);
    fclose(f);

    if (hasCycle(&G)) {
        printf("Graful contine ciclu!\n");
    } else {
        printf("Graful nu contine ciclu!\n");
    }
    return 0;
}