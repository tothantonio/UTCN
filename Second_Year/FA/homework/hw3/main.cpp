#include <iostream>
using namespace std;
#include "Profiler.h"

Profiler profiler;

#define MAX_SIZE 10000
#define STEP_SIZE 100
#define NR_TESTS 5


int Partition(int array[], int left, int right, int pivot) {
    swap(array[right], array[pivot]);
    int j = left - 1;
    for(int i = left; i <= right; i++) {
        if(array[i] <= array[right]) {
            j++;
            swap(array[i], array[j]);
        }
    }
    return j;
}

void QuickSort(int array[], int left, int right) {
    if(right <= left) {
        return;
    }
    int q = Partition(array, left, right, right);
    QuickSort(array, left, q - 1);
    QuickSort(array, q + 1, right);
}

void demo() {
    int array[5] = {3, 5, 9, 1, 2};
    cout << "Array before sorting: " << endl;
    for(int i = 0; i < 5; i++) {
        cout << array[i] << " ";
    }
    cout << endl;

    cout << "Array after sorting: " << endl;
    QuickSort(array, 0, 4);
    for(int i = 0; i < 5; i++) {
        cout << array[i] << " ";
    }
    cout << endl;
}

void perf() {
    int array[MAX_SIZE];
    int n;

    for(int n = STEP_SIZE; n < MAX_SIZE; n += STEP_SIZE) {
        for(int test = 0; test < NR_TESTS; test++) {

        }
    }
}

int main()
{
    demo();
    return 0;
}
