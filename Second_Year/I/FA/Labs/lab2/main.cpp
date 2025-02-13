#include <iostream>
#include "Profiler.h"

using namespace std;
Profiler profiler;

void insertionSort(int A[], int n) {

    Operation cmp = profiler.createOperation("ins_cmp", n);
    Operation as = profiler.createOperation("as", n);
    for (int i = 1; i < n; i++) {
        as.count();
        int var = A[i];
        for(int j = i - 1; j >= 0; j--) {
            as.count();
            cmp.count();
            if(var < A[j]) {
                A[j + 1] = A[j];
            } else {
                A[j + 1] = var;
                break;
            }
        }
    }
}

void bubbleSort(int A[], int n) {
    Operation cmp = profiler.createOperation("bs_cmp", n);
    Operation as = profiler.createOperation("as", n);

    int ok;
    do {
        ok = 0;
        for(int i = 0; i < n; i++) {
            cmp.count();
            if(A[i] < A[i + 1]) {
                as.count(3);
                swap(A[i], A[i + 1]);
                ok = 1;
            }
        }
    } while(ok);
}

void selectionSort(int A[], int n) {
    Operation cmp = profiler.createOperation("s_cmp", n);
    Operation as = profiler.createOperation("as", n);
    for(int i = 0; i < n; i++) {
        int pos = i;
        for(int j = i + 1; j < n; j++) {
            cmp.count();
            if(A[j] < A[pos]) {
                pos = j;
            }
        }
        if(i != pos) {
            as.count(3);
            swap(A[i], A[pos]);
        }
    }
}
//sa stii trasa algo, best case, worst, fa grafice smooth
//fa binary insertion sort
int main() {

    int A[10000];
    for(int n = 100; n <= 10000; n += 100)
    {
        FillRandomArray(A, n, -5000, 5000, false, 0);
        insertionSort(A, n);
    }

    profiler.divideValues("ins_cmp", 15);
    profiler.divideValues("as", 15);
    profiler.addSeries("insertionSort", "ins_cmp", "as");
    profiler.showReport();
    return 0;
}
