#include <stdio.h>

void generateSubsets(int set[], int subset[], int n, int index, int targetSum) {
    if (index == n) {
        int sum = 0;
        int sign = 1; // 1 for addition, -1 for subtraction

        for (int i = 0; i < n; i++) {
            sum += sign * subset[i];
            sign *= -1;
        }

        if (sum == targetSum) {
            printf("{ ");
            for (int i = 0; i < n; i++) {
                printf("%d ", subset[i]);
            }
            printf("}\n");
        }

        return;
    }

    subset[index] = set[index];
    generateSubsets(set, subset, n, index + 1, targetSum);

    subset[index] = -set[index];
    generateSubsets(set, subset, n, index + 1, targetSum);
}

void findSubsetsWithTargetSum(int set[], int n, int targetSum) {
    int subset[100];
    generateSubsets(set, subset, n, 0, targetSum);
}

int main() {
    int set[] = {1, -2, 1}; // replace with your own set of numbers
    int n = sizeof(set) / sizeof(set[0]);
    int targetSum = 4; // replace with your own target sum

    findSubsetsWithTargetSum(set, n, targetSum);

    return 0;
}