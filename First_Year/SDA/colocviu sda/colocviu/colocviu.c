#include <stdio.h>
#include <stdlib.h>

// 5 11
// 1 2 5 10 20
int greedy(int *v, int n, int suma){
    int nr = 0;
    for(int i = 0; i < n; i++){
        nr += suma / v[i];
        suma = suma % v[i];
    }
    return nr;
}

int backTracking(int *v, int n, int suma){
    if(suma == 0){
        return 0;
    }
    int min = 1000000;
    for(int i = 0; i < n; i++){
        if(suma >= v[i]){
            int nr = backTracking(v, n, suma - v[i]);
            if(nr + 1 < min){
                min = nr + 1;
            }
        }
    }
    return min;
}


int N, M;
int **harta;
int **dp;

int maxim(int a, int b){
    return a > b ? a : b;
}

int solve(int i, int j){
    if(i == N - 1 && j == M - 1){
        return harta[i][j];
    }
    if(i >= N || j >= M){
        return 0;
    }
    if(dp[i][j] != -1){
        return dp[i][j];
    }
    dp[i][j] = harta[i][j] + maxim(solve(i + 1, j), solve(i, j + 1));
    return dp[i][j];
}

int greedy_solve(){
    int i = 0, j = 0;
    int result = harta[i][j];
    while(i != N - 1 || j != M - 1){
        if(i + 1 < N && j + 1 < M){
            if(harta[i + 1][j] > harta[i][j + 1]){
                result += harta[i + 1][j];
                i++;
            }
            else{
                result += harta[i][j + 1];
                j++;
            }
        }
        else if(i + 1 < N){
            result += harta[i + 1][j];
            i++;
        }
        else if(j + 1 < M){
            result += harta[i][j + 1];
            j++;
        }
    }
    return result;
}
void printCoordinates(int **dp, int N, int M){
    int i = 0, j = 0;
    printf("(%d, %d) ", i, j);
    while(i != N - 1 || j != M - 1){
        if(i + 1 < N && j + 1 < M){
            if(dp[i + 1][j] > dp[i][j + 1]){
                i++;
            }
            else{
                j++;
            }
        }
        else if(i + 1 < N){
            i++;
        }
        else if(j + 1 < M){
            j++;
        }
        printf("(%d, %d) ", i, j);
    }
}


void solve2(int i, int j){
    printf("%d ", harta[i][j]);
    if(i == N - 1 && j == M - 1){
        return;
    }
    if(i >= N || j >= M){
        return;
    }
    if(i + 1 < N && j + 1 < M){
        if(dp[i + 1][j] > dp[i][j + 1]){
            solve2(i + 1, j);
        }
        else{
            solve2(i, j + 1);
        }
    }
    else if(i + 1 < N){
        solve2(i + 1, j);
    }
    else if(j + 1 < M){
        solve2(i, j + 1);
    }
}


int backtracking2(int i, int j){
    if(i == N - 1 && j == M - 1){
        return 1;
    }
    if(i >= N || j >= M){
        return 0;
    }
    if(harta[i][j] == -1){
        return 0;
    }
    return backtracking2(i + 1, j) + backtracking2(i, j + 1);
}

void printMatrix(int **dp, int N, int M){
    for(int i = 0; i < N; i++){
        for(int j = 0; j < M; j++){
            printf("%d ", dp[i][j]);
        }
        printf("\n");
    }
}

int main()
{

    int n, suma;

    scanf("%d %d", &n, &suma);

    int *v = (int*)malloc(n * sizeof(int));

    for(int i = 0; i < n; i++){
        scanf("%d", &v[i]);
    }

    printf("%d\n", greedy(v, n, suma));

    printf("%d\n", backTracking(v, n, suma));

    printf("\n");

    scanf("%d %d", &N, &M);

    harta = (int**)malloc(N * sizeof(int*));

    dp = (int**)malloc(N * sizeof(int*));

    for(int i = 0; i < N; i++){
        harta[i] = (int*)malloc(M * sizeof(int));
        dp[i] = (int*)malloc(M * sizeof(int));
    }

    for(int i = 0; i < N; i++){
        for(int j = 0; j < M; j++){
            scanf("%d", &harta[i][j]);
            dp[i][j] = -1;
        }
    }
    
    printf("\n");
    printf("%d\n", greedy_solve());

    printf("\n");
    printCoordinates(dp, N, M);

    printf("%d\n", solve(0, 0));

    printMatrix(dp, N, M);

    solve2(0, 0);

    printf("\n");

    printf("%d\n", backtracking2(0, 0));
    return 0;
}