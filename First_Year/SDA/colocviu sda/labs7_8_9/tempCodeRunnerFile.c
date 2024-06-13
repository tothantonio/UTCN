#include <stdio.h>
#include <stdlib.h>

int n, m;
int px, py;
int mat[50][50];

// Function to check if a position is valid
int isValid(int x, int y) {
    if (x >= 0 && x < n && y >= 0 && y < m) {
        return 1;
    }
    return 0;
}

// Function to generate all possibilities for the ball to descend from the dune
void generatePossibilities(int x, int y) {
    // Check if the current position is valid
    if (!isValid(x, y)) {
        return;
    }
    
    // Check if the ball has already passed through this position
    if (mat[x][y] == -1) {
        return;
    }
    
    // Mark the current position as visited
    mat[x][y] = -1;
    
    // Print the current position
    printf("(%d, %d)\n", x, y);
    
    // Generate possibilities for the ball to move to adjacent positions
    generatePossibilities(x + 1, y);
    generatePossibilities(x - 1, y);
    generatePossibilities(x, y + 1);
    generatePossibilities(x, y - 1);
    
    // Mark the current position as unvisited
    mat[x][y] = 0;
}

int main() {
    scanf("%d%d", &n, &m);

    for(int i = 0 ; i < n ; i++) {
        for(int j = 0 ; j < m ; j++) {
            scanf("%d", &mat[i][j]);
        }
    }

    scanf("%d%d", &px, &py);

    // Generate possibilities for the ball to descend from the dune starting at position (px, py)
    generatePossibilities(px, py);

    return 0;
}