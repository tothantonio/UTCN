#include <stdio.h>
#include <stdlib.h>

int plata(int S, int n, int monede[]){
    int i, j;
    int *dp = (int*)malloc((S+1)*sizeof(int));
    dp[0] = 1;
    for(i = 1; i <= S; i++){
        dp[i] = 0;
    }
    for(i = 0; i < n; i++){
        for(j = monede[i]; j <= S; j++){
            dp[j] += dp[j - monede[i]];
        }
    }
    return dp[S];
}

int main(){

    int S, n, i;
    int *monede;
    scanf("%d", &S);
    scanf("%d", &n);
    monede = (int*)malloc(n*sizeof(int));
    for(i = 0; i < n; i++){
        scanf("%d", &monede[i]);
    }
    printf("%d\n", plata(S, n, monede));
    return 0;
}