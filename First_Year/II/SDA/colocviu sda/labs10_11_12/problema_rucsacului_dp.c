#include <stdio.h>
#include <stdlib.h>

int rucsac(int n, int *w, int *v, int W){
    int i, j;
    int **dp = (int**)malloc((n+1)*sizeof(int*));
    for(i = 0; i <= n; i++){
        dp[i] = (int*)malloc((W+1)*sizeof(int));
    }
    for(i = 0; i <= n; i++){
        dp[i][0] = 0;
    }
    for(i = 0; i <= W; i++){
        dp[0][i] = 0;
    }
    for(i = 1; i <= n; i++){
        for(j = 1; j <= W; j++){
            if(w[i] <= j){
                dp[i][j] = dp[i-1][j] > dp[i-1][j-w[i]] + v[i] ? dp[i-1][j] : dp[i-1][j-w[i]] + v[i];
            }else{
                dp[i][j] = dp[i-1][j];
            }
        }
    }
    return dp[n][W];
}

void printObjects(int n, int *w, int *v, int W, int **dp){
    int i = n, j = W;
    while(i > 0 && j > 0){
        if(dp[i][j] != dp[i-1][j]){
            printf("Object %d: weight = %d, value = %d\n", i, w[i], v[i]);
            j -= w[i];
        }
        i--;
    }
}

int main(){

    int n, W, i;
    scanf("%d", &n);
    int *w = (int*)malloc((n+1)*sizeof(int));
    int *v = (int*)malloc((n+1)*sizeof(int));
    for(i = 1; i <= n; i++){
        scanf("%d %d", &w[i], &v[i]);
    }

    scanf("%d", &W);

    int **dp = (int**)malloc((n+1)*sizeof(int*));
    for(i = 0; i <= n; i++){
        dp[i] = (int*)malloc((W+1)*sizeof(int));
    }

    printf("%d\n", rucsac(n, w, v, W));
    printObjects(n, w, v, W, dp);

    return 0;
}