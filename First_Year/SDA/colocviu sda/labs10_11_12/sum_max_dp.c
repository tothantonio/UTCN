#include <stdio.h>
#include <stdlib.h>

int sum_max(int n, int *v, int *dp){

    int i, j;
    dp[0] = 0;
    for(i = 1; i <= n; i++){
        dp[i] = 0;
        for(j = 0; j < i; j++){
            if(dp[i] < dp[j] + v[i] && (dp[j] + v[i]) % n == 0){
                dp[i] = dp[j] + v[i];
            }
        }
    }
    return dp[n];
}



int main(){

    int n, i;

    scanf("%d", &n);

    int *v = (int*)malloc((n+1)*sizeof(int));

    for(i = 1; i <= n; i++){
        scanf("%d", &v[i]);
    }

    int *dp = (int*)malloc((n+1)*sizeof(int));

    printf("%d\n", sum_max(n, v, dp));
    return 0;
}