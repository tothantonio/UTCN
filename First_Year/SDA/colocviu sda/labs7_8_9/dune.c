#include <stdio.h>
#include <stdlib.h>

int n, m;
int px, py;
int mat[50][50];

int isValid(int x, int y) {
    if (x >= 0 && x < n && y >= 0 && y < m) {
        return 1;
    }
    return 0;
}

void generatePossibilities(int x, int y) {
    if (!isValid(x, y)) {
        return;
    }
    
    if (mat[x][y] == -1) {
        return;
    }
    
    mat[x][y] = -1;
    
    printf("(%d, %d)\n", x, y);
    
    generatePossibilities(x + 1, y);
    generatePossibilities(x - 1, y);
    generatePossibilities(x, y + 1);
    generatePossibilities(x, y - 1);
    
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
    generatePossibilities(px, py);

    return 0;
}