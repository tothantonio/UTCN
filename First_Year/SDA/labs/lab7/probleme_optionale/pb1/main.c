#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*******************
  Citirea datelor despre un graf dintr-un fisier
  cu reprezentarea grafului prin liste de adiacenta dinamice.
  In fisier se da numarul n de varfuri ale grafului,
  apoi muchiile sub forma de perechi i j, cu 0<=i,j<n
  (i si j reprezinta indicii varfurilor conectate prin
   arc (sau muchie)).
  Graful se parcurge BFS si se scriu într-un fisier
  nodurile în ordinea parcurgerii.
******************/

typedef struct nod {
    int v;
    struct nod* next;
} NodeT;

typedef struct {
    int n;      // numar de varfuri
    NodeT** t;    // tabloul de liste (va fi alocat dinamic)
} Graf;     // structura pentru memorarea grafului prin liste de adiacenta dinamice

enum { WHITE, GREY, BLACK };

/// TODO: de definit o structura Coada si
/// operatiile initializeaza, enqueue, dequeue, goala

void printErr() {
    printf("Memorie insuficienta!\n");
    exit(1);
}

typedef struct lista {
    NodeT* first;
    NodeT* last;
}LIST;

LIST* create_list()
{
    LIST* my_list = (LIST*)malloc(sizeof(LIST));
    if (my_list == NULL)
        return NULL;

    memset(my_list, 0, sizeof(LIST));
    my_list->first = NULL;
    my_list->last = NULL;

    return my_list;
}

NodeT* create_node(int key)
{
    NodeT* p = (NodeT*)malloc(sizeof(NodeT));
    if (p == NULL)
        return NULL;

    memset(p, 0, sizeof(NodeT));
    p->v = key;
    p->next = NULL;

    return p;
}

void print_list(LIST* lista)
{
    if (lista == NULL)
        return;

    NodeT* p = lista->first;
    if (p == NULL)
        return;

    while (p)
    {
        printf("%d ", p->v);
        p = p->next;
    }
}

void enqueue(LIST* lista, int key)
{
    if (lista == NULL)
        return;

    NodeT* p = create_node(key);
    if (p == NULL)
        return;

    if (lista->first == NULL && lista->last == NULL)
    {
        lista->first = p;
        lista->last = p;
    }
    else {
        lista->last->next = p;
        lista->last = p;
    }
}

int dequeue(LIST* lista)
{
    if (lista == NULL)
        return 0;

    NodeT* p = lista->first;
    if (p == NULL)
        return 0;

    int nr = p->v;

    lista->first = lista->first->next;
    if (lista->first == NULL)
        lista->last = NULL;
    free(p);

    return nr;
}

int not_goala(LIST* Q)
{
    if (Q == NULL)
        return 0;
    if (Q->first != NULL)
        return 1;
    return 0;
}


void bfs(Graf G, int nodSursa, int* vizitate)
{

    LIST* Q; // coada nodurilor - intregi

        int i, v, w; /* noduri */

    ///	initializeaza( Q );
    Q = create_list();

    for (i = 0; i < G.n; i++) /* marcam toate nodurile ca nevizitate */
        vizitate[i] = WHITE;
    vizitate[nodSursa] = BLACK; /* marcam nodul sursa ca vizitat */

    /*	procesam informatia pt nodSursa;
        enqueue( nodSursa, Q );
        // nodSursa va fi primul nod scos din coada
        while( ! goala( Q ))
        {
            v = dequeue( Q );
            for ( fiecare nod w adiacent cu v )
                if ( vizitate[ w ] == NEVIZITAT )
                {
                    vizitate[ w ] = VIZITAT;
                    procesam informatia pt w;
                    enqueue( w, Q );
                }
        }   */

    enqueue(Q, nodSursa);
    while (not_goala(Q))
    {
        v = dequeue(Q);
        printf("%d ", v);

        NodeT* crt = G.t[v];

        while (crt != NULL)
        {
            w = crt->v;
            if (vizitate[w] == WHITE)
            {
                vizitate[w] = GREY;
                enqueue(Q, w);
            }
            crt = crt->next;
        }
        vizitate[v] = BLACK;
    }
}

void citesteGraf(FILE* f, Graf* pG) {
    fscanf_s(f, "%d", &pG->n);    // citeste nr. de varfuri

    // Alocam dinamic tabloul de liste de adiacenta de dimensiune n:
    pG->t = calloc(pG->n, sizeof(NodeT*));
    if (pG->t == NULL) printErr();  // alocare esuata

    int i;
    for (i = 0; i < pG->n; i++) {
        // initializam (liste vide)
        pG->t[i] = NULL;
    }

    int v, w;
    // citeste pe rand perechi (v, w) si memoreaza arcul/muchia in listele de adiacenta:
    while (fscanf(f, "%d%d", &v, &w) == 2) {
        /// TODO: memoreaza arcul/muchia in listele de adiacenta
        NodeT* new_node = create_node(w);
        new_node->next = pG->t[v];
        pG->t[v] = new_node;
    }
}

int is_connected(Graf G, int* visited, int x, int y){
    return visited[y] == BLACK;
}

int main()
{
    FILE* f = fopen("graf.txt", "r");
    if (f == NULL) {
        perror("graf.txt");
        exit(1);
    }
    Graf G;
    citesteGraf(f, &G);
    fclose(f);


    printf("Dati cele doua noduri.\n");

    int x, y;
    scanf("%d%d", &x, &y);

    int* visited = calloc(G.n, sizeof(int));
    bfs(G, x, visited);

    if(is_connected(G, visited, x, y)){
        printf("SUnt conectate!");
    }
    else printf("Nu sunt conectate!");
    free(visited);
    return 0;
}