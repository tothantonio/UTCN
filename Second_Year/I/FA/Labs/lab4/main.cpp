#include <iostream>

using namespace std;

int Partition(int array[], int left, int right, int pivot) {
    swap(array[right], array[pivot]);
    int j = left - 1;
    for(int i = left; i <= right; i++) {
        if(array[i] <= array[right]) {
            j++;
            swap(array[i], array[j]);
            // practic numar cate elem am in stanga pivotului
            // returnez j
        }
    }
    return j;
}

// de ce nu pot pune ==?
// o sa accesez o memorie dif
//incearca best case pt pivot in dreapta

void QuickSort(int array[], int left, int right) {
    if(right <= left) {
        return;
    }

    int q = Partition(array, left, right, right);
    QuickSort(array, left, q - 1);
    QuickSort(array, q + 1, right);
}

void demo() {
    int array[] = {3, 4, 6, 1, 2};
    QuickSort(array, 0, 5);
    for(int i = 0; i < 5; i++) {
        cout << array[i] << " ";
    }
    cout << endl;
}

int main() {
    demo();
    return 0;
}
