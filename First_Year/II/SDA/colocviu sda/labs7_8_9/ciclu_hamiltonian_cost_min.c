#include <stdio.h>
#include <stdlib.h>

typedef struct nod{
    int n;
    struct nod *next;
}NodeT;

typedef struct{
    int n;
    int **m;
}Graf;


Graf read_graph(const char* filename){
    Graf g;
    FILE *f = fopen(filename, "r");
    fscanf(f, "%d", &g.n);
    g.m = (int**)malloc(g.n * sizeof(int*));
    for(int i = 0; i < g.n; i++){
        g.m[i] = (int*)calloc(g.n, sizeof(int));
    }
    int x, y;
    while(fscanf(f, "%d%d", &x, &y) == 2){
        g.m[x][y] = g.m[y][x] = 1;
    }
    fclose(f);
    return g;
}

void hamiltonian_cycle(Graf g, int start, int *visited, int *path, int pos, int *min_cost, int *min_path) {
    visited[start] = 1;
    path[pos] = start;

    if (pos == g.n - 1) {
        if (g.m[path[pos]][path[0]] == 1) {
            int cost = 0;
            for (int i = 0; i < g.n - 1; i++) {
                cost += g.m[path[i]][path[i + 1]];
            }
            cost += g.m[path[g.n - 1]][path[0]];

            if (cost < *min_cost) {
                *min_cost = cost;
                memcpy(min_path, path, (g.n) * sizeof(int));
            }
        }
    } else {
        for (int v = 0; v < g.n; v++) {
            if (!visited[v] && g.m[start][v] == 1) {
                hamiltonian_cycle(g, v, visited, path, pos + 1, min_cost, min_path);
            }
        }
    }

    visited[start] = 0;
}

void find_min_hamiltonian_cycle(Graf g) {
    int *visited = (int *)calloc(g.n, sizeof(int));
    int *path = (int *)malloc(g.n * sizeof(int));
    int min_cost = INT_MAX;
    int *min_path = (int *)malloc(g.n * sizeof(int));

    hamiltonian_cycle(g, 0, visited, path, 0, &min_cost, min_path);

    if (min_cost == INT_MAX) {
        printf("No Hamiltonian cycle found\n");
    } else {
        printf("Min Hamiltonian cycle: ");
        for (int i = 0; i < g.n; i++) {
            printf("%d ", min_path[i]);
        }
        printf("%d\n", min_path[0]);
        printf("Cost: %d\n", min_cost);
    }

    free(visited);
    free(path);
    free(min_path);
}

int main() {
    Graf g = read_graph("graph.in");
    find_min_hamiltonian_cycle(g);
    return 0;
}