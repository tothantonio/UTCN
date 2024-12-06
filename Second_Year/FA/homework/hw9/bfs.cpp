#include <stdlib.h>
#include <string.h>
#include "bfs.h"
#include <queue>
#include <iostream>
using namespace std;

/*
 * @author Antonio-Roberto Toth
 * @group 30228
 * Assignment Requirements: Breadth First Search
 */

int get_neighbors(const Grid *grid, Point p, Point neighb[]) {
    // TODO: fill the array neighb with the neighbors of the point p and return the number of neighbors
    // the point p will have at most 4 neighbors (up, down, left, right)
    // avoid the neighbors that are outside the grid limits or fall into a wall
    // note: the size of the array neighb is guaranteed to be at least 4
    int count = 0;
    int dir[4][2] = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    for(int i = 0; i < 4; i ++) {
        int newRow = p.row + dir[i][0];
        int newCol = p.col + dir[i][1];

        if(newRow >= 0 && newRow < grid->rows && newCol >= 0 && newCol < grid->cols && grid->mat[newRow][newCol] == 0) {
            neighb[count].row = newRow;
            neighb[count].col = newCol;
            count++;
        }
    }
    return count;
}

void grid_to_graph(const Grid *grid, Graph *graph)
{
    //we need to keep the nodes in a matrix, so we can easily refer to a position in the grid
    Node *nodes[MAX_ROWS][MAX_COLS];
    int i, j, k;
    Point neighb[4];

    //compute how many nodes we have and allocate each node
    graph->nrNodes = 0;
    for(i=0; i<grid->rows; ++i){
        for(j=0; j<grid->cols; ++j){
            if(grid->mat[i][j] == 0){
                nodes[i][j] = (Node*)malloc(sizeof(Node));
                memset(nodes[i][j], 0, sizeof(Node)); //initialize all fields with 0/NULL
                nodes[i][j]->position.row = i;
                nodes[i][j]->position.col = j;
                ++graph->nrNodes;
            }else{
                nodes[i][j] = NULL;
            }
        }
    }
    graph->v = (Node**)malloc(graph->nrNodes * sizeof(Node*));
    k = 0;
    for(i=0; i<grid->rows; ++i){
        for(j=0; j<grid->cols; ++j){
            if(nodes[i][j] != NULL){
                graph->v[k++] = nodes[i][j];
            }
        }
    }

    //compute the adjacency list for each node
    for(i=0; i<graph->nrNodes; ++i){
        graph->v[i]->adjSize = get_neighbors(grid, graph->v[i]->position, neighb);
        if(graph->v[i]->adjSize != 0){
            graph->v[i]->adj = (Node**)malloc(graph->v[i]->adjSize * sizeof(Node*));
            k = 0;
            for(j=0; j<graph->v[i]->adjSize; ++j){
                if( neighb[j].row >= 0 && neighb[j].row < grid->rows &&
                    neighb[j].col >= 0 && neighb[j].col < grid->cols &&
                    grid->mat[neighb[j].row][neighb[j].col] == 0){
                        graph->v[i]->adj[k++] = nodes[neighb[j].row][neighb[j].col];
                }
            }
            if(k < graph->v[i]->adjSize){
                //get_neighbors returned some invalid neighbors
                graph->v[i]->adjSize = k;
                graph->v[i]->adj = (Node**)realloc(graph->v[i]->adj, k * sizeof(Node*));
            }
        }
    }
}

void free_graph(Graph *graph)
{
    if(graph->v != NULL){
        for(int i=0; i<graph->nrNodes; ++i){
            if(graph->v[i] != NULL){
                if(graph->v[i]->adj != NULL){
                    free(graph->v[i]->adj);
                    graph->v[i]->adj = NULL;
                }
                graph->v[i]->adjSize = 0;
                free(graph->v[i]);
                graph->v[i] = NULL;
            }
        }
        free(graph->v);
        graph->v = NULL;
    }
    graph->nrNodes = 0;
}

void bfs(Graph *graph, Node *s, Operation *op) // O(V + E) complexity
{
    // TOOD: implement the BFS algorithm on the graph, starting from the node s
    // at the end of the algorithm, every node reachable from s should have the color BLACK
    // for all the visited nodes, the minimum distance from s (dist) and the parent in the BFS tree should be set
    // for counting the number of operations, the optional op parameter is received
    // since op can be NULL (when we are calling the bfs for display purposes), you should check it before counting:
    // if(op != NULL) op->count();

    queue<Node*> q;

    // Initialize all nodes
    for (int i = 0; i < graph->nrNodes; ++i) {
        if(op != NULL) op->count(3);
        graph->v[i]->color = COLOR_WHITE;
        graph->v[i]->dist = INT_MAX;
        graph->v[i]->parent = NULL;
    }

    if(op != NULL) op->count(3);
    // Start from node s
    s->color = COLOR_GRAY;
    s->dist = 0;
    s->parent = NULL;
    q.push(s);

    while (!q.empty()) {
        if(op != NULL) op->count(1);
        Node *u = q.front();
        q.pop();

        for (int i = 0; i < u->adjSize; ++i) {
            if(op != NULL) op->count(1);
            Node *v = u->adj[i];
            if (v->color == COLOR_WHITE) {
                if(op != NULL) op->count(3);
                v->color = COLOR_GRAY;
                v->dist = u->dist + 1;
                v->parent = u;
                q.push(v);

                if (op != NULL) op->count();
            }
        }
        if(op != NULL) op->count(1);
        u->color = COLOR_BLACK;
    }
}

void pretty_print_tree(int n, int parent, int *p, Point *repr, int tabs = 0) {
    for(int i = 0; i < tabs; i ++) {
        cout << "\t";
    }
    cout << "(" << repr[parent].row << ", " << repr[parent].col << ")" << endl;
    for(int i = 0; i < n; i++) {
        if(p[i] == parent) {
            pretty_print_tree(n, i, p, repr, tabs + 1);
        }
    }
}

void print_bfs_tree(Graph *graph)
{
    //first, we will represent the BFS tree as a parent array
    int n = 0; //the number of nodes
    int *p = NULL; //the parent array
    Point *repr = NULL; //the representation for each element in p

    //some of the nodes in graph->v may not have been reached by BFS
    //p and repr will contain only the reachable nodes
    int *transf = (int*)malloc(graph->nrNodes * sizeof(int));
    for(int i=0; i<graph->nrNodes; ++i){
        if(graph->v[i]->color == COLOR_BLACK){
            transf[i] = n;
            ++n;
        }else{
            transf[i] = -1;
        }
    }
    if(n == 0){
        //no BFS tree
        free(transf);
        return;
    }

    int err = 0;
    p = (int*)malloc(n * sizeof(int));
    repr = (Point*)malloc(n * sizeof(Node));
    for(int i=0; i<graph->nrNodes && !err; ++i){
        if(graph->v[i]->color == COLOR_BLACK){
            if(transf[i] < 0 || transf[i] >= n){
                err = 1;
            }else{
                repr[transf[i]] = graph->v[i]->position;
                if(graph->v[i]->parent == NULL){
                    p[transf[i]] = -1;
                }else{
                    err = 1;
                    for(int j=0; j<graph->nrNodes; ++j){
                        if(graph->v[i]->parent == graph->v[j]){
                            if(transf[j] >= 0 && transf[j] < n){
                                p[transf[i]] = transf[j];
                                err = 0;
                            }
                            break;
                        }
                    }
                }
            }
        }
    }
    free(transf);
    transf = NULL;

    if(!err){
        // TODO: pretty print the BFS tree
        // the parrent array is p (p[k] is the parent for node k or -1 if k is the root)
        // when printing the node k, print repr[k] (it contains the row and column for that point)
        // you can adapt the code for transforming and printing multi-way trees from the previous labs
        for(int i = 0; i < n; i++) {
            if(p[i] == -1) {
                pretty_print_tree(n, i, p, repr);
                break;
            }
        }
    }

    if(p != NULL){
        free(p);
        p = NULL;
    }
    if(repr != NULL){
        free(repr);
        repr = NULL;
    }
}

int shortest_path(Graph *graph, Node *start, Node *end, Node *path[])
{
    // TODO: compute the shortest path between the nodes start and end in the given graph
    // the nodes from the path, should be filled, in order, in the array path
    // the number of nodes filled in the path array should be returned
    // if end is not reachable from start, return -1
    // note: the size of the array path is guaranteed to be at least 1000

    bfs(graph, start, NULL);
    if(end->color == COLOR_WHITE) {
        return -1;
    }

    int n = end->dist;
    Node *current = end;
    for(int i = n - 1; i >= 0; i --) {
        path[i] = current;
        current = current->parent;
    }
    return n;
}

nodeSet parent[10005];

nodeSet *MAKESET() {
    nodeSet *x = new nodeSet;
    x->parent = x;
    x->rank = 0;

    return x;
}

nodeSet *FINDSET(nodeSet *x) {
    if(x != x->parent) {
        x->parent = FINDSET(x->parent);
    }
    return x->parent;
}

void UNION(nodeSet *x, nodeSet *y) {
    nodeSet *xRoot = FINDSET(x);
    nodeSet *yRoot = FINDSET(y);

    if(xRoot != yRoot) {
        if(xRoot->rank < yRoot->rank) {
            xRoot->parent = yRoot;
        } else if(xRoot->rank > yRoot->rank) {
            yRoot->parent = xRoot;
        } else {
            yRoot->parent = xRoot;
            xRoot->rank++;
        }
    }
}

void generate(Graph &graph, int nrEdges) {
    int **adMatrix = new int *[graph.nrNodes];
    for(int i = 0; i < graph.nrNodes; i++) {
        adMatrix[i] = new int[graph.nrNodes]{0};
    }

    int nComponents = graph.nrNodes;

    nodeSet **a = new nodeSet *[graph.nrNodes]{NULL};

    for(int i = 0; i < graph.nrNodes; i++) {
        a[i] = MAKESET();
    }

    nrEdges = nrEdges < graph.nrNodes * (graph.nrNodes - 1) / 2 ? nrEdges : graph.nrNodes * (graph.nrNodes - 1) / 2;

    int cntEdges = 0;
    while(cntEdges < nrEdges - nComponents + 1) {
        int u = rand() % graph.nrNodes;
        int v = rand() % graph.nrNodes;

        if(u != v && adMatrix[u][v] == 0 && adMatrix[v][u] == 0) {
            adMatrix[u][v] = 1;
            adMatrix[v][u] = 1;
            graph.v[u]->adjSize++;
            graph.v[v]->adjSize++;
            cntEdges++;

            if(FINDSET(a[u]) != FINDSET(a[v])) {
                UNION(a[u], a[v]);
                nComponents--;
            }
        }
    }

    for(int i = 1; i < graph.nrNodes && nComponents > 1; i++) {
        if(FINDSET(a[0]) != FINDSET(a[i])) {
            adMatrix[0][1] = 1;
            adMatrix[1][0] = 1;
            graph.v[0]->adjSize++;
            graph.v[1]->adjSize++;

            UNION(a[0], a[i]);
            nComponents--;
        }
    }

    for(int i = 0; i < graph.nrNodes; i++) {
        if(graph.v[i]->adjSize > 0) {
            graph.v[i]->adj = new Node *[graph.v[i]->adjSize];
            graph.v[i]->adjSize = 0;

            for(int j = 0; j < graph.nrNodes; j++) {
                if(adMatrix[i][j] == 1) {
                    graph.v[i]->adj[graph.v[i]->adjSize] = graph.v[j];
                    graph.v[i]->adjSize++;
                }
            }
        }
    }
    for(int i = 0; i < graph.nrNodes; i++) {
        delete[] adMatrix[i];
    }
    delete[] adMatrix;

    for(int i = 0; i < graph.nrNodes; i++) {
        delete a[i];
    }
    delete[] a;
}


void performance()
{
    int n, i;
    Profiler p("bfs");

    // vary the number of edges
    for(n=1000; n<=4500; n+=100){
        Operation op = p.createOperation("bfs-edges", n);
        Graph graph;
        graph.nrNodes = 100;
        //initialize the nodes of the graph
        graph.v = (Node**)malloc(graph.nrNodes * sizeof(Node*));
        for(i=0; i<graph.nrNodes; ++i){
            graph.v[i] = (Node*)malloc(sizeof(Node));
            memset(graph.v[i], 0, sizeof(Node));
        }
        // TODO: generate n random edges
        // make sure the generated graph is connected
        generate(graph, n);

        bfs(&graph, graph.v[0], &op);
        free_graph(&graph);
    }

    // vary the number of vertices
    for(n=100; n<=200; n+=10){
        Operation op = p.createOperation("bfs-vertices", n);
        Graph graph;
        graph.nrNodes = n;
        //initialize the nodes of the graph
        graph.v = (Node**)malloc(graph.nrNodes * sizeof(Node*));
        for(i=0; i<graph.nrNodes; ++i){
            graph.v[i] = (Node*)malloc(sizeof(Node));
            memset(graph.v[i], 0, sizeof(Node));
        }
        // TODO: generate 4500 random edges
        // make sure the generated graph is connected
        generate(graph, 4500);

        bfs(&graph, graph.v[0], &op);
        free_graph(&graph);
    }

    p.showReport();
}
