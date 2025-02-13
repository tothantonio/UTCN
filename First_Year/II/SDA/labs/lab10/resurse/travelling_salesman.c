#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

typedef struct {
    int numCities;
    int** adjacencyMatrix;
} Graph;

int main() {
    Graph graph;
    graph.numCities = 4;

    graph.adjacencyMatrix = (int**)malloc(graph.numCities * sizeof(int*));
    for (int i = 0; i < graph.numCities; i++) {
        graph.adjacencyMatrix[i] = (int*)malloc(graph.numCities * sizeof(int));
    }

    FILE* file = fopen("graph.txt", "r");
    if (file == NULL) {
        printf("Failed to open the file.\n");
        return 1;
    }

    for (int i = 0; i < graph.numCities; i++) {
        for (int j = 0; j < graph.numCities; j++) {
            if (i != j) {
                fscanf(file, "%d", &graph.adjacencyMatrix[i][j]);
            }
        }
    }

    fclose(file);

    int* visited = (int*)malloc(graph.numCities * sizeof(int));
    for (int i = 0; i < graph.numCities; i++) {
        visited[i] = 0;
    }

    int currentCity = 0;
    int nextCity;
    int minDistance;
    int totalDistance = 0;

    printf("The shortest path is: ");
    printf("%d ", currentCity + 1);
    visited[currentCity] = 1;

    for (int i = 0; i < graph.numCities - 1; i++) {
        minDistance = INT_MAX;
        for (int j = 0; j < graph.numCities; j++) {
            if (graph.adjacencyMatrix[currentCity][j] < minDistance && visited[j] == 0) {
                minDistance = graph.adjacencyMatrix[currentCity][j];
                nextCity = j;
            }
        }
        printf("%d ", nextCity + 1);
        visited[nextCity] = 1;
        totalDistance += minDistance;
        currentCity = nextCity;
    }

    printf("%d\n", 1);
    totalDistance += graph.adjacencyMatrix[currentCity][0];

    printf("Total distance: %d\n", totalDistance);

    free(visited);
    return 0;
}
