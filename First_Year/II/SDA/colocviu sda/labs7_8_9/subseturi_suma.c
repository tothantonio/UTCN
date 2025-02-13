#include <stdio.h>

void generateSubsets(int arr[], int subset[], int n, int sum, int index, int subsetSum) {
    if (subsetSum == sum) {
        printf("{ ");
        for (int i = 0; i < index; i++) {
            printf("%d ", subset[i]);
        }
        printf("}\n");
    }

    if (index == n) {
        return;
    }

    for (int i = index; i < n; i++) {
        int isDuplicate = 0;
        for (int j = 0; j < index; j++) {
            if (arr[i] == subset[j]) {
                isDuplicate = 1;
                break;
            }
        }
        if (isDuplicate) {
            continue; 
        }

        subset[index] = arr[i];
        generateSubsets(arr, subset, n, sum, index + 1, subsetSum + arr[i]);
    }
}

void findSubsetsWithSum(int arr[], int n, int sum) {
    int subset[20];
    generateSubsets(arr, subset, n, sum, 0, 0);
}

int main() {
    int arr[] = {1, -3, 5, -7, 2, 6};
    int n = sizeof(arr) / sizeof(arr[0]);
    int sum = 6;

    findSubsetsWithSum(arr, n, sum);

    return 0;
}