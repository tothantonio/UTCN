#include <stdio.h>
#include <stdlib.h>

int n, m;
int mat[50][50];
int viz[50][50];
int iesire_x, iesire_y, start_x, start_y;

int dx[] = {-1, 1, 0, 0};
int dy[] = {0, 0, -1, 1};

void print_path(int path[][2], int len){
    for(int i = 0; i < len; i++)
        printf("(%d, %d) ", path[i][0], path[i][1]);
    printf("\n");
}

int valid(int x, int y){
    if(x >= 0 && x < n && y >= 0 && y < m && mat[x][y] == 1 && !viz[x][y])
        return 1;
    return 0;
}

int backT(int x, int y, int path[][2], int len){
    if(x == iesire_x && y == iesire_y){
        print_path(path, len);
        return 1;
    }

    viz[x][y] = 1;
    for(int i = 0; i < 4; i++){
        int urm_x = x + dx[i];
        int urm_y = y + dy[i];

        if(valid(urm_x, urm_y)){
            path[len][0] = urm_x;
            path[len][1] = urm_y;
            backT(urm_x, urm_y, path, len + 1);
        }
    }
    viz[x][y] = 0;
}

int main()
{

    scanf("%d%d", &n, &m);

    for(int i = 0 ; i < n ; i++){
        for(int j = 0 ; j < m ; j ++)
            scanf("%d", &mat[i][j]);
    }

    scanf("%d%d", &iesire_x, &iesire_y);
    scanf("%d%d", &start_x, &start_y);

    int path[50][2];
    backT(start_x, start_y, path, 0);

    return 0;
}