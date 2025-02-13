#include <stdio.h>
#include <stdlib.h>

int solNb=0; /* solution number */

int best_sol_nb = 1000;
int best_sol[1000];

enum { FALSE, TRUE };

int is_a_solution(int change) {
    return (change == 0); /* is a solution when change is 0 */
}

void backtrack(int a[], int k, int n, int change, int values[]) {
    int c[2]; /* candidates for next position */
    int ncandidates; /* next position candidate count */
    int i;

    if(k == n) /* all the coins were explored! */
        return;

    int current_coins = 0;
    for(int i = 0; i <= k; i++){
        if(a[i] == 1)
        {
            current_coins ++;
        }
    }
    if (is_a_solution(change)) {
        printf("Found solution %d:\n", ++solNb);
        //must process solution
        int used_coins = 0;
        for(int i=0; i<n; i++){
            if(a[i] == 1)
                used_coins++;
            printf("%d ", a[i]*values[i]);
        }
        if(used_coins < best_sol_nb){
            best_sol_nb = used_coins;
            memcpy(best_sol, a, sizeof(int) * n);
        }
        printf("\n");
    }
    else if(change > 0 && current_coins < best_sol_nb -1){
        k = k + 1;
        a[k] = 1;
        backtrack(a,k,n,change-values[k], values);
        a[k] = 0;
        backtrack(a,k,n,change, values);
    }
}

int main() {
    int n, change;
    int* values = NULL;
    int* a = NULL;
    printf("Number of coins=");
    scanf( "%d", &n );
    printf("Change to be returned=");
    scanf( "%d", &change );
    printf("Input coin values:\n");
    values = (int*)malloc(n*sizeof(int));
    a=(int*)malloc(n*sizeof(int));
    for(int i=0; i<n; i++)  {
        a[i] = values[i] = 0;
    }
    for(int i=0; i<n; i++)
        scanf("%d", values+i);

    backtrack(a, -1, n, change, values);

    printf("best solution:\n");
    for(int i = 0; i < n; i++){
        printf("%d ", best_sol[i] * values[i]);
    }
    printf( "\nEnd.\n" );
    return 0;
}

