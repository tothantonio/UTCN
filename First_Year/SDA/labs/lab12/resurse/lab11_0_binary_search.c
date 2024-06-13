#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define NDEBUG

int binary_search(int *a, int p, int q, int k) {
    if(p > q)
        return -1;
    int m = (p + q) / 2;
    if(a[m] == k)
        return m;
    if(a[m] < k)
        return binary_search(a, m+1, q, k);
    return binary_search(a, p, m-1, k);
}

int main() {
    int numbers[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    int to_be_found[] = {20, 5, 7, 13};
    int expected[] = {-1, 4, 6, -1};

    int n = (int) (sizeof(numbers) / sizeof(int));
    int test_count = (int) (sizeof(to_be_found) / sizeof(int));
    for (int i = 0; i < test_count; i++) {
        assert(binary_search(numbers, 0, n-1, to_be_found[i]) == expected[i]);
    }
    return 0;
}