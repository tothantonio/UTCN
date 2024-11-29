#include <iostream>
#include "Profiler.h"
#include <vector>
using namespace std;
Profiler profiler;

#define MAX_SIZE 10000
#define STEP_SIZE 100
#define NR_TESTS 5

/*
 * @author Antonio-Roberto Toth
 * @group 30228
 * Assignment Requirements: Disjoint Sets + Kruskal Algorithm
 *
 * MAKESET:
 * Each element is treated as its own set(it is its own parent).
 * Rank is initialized with 1, key is initialized with the element itself.
 * Complexity: O(1)
 *
 * UNION:
 * It combines two sets into one. It compares the ranks of the two sets and merges them accordingly.
 * If the ranks are equal, arbitrarily choose one of the sets to be the parent of the other and increment the rank of the parent.
 * If one rank is smaller, link the smaller tree to the larger tree. This keeps the tree minimal
 * Complexity: O(1), because I only do UNION, in UNION, I do not use FINDSET to  find the parents of the two sets before merging them.
 *
 * FINDSET:
 * Finds the root of the set that an elements belongs to
 * Traverses the parent pointers recursively until it reaches the root of a set(an element whose parent its itself)
 * Makes all nodes along the path directly point to the root
 * Complexity: O(1)
 *
 * Kruskal:
 * A greedy algorithm (uses the smallest available edge, ensuring local optimal choice)
 * used to find the Minimum Spanning Tree(MST) of a connected, weighted and undirected graph.
 * First we sort all the edges by their cost.
 * Then we use MAKESET to treat each node as a set initially
 * For each edge {u, v} we check if u and v belong to the same set using FINDSET
 * If they are in different sets, and they do not form a cycle, add the edge to the MST and merge the two sets using UNION
 * We stop adding edges when the MST has exactly n - 1 edges, where n is the number of nodes
 * Complexity: O(ElogE), E = Edges
 */
struct node {
    int rank, key;
};

struct edge { // comparare in functie de cost
    int x, y, cost;
};

vector<edge> edges;
vector<edge> mst; // mst for a graph with n nodes should contain n - 1 edges

node parent[10005];

void MAKESET(int x, int n) {
    Operation op = profiler.createOperation("Operations MAKESET", n);
    op.count(2);
    parent[x].rank = 1;
    parent[x].key = x;
}

void UNION(int x, int y, int n) { // doar dupa ce findset(x) != findset(y)
    Operation op = profiler.createOperation("Operations UNION", n);
    if(parent[x].rank == parent[y].rank) {
        op.count(2);
        parent[x].key = parent[y].key; // leg pe x de y
        op.count();
        parent[y].rank ++; // cresc rank ul nodului de care am legat
    } else if(parent[x].rank < parent[y].rank) {
        op.count(2);
        parent[x].key = parent[y].key;
        // nu mai cresc rank, leg in latime, nu in inaltime
    } else {
        op.count(2);
        parent[y].key = parent[x].key;
        // la fel nu mai cresc rank-ul
    }
}

int FINDSET(int x, int n) { // gaseste root ul
    Operation op = profiler.createOperation("Operations FINDSET", n);
    op.count();
    if(parent[x].key == x) {
        return x;
    }
    op.count();
    parent[x].key = FINDSET(parent[x].key, n); // urcam in sus pe set
    return parent[x].key;
}

void printSets(int n) {
    for (int i = 1; i <= n; ++i) {
        cout << "Element: " << i << ", Set Representative: " << FINDSET(i, n) << endl;
    }
}

void addEdge(int x, int y, int cost) {
    edges.push_back({x, y, cost});
}

bool compare(edge a, edge b) {
    return a.cost < b.cost;
}

void printEdge(vector<edge>& edges) {
    for(auto edge : edges) {
        cout << edge.x << " " << edge.y << " " << edge.cost << endl;
    }
}

void kruskal(int n) {
    sort(edges.begin(), edges.end(), compare);
    for(int i = 1; i <= n; i++) {
        MAKESET(i, n);
    }
    for(auto& e : edges) {
        if(FINDSET(e.x, n) != FINDSET(e.y, n)) {
            mst.push_back(e);
            UNION(FINDSET(e.x, n), FINDSET(e.y, n), n);
        }
    }
}

void demo() {
    int n = 10;
    for (int i = 1; i <= n; ++i) {
        MAKESET(i, n);
    }
    cout << "Initial sets:" << endl;
    printSets(n);

    UNION(1, 2, n);
    UNION(3, 4, n);
    UNION(2, 3, n);
    UNION(5, 6, n);
    UNION(1, 5, n);

    cout << "\nSets after UNION operations:" << endl;
    printSets(n);

    cout << "\nFINDSET results for elements 1 to 5:" << endl;
    for (int i = 1; i <= 5; ++i) {
        cout << "FINDSET(" << i << ") = " << FINDSET(i, n) << endl;
    }

    int m = 5;
    addEdge(1, 2, 1);
    addEdge(2, 3, 2);
    addEdge(4, 1, 9);
    addEdge(3, 4, 3);
    addEdge(4, 5, 4);
    addEdge(5, 1, 5);
    addEdge(1, 3, 6);
    addEdge(2, 4, 7);
    addEdge(3, 5, 8);

    cout << "\nAll edges in the graph:\n";
    printEdge(edges);

    kruskal(m);
    cout << "\nEdges in the Minimum Spanning Tree:\n";
    printEdge(mst); // mst should contain only 4 edges
}

void perf() {
    for(int n = STEP_SIZE; n < MAX_SIZE; n += STEP_SIZE) {
        for(int test = 0; test < NR_TESTS; test ++) {
            edges.clear();
            mst.clear();

            for(int i = 1; i < n; i ++) {
                addEdge(i, i + 1, rand() % 1000 + 1);
            }
            for(int i = n; i <= 4 * n; i ++) {
                int x = rand() % n + 1;
                int y = rand() % n + 1;
                if(x != y) {
                    addEdge(x, y, rand() % 1000 + 1);
                }
            }
            kruskal(n);
        }
    }

    profiler.divideValues("Operations MAKESET", NR_TESTS);
    profiler.divideValues("Operations FINDSET", NR_TESTS);
    profiler.divideValues("Operations UNION", NR_TESTS);

    profiler.createGroup("Operations","Operations MAKESET", "Operations UNION", "Operations FINDSET");

    profiler.showReport();
}

int main()
{
    demo();
    //perf();
    return 0;
}
