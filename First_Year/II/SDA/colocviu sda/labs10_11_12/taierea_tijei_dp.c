#include <stdio.h>
#include <stdlib.h>
int taiere(int n, int *p, int *dp){

    int i, j;
    dp[0] = 0;
    for(i = 1; i <= n; i++){
        dp[i] = -1;
        for(j = 1; j <= i; j++){
            dp[i] = dp[i] > p[j] + dp[i-j] ? dp[i] : p[j] + dp[i-j];
        }
    }
    return dp[n];
}

int main(){

    int n, i;

    scanf("%d", &n);

    int *p = (int*)malloc((n+1)*sizeof(int));

    for(i = 1; i <= n; i++){
        scanf("%d", &p[i]);
    }

    int *dp = (int*)malloc((n+1)*sizeof(int));

    printf("%d\n", taiere(n, p, dp));
    return 0;
}