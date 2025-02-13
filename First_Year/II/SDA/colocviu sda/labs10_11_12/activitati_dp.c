#include <stdio.h>
#include <stdlib.h>

int activitati(int n, int *s, int *f){
    int i, j;
    int *dp = (int*)malloc((n+1)*sizeof(int));
    dp[0] = 0;
    for(i = 1; i <= n; i++){
        dp[i] = 0;
        for(j = 1; j < i; j++){
            if(f[j] <= s[i] && dp[i] < dp[j] + 1){
                dp[i] = dp[j] + 1;
            }
        }
    }
    return dp[n];
}

int main(){

    int n, i;

    scanf("%d", &n);

    int *s = (int*)malloc((n+1)*sizeof(int));

    int *f = (int*)malloc((n+1)*sizeof(int));

    for(i = 1; i <= n; i++){
        scanf("%d", &s[i]);
        scanf("%d", &f[i]);
    }

    printf("%d\n", activitati(n, s, f));

    return 0;
}