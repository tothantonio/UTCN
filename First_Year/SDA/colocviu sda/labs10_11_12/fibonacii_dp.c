#include <stdio.h>
#include <stdlib.h>

int fib(int n){
    int i;
    int *dp = (int*)malloc((n+1)*sizeof(int));
    dp[0] = 0;
    dp[1] = 1;
    for(i = 2; i <= n; i++){
        dp[i] = dp[i-1] + dp[i-2];
    }
    return dp[n];
}
int main(){

    int n;
    scanf("%d", &n);
    printf("%d\n", fib(n));
    return 0;
}