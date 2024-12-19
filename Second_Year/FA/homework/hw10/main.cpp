#include <iostream>
#include <fstream>
#include "Profiler.h"

using namespace std;

#define MAX_VERTICES 200
#define MAX_EDGES 4500
#define STEP_VERTICES 10
#define STEP_EDGES 100

Profiler profiler("DFS");

/*
 * @author Antonio-Roberto Toth
 * @group 30228
 * Assignment Requirements: DFS(Depth First Search)
 *
 * I implemented DFS, Topological Sort and Tarjan's algorithm for Strongly Connected Components.
 *
 * DFS:
 * First, I initialize all the vertices with color WHITE and parent NULL. Then, I iterate through all the vertices and
 * if the vertex is WHITE, I call the dfsVisit function. In the dfsVisit function, I set the color of the vertex to GRAY
 * and iterate through all the adjacent vertices. If the adjacent vertex is WHITE, I set the parent of the adjacent vertex
 * to the current vertex and call the dfsVisit function recursively. If the adjacent vertex is GRAY, I set a boolean variable
 * to false. After iterating through all the adjacent vertices, I set the color of the vertex to BLACK. If the topoSort
 * parameter is true, I insert the vertex in the linked list. The function returns the boolean variable.
 * Complexity: O(V + E)
 *
 * Topological Sort:
 * I call the dfs function with the topoSort parameter set to true. The function returns a linked list with the vertices
 * in topological order. If the graph is acyclic, I display the linked list. Otherwise, I delete the linked list.
 * Complexity: O(V + E)
 *
 * Tarjan's algorithm:
 * I initialize the index, a linked list and the number of components. I iterate through all the vertices and if the vertex
 * has index -1, I call the STRONG_CONNECT function. In the STRONG_CONNECT function, I set the index and lowLink of the vertex
 * to the index, insert the vertex in the linked list and set the onStack variable to true. I iterate through all the adjacent
 * vertices and if the adjacent vertex has index -1, I call the STRONG_CONNECT function recursively. If the adjacent vertex is
 * on the stack, I set the lowLink of the vertex to the minimum between the lowLink of the vertex and the index of the adjacent
 * vertex. After iterating through all the adjacent vertices, if the lowLink of the vertex is equal to the index of the vertex,
 * I increment the number of components and remove the vertices from the linked list until the vertex is equal to the current
 * vertex. The function returns the number of components.
 * Complexity: O(V + E)
 */

enum Color {
    WHITE = 0,
    GRAY,
    BLACK
};

struct Node {
    int key, adjSize, index, lowLink, comp, color;
    Node **adj, *parent;
    bool onStack;
};

struct Graph {
    int nVertices;
    Node **vertices;
};

struct Edge {
    int u, v;
};

struct NodeLinkedList {
    Node *key;
    NodeLinkedList *next;
};

struct LinkedList {
    NodeLinkedList *first = NULL;
};

void insertFirst(NodeLinkedList **first, Node *key) {
    NodeLinkedList *node = new NodeLinkedList;
    node->next = NULL;
    node->key = key;

    if (*first == NULL) {*first = node;}
    else {
        node->next = *first;
        *first = node;
    }
}

Node *deleteFirst(NodeLinkedList **first) {
    if (*first == NULL) {
        return NULL;
    }

    NodeLinkedList *node = *first;
    *first = (*first)->next;

    Node *key = node->key;
    delete node;
    return key;
}

void deleteLinkedList(LinkedList &L) {
    while (L.first != NULL) {
        deleteFirst(&L.first);
    }
}

void displayLinkedList(LinkedList L) {
    if (L.first == NULL) {
        cout << "NULL";
    }

    for (NodeLinkedList *i = L.first; i != NULL; i = i->next) {
        cout << i->key->key << " ";
    }
    cout << "\n";
}

bool dfsVisit(Graph G, Node *u, bool topoSort = false, NodeLinkedList **first = NULL, Operation *op = NULL) {
    if (op != NULL) op->count();
    u->color = GRAY;

    bool acyclic = true;

    for (int i = 0; i < u->adjSize; ++i) {
        if (op != NULL) op->count();
        if (u->adj[i]->color == WHITE) {
            if (op != NULL) op->count();
            u->adj[i]->parent = u;
            bool result = dfsVisit(G, u->adj[i], topoSort, first, op);
            if (acyclic) {
                acyclic = result;
            }
        } else if (u->adj[i]->color == GRAY && u != u->adj[i]) {
            acyclic = false;
        }
    }

    if (op != NULL) op->count();
    u->color = BLACK;

    // if the topoSort parameter is true, insert the vertex in the linked list
    if (topoSort == true) {
        insertFirst(first, u);
    }

    return acyclic;
}

bool dfs(Graph G, bool topoSort = false, NodeLinkedList **first = NULL, Operation *op = NULL) {
    // initialize the vertices
    for (int i = 0; i < G.nVertices; ++i) {
        G.vertices[i]->color = WHITE;
        G.vertices[i]->parent = NULL;
    }

    bool acyclic = true;

    // iterate through all the vertices
    for (int i = 0; i < G.nVertices; ++i) {
        if (G.vertices[i]->color == WHITE) {
            bool result = dfsVisit(G, G.vertices[i], topoSort, first, op);
            // if the graph is acyclic, set the acyclic variable to the result of the dfsVisit function
            if (acyclic) {
                acyclic = result;
            }
        }
    }

    return acyclic;
}

LinkedList topologicalSort(Graph G) {
    LinkedList L = {NULL};
    bool acyclic = dfs(G, true, &L.first);
    if (acyclic == false)
        deleteLinkedList(L);
    return L;
}

void STRONG_CONNECT(Graph G, Node *u, int &index, LinkedList &L, int &nComponents) {
    // set the index and lowLink of the vertex to the index
    u->index = index;
    u->lowLink = index;
    index++;
    insertFirst(&L.first, u);
    u->onStack = true;

    // iterate through all the adjacent vertices
    for (int i = 0; i < u->adjSize; ++i) {
        if (u->adj[i]->index == -1) {
            STRONG_CONNECT(G, u->adj[i], index, L, nComponents);
            u->lowLink = min(u->lowLink, u->adj[i]->lowLink);
        } else if (u->adj[i]->onStack == true) {
            u->lowLink = min(u->lowLink, u->adj[i]->index);
        }
    }
    Node *v;
    if (u->lowLink == u->index) {
        nComponents++;
        do {
            v = deleteFirst(&L.first);
            v->onStack = false;
            v->comp = nComponents;
        } while (v != u);
    }
}

int tarjan(Graph G) {
    // initialize the vertices
    int index = 0;
    LinkedList L = {NULL};
    int nComponents = 0;

    for (int i = 0; i < G.nVertices; ++i) {
        G.vertices[i]->index = -1;
        G.vertices[i]->lowLink = -1;
        G.vertices[i]->onStack = false;
        G.vertices[i]->comp = 0;
    }

    // iterate through all the vertices
    for (int i = 0; i < G.nVertices; ++i) {
        if (G.vertices[i]->index == -1) {
            STRONG_CONNECT(G, G.vertices[i], index, L, nComponents);
        }
    }

    return nComponents;
}

Node *create(int key) { // create a new node
    Node *node = new Node;

    node->key = key;
    node->adjSize = 0;
    node->adj = NULL;
    node->parent = NULL;
    node->color = WHITE;

    return node;
}

Graph readFromFile(string file) {
    ifstream fin(file);
    Graph G = {0};

    // read the number of vertices
    fin >> G.nVertices;
    G.vertices = new Node *[G.nVertices];
    for (int i = 0; i < G.nVertices; ++i) {
        G.vertices[i] = create(i);
    }

    // read the edges
    int nEdges = 0;
    Edge *edges = new Edge[MAX_EDGES];
    while (fin >> edges[nEdges].u >> edges[nEdges].v) {
        G.vertices[edges[nEdges].u]->adjSize++;
        nEdges++;
    }

    // create the adjacency list for each vertex
    for (int i = 0; i < G.nVertices; ++i) {
        G.vertices[i]->adj = new Node *[G.vertices[i]->adjSize];
        G.vertices[i]->adjSize = 0;
    }

    // add the edges to the adjacency list
    for (int i = 0; i < nEdges; ++i) {
        G.vertices[edges[i].u]->adj[G.vertices[edges[i].u]->adjSize++] = G.vertices[edges[i].v];
    }

    // free memory
    delete[] edges;
    fin.close();
    return G;
}

void displayGraph(Graph G) {
    for (int i = 0; i < G.nVertices; ++i) {
        cout << G.vertices[i]->key << ": ";
        for (int j = 0; j < G.vertices[i]->adjSize; ++j) {
            cout << G.vertices[i]->adj[j]->key << " ";
        }
        cout << "\n";
    }
}

void prettyPrintTree(int n, int parent, int *p, int tabs = 0) {
    for (int i = 0; i < tabs; i++) {
        printf("  ");
    }
    cout << parent << "\n";
    for (int i = 0; i < n; i++) {
        if (p[i] == parent) {
            prettyPrintTree(n, i, p, tabs + 1);
        }
    }
}

Graph generate(int nVertices, int nEdges) {
    bool **adMatrix = new bool *[nVertices]; // adjacency matrix
    for (int i = 0; i < nVertices; i++) {
        adMatrix[i] = new bool[nVertices]{0};
    }

    Graph G = {0};
    // initialize the graph
    G.nVertices = nVertices;
    G.vertices = new Node *[G.nVertices];
    for (int i = 0; i < G.nVertices; ++i) {
        G.vertices[i] = create(i);
    }

    // generate random edges
    int cntEdges = 0;
    while (cntEdges < nEdges) {
        int u = rand() % G.nVertices;
        int v = rand() % G.nVertices;

        // check if the edge already exists
        if (u != v && adMatrix[u][v] == 0) {
            adMatrix[u][v] = 1;
            G.vertices[u]->adjSize++;
            cntEdges++;
        }
    }

    // create the adjacency list for each vertex
    for (int i = 0; i < nVertices; ++i) {
        if (G.vertices[i]->adjSize > 0) {
            G.vertices[i]->adj = new Node *[G.vertices[i]->adjSize]{NULL};
            G.vertices[i]->adjSize = 0;

            for (int j = 0; j < nVertices; ++j) {
                if (adMatrix[i][j] == 1) {
                    G.vertices[i]->adj[G.vertices[i]->adjSize++] = G.vertices[j];
                }
            }
        }
    }

    // free memory
    for (int i = 0; i < nVertices; i++) {
        delete adMatrix[i];
    }
    delete[] adMatrix;

    return G;
}

void deleteGraph(Graph &G) {
    for (int i = 0; i < G.nVertices; ++i) {
        delete[] G.vertices[i]->adj;
    }

    for (int i = 0; i < G.nVertices; ++i) {
        delete G.vertices[i];
    }

    delete[] G.vertices;
}

void displayComponents(Graph G, int nComponents) {
    cout << "\nSunt " << nComponents << " componente\n";
    for (int i = 1; i <= nComponents; ++i) {
        cout << "Componenta " << i << ": ";
        for (int j = 0; j < G.nVertices; ++j) {
            if (i == G.vertices[j]->comp) {
                cout << G.vertices[j]->key << " ";
            }
        }
        cout << "\n";
    }
}

void demo() {
    Graph G1 = readFromFile("graph.txt");
    cout << "\nFirst graph:\n";
    displayGraph(G1);

    cout << "The graph is acyclic: " << dfs(G1) << "\n";

    int *p = new int[G1.nVertices]{0};
    for (int i = 0; i < G1.nVertices; ++i) {
        if (G1.vertices[i]->parent == NULL) {
            p[i] = -1;
        } else {
            p[i] = G1.vertices[i]->parent->key;
        }
    }
    for (int i = 0; i < G1.nVertices; ++i) {
        if (p[i] == -1) {
            prettyPrintTree(G1.nVertices, i, p);
        }
    }
    delete[] p;

    LinkedList L = topologicalSort(G1);
    cout << "\nTopological Sort:\n";
    displayLinkedList(L);
    deleteLinkedList(L);

    Graph G2 = readFromFile("graph_comp_tari_conexe.txt");
    cout << "\nSecond graph:\n";
    displayGraph(G2);

    int nComponents = tarjan(G2);
    displayComponents(G2, nComponents);
}

void perf() {
    for (int i = 1000; i <= MAX_EDGES; i += STEP_EDGES) {
        Operation op = profiler.createOperation("dfs-edges", i);

        Graph G = {0};
        G.nVertices = 100;
        G = generate(G.nVertices, i);
        dfs(G, false, NULL, &op);
        deleteGraph(G);
    }

    for (int i = 100; i < MAX_VERTICES; i += STEP_VERTICES) {
        Operation op = profiler.createOperation("dfs-vertices", i);

        Graph G = {0};
        G.nVertices = i;
        G = generate(G.nVertices, MAX_EDGES);
        dfs(G, false, NULL, &op);
        deleteGraph(G);
    }

    profiler.showReport();
}

int main() {
    demo();
    //perf();
    return 0;
}