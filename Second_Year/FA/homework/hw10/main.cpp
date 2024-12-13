#include <iostream>
#include <fstream>
#include "Profiler.h"
#include <stack>
#include <algorithm>

Profiler profiler("DFS");
using namespace std;

/*
 * @author Antonio-Roberto Toth
 * @group 30228
 * Assignment Requirements: Depth First Search (DFS)
 */

enum {
    WHITE = 0,
    GREY,
    BLACK
};

#define MAX_EDGES 4500
#define MAX_VERTICES 200

struct node {
    int key, adj_size, discovered, finished, index, lowLink, comp;
    node* adj[MAX_EDGES];
    int color;
    node* parent;
    bool onStack;
};

struct Graph {
    int nVertices;
    node *vertices[MAX_VERTICES];
};

void dfs_visit(node *start, int V) {
    Operation op = profiler.createOperation("Op", V);
    start->color = GREY;
    for (int i = 0; i < start->adj_size; i++) {
        if (start->adj[i]->color == WHITE) {
            start->adj[i]->parent = start;
            dfs_visit(start->adj[i], V);
        }
    }
    start->color = BLACK;
    op.count();
}

void dfs(Graph &G, int V) {
    Operation op = profiler.createOperation("Op", V);
    for(int i = 0; i < V; i++) {
        G.vertices[i]->color = WHITE;
        G.vertices[i]->parent = NULL;
    }

    for(int i = 0; i < V; i++) {
        if(G.vertices[i]->color == WHITE) {
            dfs_visit(G.vertices[i], V);
        }
    }
}

void displayGraph(Graph &G) {
    for(int i = 0; i < G.nVertices; i++) {
        cout << G.vertices[i]->key << ": ";
        for(int j = 0; j < G.vertices[i]->adj_size; j++) {
            cout << G.vertices[i]->adj[j]->key << " ";
        }
        cout << "\n";
    }
}

void prettyPrint(node* node, int tabs = 0) {
    if(node == NULL) return;
    for(int i = 0; i < tabs; i++) {
        cout << "  ";
    }

    if(node->parent) {
        cout << "Node " << node->key << " (Parent: " << node->parent->key << ")\n";
    } else {
        cout << "Node " << node->key << " (Root)\n";
    }
}

node* create(int key) {
    node *nod = new node;
    nod->key = key;
    nod->adj_size = 0;
    nod->parent = NULL;
    nod->color = WHITE;
    nod->discovered = 0;
    nod->finished = 0;
    nod->adj = nullptr;
    return nod;
}

Graph readGraphFromFile(string file) {
    ifstream fin(file);
    Graph G = {0};
    fin >> G.nVertices;
    for(int i = 0; i < G.nVertices; i++) {
        G.vertices[i] = create(i);
    }

    int nEdges = 0;
    while(fin >> nEdges) {
        int u, v;
        fin >> u >> v;
        G.vertices[u]->adj[G.vertices[u]->adj_size++] = G.vertices[v];
    }

    fin.close();
    return G;
}

void demo() {
    Graph G1 = readGraphFromFile("graph.txt");
    cout << "\nPrimul graf:\n";
    displayGraph(G1);

    // Execută DFS
    dfs(G1, G1.nVertices);

    // Afișează arborele DFS într-un format "frumos"
    cout << "\nArborele DFS:\n";
    for (int i = 0; i < G1.nVertices; ++i) {
        if (G1.vertices[i]->color == BLACK && G1.vertices[i]->parent == NULL) {
            prettyPrint(G1.vertices[i], 0); // Afișează arborele DFS pentru nodul root
        }
    }
}

void perf();

int main() {
    demo();
    //perf();
    return 0;
}

