#include <iostream>
#include "Profiler.h"
using namespace std;

#define MAX_SIZE 10000
#define STEP_SIZE 100
#define NR_TESTS 10
#define MAX_THRESHOLD  50

Profiler profiler;

/*
 * @author Antonio-Roberto Toth
 * @group 30228
* Assignment requirements : Analysis & Comparison of Advanced Sorting Methods - HeapSort and QuickSort/QuickSelect
* QuickSort: I use the partition function and I move all the elements that are lower than my pivot in the first part of the array
*            After, I move the pivot in its correct position so that the bigger elements are in right and the lower elements are in left side
*            I recall the QuickSort function on the both parts, to get a sorted array
*            Complexity: O(nlogn) for average(random array) and best(the pivot divides the array in two nearly equal parts) and O(n^2) for worst case(the pivot is the smallest or is the largest, sorted array)
*            NOT STABLE
* HeapSort : Swap the max element(on the first pos) with the element on the last position and remakes the heap without the element on the last position
*            Repeat this until the heap contains only one element
*            O(N*logN) complexity
*            NOT STABLE
* QuickSort vs HeapSort in average case : QuickSort makes fewer assignments and comparisons than HeapSort
* QuickSelect: I use randPartition to choose a random pivot  and i move all the smaller elements in its left and the bigger elements in right
*              If the pivot arrives on the position that i am searching it means it appears on that position
*              If not, i repeat the process on the left or on the right, it depends if i am searching a smaller or bigger position
*              Complexity: O(nlogn)
* QuickSort vs QuickSort Hybrid(+ Insertion Sort): The Hybrid QuickSort does less comparisons and assignments than normal QuickSort
*                                                  The Hybrid QuickSort is much faster on Small Arrays(including Insertion Sort)
*
* Also, we used :
*   if(right <= left) {
        return;
    }
    As an exit condition, but why it isn't '==' ? Both of them have the same purpose
    But I think, if we write right == left, it means that we have only one element in the array, so the sorting algorithm would be useless, which is a good exit condition
    But it does not cover the situation if right < left, so "right <= left" is the best option
 */

struct heap {
    int array[MAX_SIZE];
    int heapSize;
    int length;
};

int parent(int i) {
    return i / 2;
}

int left(int i) {
    return 2 * i;
}

int right(int i) {
    return 2 * i + 1;
}

void heapify(heap &H, int i) {

    Operation assign = profiler.createOperation("Assign HeapSort", H.length);
    Operation compare = profiler.createOperation("Compare HeapSort", H.length);
    int l = left(i);
    int r = right(i);
    int max = i;

    if(l < H.heapSize) {
        compare.count();
        if(H.array[l] > H.array[max]) {
            max = l;
        }
    }

    if(r < H.heapSize) {
        compare.count();
        if(H.array[r] > H.array[max]) {
            max = r;
        }
    }

    if(max != i) {
        assign.count(3);
        swap(H.array[i], H.array[max]);
        heapify(H, max);
    }
}

void buildHeap(heap &H) {
    H.heapSize = H.length;
    for(int i = H.heapSize / 2; i >= 1; i--) {
        heapify(H, i);
    }
}

void heapSort(heap &H) {
    Operation assign = profiler.createOperation("Assign HeapSort", H.length);
    buildHeap(H);
    for(int i = H.heapSize - 1; i >= 1; i--) {
        assign.count(3);
        swap(H.array[0], H.array[i]);
        H.heapSize--;
        heapify(H, 0);
    }
}

int Partition(int array[], int left, int right, int pivot, int size, Operation &comp, Operation &assign) {
    assign.count(3);
    swap(array[right], array[pivot]);
    int j = left - 1;
    for(int i = left; i <= right; i++) {
        comp.count();
        if(array[i] <= array[right]) {
            j++;
            assign.count(3);
            swap(array[i], array[j]);
        }
    }
    return j;
}

void insertionSort(int array[], int size) {
    Operation assign = profiler.createOperation("Assign HybridQuickSort", size);
    Operation comp = profiler.createOperation("Compare HybridQuickSort", size);
    for(int i = 1; i < size; i ++) {
        assign.count();
        int element = array[i];
        int j = i - 1;
        comp.count();
        while(j >= 0 && array[j] > element) {
            array[j + 1] = array[j];
            assign.count();
            j--;
        }
        array[j + 1] = element;
        assign.count();
    }
}

void QuickSort(int array[], int left, int right, int size) {
    Operation comp1 = profiler.createOperation("Compare QuickSort", size);
    Operation assign1 = profiler.createOperation("Assign QuickSort", size);
    if(right <= left) {
        return;
    }
    int q = Partition(array, left, right, right, size, comp1, assign1);
    QuickSort(array, left, q - 1, size);
    QuickSort(array, q + 1, right, size);
}

void hybridQuickSort(int array[], int left, int right, int k) {
    Operation comp2 = profiler.createOperation("Compare HybridQuickSort", right - left + 1);
    Operation assign2 = profiler.createOperation("Assign HybridQuickSort", right - left + 1);
    if(right - left + 1 <= k) {
        insertionSort(array, right - left + 1);
        return;
    }
    int q = Partition(array, left, right, right, right - left + 1, comp2, assign2);
    hybridQuickSort(array, left, q - 1, k);
    hybridQuickSort(array, q + 1, right, k);
}

void bestCaseScenario(int array[], int left, int right) {
    if(right <= left) {
        return;
    }
    int mid = left + (right - left) / 2;
    bestCaseScenario(array, left, mid - 1);
    bestCaseScenario(array, mid + 1, right);
    swap(array[right], array[mid]);
}

void copy(int dest[], int source[], int n) {
    for(int i = 0; i < n; i++) {
        dest[i] = source[i];
    }
}

int randPartition(int array[], int left, int right) {
    int i = left + rand() % (right - left + 1);
    swap(array[i], array[right]);
    int j = left - 1;
    for(i = left; i <= right; i++) {
        if(array[i] <= array[right]) {
            j++;
            swap(array[i], array[j]);
        }
    }
    return j;
}

int QuickSelect(int array[], int left, int right, int i) {
    if(left == right) {
        return array[left];
    }
    int q = randPartition(array, left, right);
    int k = q - left + 1;

    if(i == k) {
        return array[q];
    } else if(i < k) {
        return QuickSelect(array, left, q - 1, i);
    } else {
        return QuickSelect(array, q + 1, right, i - k);
    }
}

void demo() {

    int array[5] = {6, 2, 4, 9, 8};
    int array2[5] = {9, 10, 1, 5, 3};
    cout << "Array1 before Sorting :";
    for(int i = 0; i < 5; i++) {
        cout << array[i] << " ";
    }
    cout << endl;
    cout << "Array2 before Sorting :";
    for(int i = 0; i < 5; i++) {
        cout << array2[i] << " ";
    }
    cout << endl;
    cout << "Array1 after hybridQuickSort: ";
    hybridQuickSort(array, 0, 4, 5);
    for(int i = 0; i < 5; i++) {
        cout << array[i] << " ";
    }
    cout << endl;
    cout << "Array2 after QuickSort: ";
    QuickSort(array2, 0, 4, 5);
    for(int i = 0; i < 5; i++) {
        cout << array2[i] << " ";
    }
    cout << endl;
    int i = 3;
    int res = QuickSelect(array, 0, 4, i);
    cout << "Al " << i << " lea cel mai mic element: " << res << endl;
}

void averageCasePerf() {
    int n, array[MAX_SIZE];
    profiler.reset("AVERAGE CASE");
    for(n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
        for(int test = 0; test < NR_TESTS; test++)
        {
            FillRandomArray(array, n);
            heap H1 = {0};
            H1.length = n;
            for(int i = 0; i < n; i++) {
                H1.array[i] = array[i];
            }
            heapSort(H1);
            QuickSort(array, 0, n - 1, n);
        }
    }

    profiler.divideValues("Compare QuickSort", NR_TESTS);
    profiler.divideValues("Assign QuickSort", NR_TESTS);
    profiler.divideValues("Compare HeapSort", NR_TESTS);
    profiler.divideValues("Assign HeapSort", NR_TESTS);

    profiler.addSeries("TOTAL QUICKSORT", "Compare QuickSort", "Assign QuickSort");
    profiler.addSeries("TOTAL HEAPSORT", "Compare HeapSort", "Assign HeapSort");

    profiler.createGroup("QuickSort vs HeapSort ASSIGN", "Assign HeapSort", "Assign QuickSort");
    profiler.createGroup("QuickSort vs HeapSort COMPARE", "Compare HeapSort", "Compare QuickSort");
    profiler.createGroup("QuickSort vs HeapSort TOTAL", "TOTAL HEAPSORT", "TOTAL QUICKSORT");
}

void bestCasePerf() {
    int n, array[MAX_SIZE];
    profiler.reset("BEST CASE");
    for(n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
        for(int test = 0; test <= NR_TESTS; test++)
        {
            FillRandomArray(array, n);
            bestCaseScenario(array, 0, n - 1);
            QuickSort(array, 0, n - 1, n);
        }
    }
    profiler.divideValues("Compare QuickSort", NR_TESTS);
    profiler.divideValues("Assign QuickSort", NR_TESTS);

    profiler.addSeries("TOTAL QUICKSORT", "Compare QuickSort", "Assign QuickSort");
    profiler.createGroup("QUICKSORT OP", "Compare QuickSort", "Assign QuickSort");
}

void worstCasePerf() {
    int n, array[MAX_SIZE];
    profiler.reset("WORST CASE");
    for(n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
            FillRandomArray(array, n, 10, 50000, false, 1);
            QuickSort(array, 0, n - 1, n);
    }

    profiler.addSeries("TOTAL QUICKSORT", "Compare QuickSort", "Assign QuickSort");
    profiler.createGroup("QUICKSORT OP", "Compare QuickSort", "Assign QuickSort");
}

void QuickVsHybridPerf() {
    profiler.reset("QuickSort vs Hybrid QuickSort");
    int array[MAX_SIZE], array2[MAX_SIZE], array3[MAX_SIZE];
    for(int n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
        for(int test = 0; test <= NR_TESTS; test++) {
            FillRandomArray(array, n);
            copy(array2, array, n);
            copy(array3, array, n);
            QuickSort(array, 0, n - 1, n);
        }
    }
    profiler.divideValues("Compare QuickSort", NR_TESTS);
    profiler.divideValues("Assign QuickSort", NR_TESTS);

    for(int n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
        for(int test = 0; test <= NR_TESTS; test++) {
            profiler.startTimer("QUICKSORT EXECUTION TIME", n);
            QuickSort(array2, 0, n - 1, n);
            profiler.stopTimer("QUICKSORT EXECUTION TIME", n);
        }
    }
    for(int n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
        for(int test = 0; test <= NR_TESTS; test++) {
            hybridQuickSort(array3, 0, n - 1, n);
        }
    }
    profiler.divideValues("Compare HybridQuickSort", NR_TESTS);
    profiler.divideValues("Assign HybridQuickSort", NR_TESTS);

    profiler.createGroup("QUICKSORT VS HYBRID ASSIGN", "Assign QuickSort", "Assign HybridQuickSort");
    profiler.createGroup("QUICKSORT VS HYBRID COMPARE", "Compare QuickSort", "Compare HybridQuickSort");
}
int main()
{
    demo();
    //averageCasePerf();
    //bestCasePerf();
    //worstCasePerf();
    //QuickVsHybridPerf();
    //profiler.showReport();
    return 0;
}