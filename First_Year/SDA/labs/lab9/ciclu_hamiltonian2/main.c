#include <stdio.h>
#include <stdbool.h>
#define V 4
#define INT_MAX 999999

int graph[V][V] = {
    {0, 10, 15, 20},
    {10, 0, 35, 25},
    {15, 35, 0, 30},
    {20, 25, 30, 0}
};

int path[V];
bool visited[V];

int minCost = INT_MAX;

void hamiltonianCycle(int pos, int cost, int count) {
    if (count == V && graph[pos][0]) {
        if (cost + graph[pos][0] < minCost) {
            minCost = cost + graph[pos][0];
            for (int i = 0; i < V; i++) {
                path[i] = visited[i];
            }
        }
        return; 
    }

    for (int i = 0; i < V; i++) {
        if (!visited[i] && graph[pos][i]) {
            visited[i] = true;
            hamiltonianCycle(i, cost + graph[pos][i], count + 1);
            visited[i] = false;
        }
    }
}

int main() {
    visited[0] = true;
    hamiltonianCycle(0, 0, 1);

    printf("Minimum cost Hamiltonian cycle: ");
    for (int i = 0; i < V; i++) {
        printf("%d ", path[i]);
    }
    printf("%d\n", path[0]);

    printf("Minimum cost: %d\n", minCost);

    return 0;
}