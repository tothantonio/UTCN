#include <stdio.h>
#include <stdlib.h>

int main(){
    int n;
    scanf("%d", &n);

    int* a = (int*)malloc(n * sizeof(int));

    for(int i = 0; i < n; i++)
        scanf("%d", &a[i]);
    
    int sum_max = 0;
    for(int i = 0; i < n; i++) {
        int current_sum = 0;
        for(int j = i; j < n; j++) {
            current_sum += a[j];
            if(current_sum % n == 0 && current_sum > sum_max) {
                sum_max = current_sum;
            }
        }
    }
    printf("The maximum sum divisible by %d is: %d\n", n, sum_max);
    return 0;
}