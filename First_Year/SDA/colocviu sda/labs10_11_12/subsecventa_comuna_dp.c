#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int subsecventa_comuna(char *s1, char *s2){
    int n = strlen(s1);
    int m = strlen(s2);
    int i, j;
    int **dp = (int**)malloc((n+1)*sizeof(int*));
    for(i = 0; i <= n; i++){
        dp[i] = (int*)malloc((m+1)*sizeof(int));
    }
    for(i = 0; i <= n; i++){
        dp[i][0] = 0;
    }
    for(i = 0; i <= m; i++){
        dp[0][i] = 0;
    }
    for(i = 1; i <= n; i++){
        for(j = 1; j <= m; j++){
            if(s1[i-1] == s2[j-1]){
                dp[i][j] = dp[i-1][j-1] + 1;
            }else{
                dp[i][j] = dp[i-1][j] > dp[i][j-1] ? dp[i-1][j] : dp[i][j-1];
            }
        }
    }
    return dp[n][m];
}
int main(){

    char s1[100], s2[100];
    scanf("%s", s1);
    scanf("%s", s2);
    printf("%d\n", subsecventa_comuna(s1, s2));
    return 0;
}