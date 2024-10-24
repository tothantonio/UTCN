#include <iostream>

using namespace std;
void swim(int A[], int n, int index) {
    while(index > 1 && A[index] < A[index / 2]) {
        swap(A[index], A[index / 2]);
        index = index / 2;
    }
}

void makeHeapSwim(int A[], int n) {
    for(int i = 2; i <= n; i++) {
        swim(A, n, i);
    }
}

void sink(int A[], int n, int index) {
    while(2 * index < n) { // sa nu ajung la frunze
        int ind_child = 2 * index;
        //find the smallest child
        if(ind_child + 1 <= n && A[ind_child + 1] < A[ind_child]) {
            ind_child++;
        }
        //swap if i found the smaller one
        if(A[ind_child] < A[index]) {
            swap(A[ind_child], A[index]);
            index = ind_child;
        }
        //daca n am gasit nici un copil, ies
        else break;
    }
}

void makeHeapSink(int A[], int n) {
}

void heapSort(int A[], int n) {
    //in this function i only print
    //i do not save in other array
    while(n > 1){
        cout << A[1];
        swap(A[1], A[n]);
        n--;
        sink(A, n, 1);
    }
    cout << A[1] << " ";
}
int main() {

    int array[] = {4, 9, 3, 5, 2};
    int n = sizeof(array) / sizeof(array[0]);

    cout << "Array before makeHeapSwim: ";
    for(int i = 0; i < n; i++) {
        cout << array[i] << " ";
    }
    cout << endl;

    cout << "Array after makeHeapSwim: ";
    makeHeapSwim(array, n);
    for(int i = 0; i < n; i++) {
        cout << array[i] << " ";
    }
    cout << endl;

    heapSort(array, n);
    return 0;
}
