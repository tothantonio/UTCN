#include <stdio.h>
#include <stdlib.h>

#define N 4
#define M 4

int maze[N][M] = {
    {1, 0, 0, 0},
    {1, 1, 1, 1},
    {0, 1, 0, 1},
    {1, 1, 1, 1}
};

int path[N][M];

int isValid(int x, int y){
    if(x >= 0 && x < N && y >= 0 && y < M && maze[x][y] == 1){
        return 1;
    }
    return 0;
}

void printPath(){
    for(int i = 0; i < N; i++){
        for(int j = 0; j < M; j++){
            printf("%d ", path[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void solveMazeUtil(int x, int y, int destX, int destY){
    if(x == destX && y == destY){
        path[x][y] = 1;
        printPath();
        path[x][y] = 0;
        return;
    }

    if(isValid(x, y)){
        path[x][y] = 1;

        solveMazeUtil(x + 1, y, destX, destY);
        solveMazeUtil(x, y + 1, destX, destY);

        path[x][y] = 0;
    }
}

void solveMaze(int startX, int startY, int destX, int destY){
    solveMazeUtil(startX, startY, destX, destY);
}

int main(){

    int startX = 0, startY = 0;
    int destX = 3, destY = 3;

    solveMaze(startX, startY, destX, destY);
    return 0;
}
