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

enum{WHITE, GRAY, BLACK};

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
    while (fscanf(f, "%d%d", &v, &w) == 2) {
        //push(&pG->t[w], v); // graf orientat
        push(&pG->t[v], w);
    }
}

void dfs_visit(GRAF* G, int v, NodeT** topo_list, int* time){
    G->color[v] = GRAY;
    NodeT* vecin = G->t[v];
    printf("%d ", v);

    while(vecin != NULL){
        if(G->color[vecin->val] == WHITE){
            dfs_visit(G, vecin->val, topo_list, time);
        }
        else if(G->color[vecin->val] == GRAY || G->color[vecin->val] == BLACK){ // sau in cazul in care am graf neorientat
            printf("Ciclu detectat!\n"); 
            exit(1);
        }
        vecin = vecin -> next;
    }
    G->color[v] = BLACK;
    G->f[v] = ++(*time);
    push(topo_list, v);
}

void topological_sort(GRAF* G, NodeT** topo_list){
    int time = 0;
    *topo_list = NULL;

    for(int i = 0; i < G->n; i++){
        if(G->color[i] == WHITE)
            dfs_visit(G, i, topo_list, &time);
    }
}

void printArr(int* arr, int n){
    for(int i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main(){

    FILE* f = fopen("graf.txt", "r");
    if(!f)
        return -1;
    
    GRAF G;
    citesteGraf(f, &G);
    fclose(f);

    NodeT* topo_list = NULL;
    topological_sort(&G, &topo_list);

    printf("\nOrdinea topologica a nodurilor:\n");
    while(topo_list != NULL){
        printf("%d ", pop(&topo_list));
    }
    printf("\n");

    free(G.color);
    free(G.f);

    for(int i = 0; i < G.n; i++){
        NodeT* curr = G.t[i];
        while(curr != NULL){
            NodeT* tmp = curr;
            curr = curr->next;
            free(tmp);
        }
    }

    free(G.t);
    
    return 0;
}