#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define V 6 // Number of vertices

int minDistance(int dist[], int visited[]) {
    int min = INT_MAX, min_index;
    for (int v = 0; v < V; v++) {
        if (visited[v] == 0 && dist[v] <= min) {
            min = dist[v];
            min_index = v;
        }
    }
    return min_index;
}

void printPath(int parent[], int j) {
    if (parent[j] == -1) {
        printf("%d ", j);
        return;
    }
    printPath(parent, parent[j]);
    printf("%d ", j);
}

void printSolution(int dist[], int parent[], int src) {
    printf("Vertex\t\tDistance\tPath");
    for (int i = 0; i < V; i++) {
        printf("\n%d -> %d\t\t%d\t\t%d ", src, i, dist[i], src);
        printPath(parent, i);
    }
}

void dijkstra(int graph[V][V], int src) {
    int dist[V];
    int visited[V];
    int parent[V];

    for (int i = 0; i < V; i++) {
        dist[i] = INT_MAX;
        visited[i] = 0;
        parent[i] = -1;
    }

    dist[src] = 0;

    for (int count = 0; count < V - 1; count++) {
        int u = minDistance(dist, visited);
        visited[u] = 1;

        for (int v = 0; v < V; v++) {
            if (!visited[v] && graph[u][v] && dist[u] != INT_MAX && dist[u] + graph[u][v] < dist[v]) {
                dist[v] = dist[u] + graph[u][v];
                parent[v] = u;
            }
        }
    }

    printSolution(dist, parent, src);
}

int main() {
    int graph[V][V] = {
        {0, 4, 0, 0, 0, 0},
        {4, 0, 8, 0, 0, 0},
        {0, 8, 0, 7, 0, 4},
        {0, 0, 7, 0, 9, 14},
        {0, 0, 0, 9, 0, 10},
        {0, 0, 4, 14, 10, 0}
    };

    int source = 0; // Source node

    dijkstra(graph, source);

    return 0;
}