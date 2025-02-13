#include <stdio.h>
#include <stdlib.h>

#define V 5
#define INF 9999

int graph[V][V] = {
    {0, 1, 1, 1, 1},
    {1, 0, 1, 1, 1},
    {1, 1, 0, 1, 1},
    {1, 1, 1, 0, 1},
    {1, 1, 1, 1, 0}
};

int path[V];
int minCost = INF;

void printPath(int path[]) {
    for (int i = 0; i < V; i++) {
        printf("%d ", path[i]);
    }
    printf("\n");
}

int isValid(int v, int k) {
    if (graph[path[k - 1]][v] == 0) {
        return 0;
    }

    for (int i = 0; i < k; i++) {
        if (path[i] == v) {
            return 0;
        }
    }

    return 1;
}

void hamiltonian(int k) {
    if (k == V) {
        if (graph[path[V - 1]][path[0]] == 1) {
            int cost = 0;
            for (int i = 0; i < V - 1; i++) {
                cost += graph[path[i]][path[i + 1]];
            }
            cost += graph[path[V - 1]][path[0]];

            if (cost < minCost) {
                minCost = cost;
                printPath(path);
            }
        }
    } else {
        for (int v = 1; v < V; v++) {
            if (isValid(v, k)) {
                path[k] = v;
                hamiltonian(k + 1);
                path[k] = 0;
            }
        }
    }
}

int main() {
    path[0] = 0;
    hamiltonian(1);
    printf("Cost minim: %d\n", minCost);
    return 0;
}