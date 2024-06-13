#include <stdio.h>
#include <stdlib.h>

typedef struct node{
    int val;
    struct node* next;
}NodeT;

typedef struct{
    int n;
    NodeT** t;
    NodeT** t_trans;
    int* color;
    int* f;
}GRAF;

enum{white, grey, black};

void printErr();

void citesteGraf(FILE *f, GRAF *pG);

void DFS_Transpus(GRAF *pG, int v, NodeT** stack);

void DFS(GRAF *pG, int v, NodeT** stack);

void SCC(GRAF *pG);

int main();

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

    pG->t_trans = (NodeT **) calloc(pG->n, sizeof(NodeT *));
    if(pG->t_trans == NULL) printErr();

    pG->f = (int *) calloc(pG->n, sizeof(int));
    pG->color = (int *) calloc(pG->n, sizeof(int));

    int i;
    for (i = 0; i < pG->n; i++) {
        pG->t[i] = NULL;
    }

    int v, w;
    while(fscanf(f, "%d%d", &v, &w) == 2)
    {
        push(&pG->t[v], w);
        push(&pG->t_trans[w], v);
    }
}

void DFS_Transpus(GRAF *pG, int v, NodeT** stack){
    pG->color[v] = grey;
    NodeT* current = pG->t_trans[v];
    while(current != NULL){
        int u = current->val;
        if(pG->color[u] == white){
            DFS_Transpus(pG, u, stack);
        }
        current = current->next;
    }
    push(stack, v);
    pG->color[v] = black;
}

void DFS(GRAF *pG, int v, NodeT** stack){
    pG->color[v] = grey;
    NodeT* current = pG->t[v];
    while(current != NULL){
        int u = current->val;
        if(pG->color[u] == white){
            DFS(pG, u, stack);
        }
        current = current->next;
    }
    push(stack, v);
    pG->color[v] = black;
}

void SCC(GRAF *pG){
    NodeT* stack = NULL;
    int i;
    for(i = 0; i < pG->n; i++){
        pG->color[i] = white;
    }
    for(i = 0; i < pG->n; i++){
        if(pG->color[i] == white){
            DFS(pG, i, &stack);
        }
    }
    for(i = 0; i < pG->n; i++){
        pG->color[i] = white;
    }
    while(!empty(stack)){
        int v = pop(&stack);
        if(pG->color[v] == white){
            NodeT* component = NULL;
            DFS_Transpus(pG, v, &component);
            // Print the strongly connected component
            NodeT* current = component;
            while(current != NULL){
                printf("%d ", current->val);
                current = current->next;
            }
            printf("\n");
            // Free the memory allocated for the component
            while(!empty(component)){
                pop(&component);
            }
        }
    }
}

int main(){

    FILE *f = fopen("graf.txt", "r");
    if(f == NULL){
        perror("Eroare la deschiderea fisierului");
        return 1;
    }

    GRAF G;
    citesteGraf(f, &G);

    SCC(&G);

    fclose(f);

    int i;
    for (i = 0; i < G.n; i++) {
        NodeT* curr = G.t[i];
        while(curr != NULL){
            NodeT* tmp  = curr;
            curr = curr->next;
            free(tmp);
        }
    }

    
    return 0;
}