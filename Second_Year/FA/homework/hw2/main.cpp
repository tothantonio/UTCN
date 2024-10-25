#include <iostream>
#include "Profiler.h"

#define MAX_SIZE 10000
#define STEP_SIZE 100
#define NR_TESTS 5

struct heap {
    int length;
    int heapSize;
    int array[MAX_SIZE];
};

Profiler profiler;
using namespace std;
/*
 * @author Antonio-Roberto Toth
 * @group 30228
* Assignment requirements : Analysis & Comparison of Bottom-up and Top-down Build Heap Approaches + Comparative analysis of one of the sorting algorithms from L1 in iterative vs recursive version (I chose bubbleSort)
* I implemented build heap bottom-up with heapify function, heapsort and build heap top-down using push heap
* Heapify : For a given element, checks if it's bigger than his left or right child
*           Then, if one of them is bigger, it swaps and makes heapify again until the element is in the correct position
*           If both children are equal, we choose the bigger one
*           O(logN) complexity
* Build-Heap bottom-up : Starts from the first nodes that are not leaves and apply heapify
*                        O(N) complexity
* Push Heap : inserts the given element, on the last position in heap, and then it swims up, until it is on the correct position that respects heapify
*             O(logN) complexity
* Build-Heap top-down : calls the Push Heap function for every element that we want to add in heap
*             O(N*logN) complexity
* HeapSort : Swap the max element(on the first pos) with the element on the last position and remakes the heap without the element on the last position
*            Repeat this until the heap contains only one element
*            O(N*logN) complexity
*            NOT STABLE
* Average Case : bottom up make less comparisons and assignments than top-down
* Worst Case : bottom up make less comparisons and assignments than top-down
*
* Bubble Sort Iterative vs Recursive:
* Iterative likely to perform in practice, because there is no overhead with the recursion
* Best Case : O(N), Average and Worst : O(N^2)
* BOTH ARE STABLE
* Recursive is less efficient due to recursive overhead
 */

void bubbleSort(int array[], int size) {
    Operation assign = profiler.createOperation("bubbleSort-attr", size);
    Operation compare = profiler.createOperation("bubbleSort-comp", size);
    int ok = 0;
    do {
        ok = 0;
        for(int i = 0; i < size - 1; i++) {
            compare.count();
            if(array[i] > array[i + 1]) {
                assign.count(3);
                swap(array[i], array[i + 1]);
                ok = 1;
            }
        }
    }while(ok);
}

void bubbleSortRec(int array[], int size) {
    Operation assign = profiler.createOperation("recBubbleSort-attr", size);
    Operation compare = profiler.createOperation("recBubbleSort-comp", size);

    compare.count();
    if(size == 1)
        return;

    int ok = 0;
    for(int i = 0; i < size - 1; i++) {
        compare.count();
        if(array[i] > array[i + 1]) {
            assign.count(3);
            swap(array[i], array[i + 1]);
            ok = 1;
        }
    }
    compare.count();
    if(ok == 0) return;

    bubbleSortRec(array, size - 1);
}

void print(heap H) {
    for(int i = 0; i < H.length; i++) {
        cout << H.array[i] << " ";
    }
    cout << endl;
}

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

    Operation assign = profiler.createOperation("Build Heap Assignments", H.length);
    Operation compare = profiler.createOperation("Build Heap Compare", H.length);

    int l = left(i);
    int r = right(i);
    int max = i;

    if(l < H.heapSize) {
        compare.count();
        if(H.array[l] > H.array[i]) {
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

void buildHeapBottomUp(heap &H) {

    Operation assign = profiler.createOperation("Build Heap Assignments", H.length);
    assign.count();
    H.heapSize = H.length;
    for(int i = H.heapSize / 2 ; i > 0; i--) {
        heapify(H, i);
    }
}

void pushHeap(heap &H, int key) {

    Operation assign = profiler.createOperation("Push Heap Assignments", H.length);
    Operation compare = profiler.createOperation("Push Heap Compare", H.length);
    if(H.heapSize == H.length) {
        cout << "Can not insert elements" << endl;
        return;
    }

    assign.count(2);
    H.heapSize++;
    H.array[H.heapSize - 1] = key;

    int i = H.heapSize - 1;

    while(i > 0) {
        compare.count();
        if(H.array[parent(i)] < H.array[i]) {
            assign.count(3);
            swap(H.array[i], H.array[parent(i)]);
            i = parent(i);
        }
        else break;
    }
}

void buildHeapTopDown(heap &H, int array[]) {
    for(int i = 0; i < H.length; i++) {
        pushHeap(H, array[i]);
    }
}
void heapSort(heap &H) {
    buildHeapBottomUp(H);
    for(int i = H.length - 1; i >= 1; i--) {
        swap(H.array[0], H.array[i]);
        H.heapSize--;
        heapify(H, 0);
    }
}

void demo() {

    int array1[4] = {4, 3, 5, 1};

    cout << "Array before sorting" << endl;
    for(int i = 0; i < 4; i++) {
        cout << array1[i] << " ";
    }
    cout << endl;

    bubbleSortRec(array1, 4);
    cout << "Array after sorting" << endl;
    for(int i = 0; i < 4; i++) {
        cout << array1[i] << " ";
    }
    cout << endl;
    int array[] = {8, 1, 2, 3, 7, 4, 0};
    int size = sizeof(array) / sizeof(array[0]);

    heap H1 = {0};
    H1.length = size;
    for(int i = 0; i < size; i++) {
        H1.array[i] = array[i];
    }

    cout << "Array: " << endl;
    print(H1);

    buildHeapBottomUp(H1);
    cout << "Heap Bottom Up" << endl;
    print(H1);

    heap H2 = {0};
    H2.length = size;
    buildHeapTopDown(H2, array);
    cout << "Heap Top Down" << endl;
    print(H2);

    heapSort(H1);
    cout << "Heap Sort" << endl;
    print(H1);
}

void profilerBubbleSort() {
    profiler.reset("Bubble Sort");
    int array1[MAX_SIZE];
    int array2[MAX_SIZE];
    for(int i = STEP_SIZE; i < MAX_SIZE; i += STEP_SIZE) {
        for(int test = 0; test < NR_TESTS; test++) {
            FillRandomArray(array1, i, 10, 10000);
            bubbleSort(array1, i);
            FillRandomArray(array2, i, 10, 10000);
            bubbleSortRec(array2, i);
        }
    }

    for(int i = STEP_SIZE; i < MAX_SIZE; i += STEP_SIZE) {
        for(int test = 0; test < NR_TESTS; test++) {
            FillRandomArray(array1, i, 10, 10000);
            profiler.startTimer("ITERATIVE BUBBLE SORT", i);
            bubbleSort(array1, i);
            profiler.stopTimer("ITERATIVE BUBBLE SORT", i);

            FillRandomArray(array2, i, 10, 10000);
            profiler.startTimer("RECURSIVE BUBBLE SORT", i);
            bubbleSortRec(array2, i);
            profiler.stopTimer("RECURSIVE BUBBLE SORT", i);
        }
    }
    profiler.divideValues("bubbleSort-attr", NR_TESTS);
    profiler.divideValues("bubbleSort-comp", NR_TESTS);

    profiler.divideValues("recBubbleSort-attr", NR_TESTS);
    profiler.divideValues("recBubbleSort-comp", NR_TESTS);

    profiler.createGroup("ITERATIVE BUBBLE SORT OP", "bubbleSort-attr", "bubbleSort-comp");
    profiler.createGroup("RECURSIVE BUBBLE SORT OP", "recBubbleSort-attr", "recBubbleSort-comp");
    profiler.createGroup("TIME COMPARISON", "ITERATIVE BUBBLE SORT", "RECURSIVE BUBBLE SORT");
}
void profilerHeap() {
    profiler.reset("HEAP");
    int n;
    int array[MAX_SIZE];

    for(n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
        for(int test = 0; test < NR_TESTS; test++) {
            FillRandomArray(array, n);

            heap H1 = {0};
            H1.length = n;
            for(int i = 0; i < n; i++) {
                H1.array[i] = array[i];
            }
            buildHeapBottomUp(H1);

            heap H2 = {0};
            H2.length = n;
            buildHeapTopDown(H2, array);
        }
    }

    profiler.divideValues("Build Heap Compare", NR_TESTS);
    profiler.divideValues("Build Heap Assignments", NR_TESTS);
    profiler.divideValues("Push Heap Compare", NR_TESTS);
    profiler.divideValues("Push Heap Assignments", NR_TESTS);

    profiler.addSeries("TOTAL BUILD HEAP", "Build Heap Compare", "Build Heap Assignments");
    profiler.addSeries("TOTAL PUSH HEAP", "Push Heap Compare", "Push Heap Assignments");

    profiler.createGroup("AVERAGE COMPARISONS", "Build Heap Compare", "Push Heap Compare");
    profiler.createGroup("AVERAGE ASSIGNMENTS", "Build Heap Assignments", "Push Heap Assignments");
    profiler.createGroup("AVERAGE TOTAL", "TOTAL BUILD HEAP", "TOTAL PUSH HEAP");


    for(n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
        FillRandomArray(array, n, 10, 50000, false, 2);

        heap H1 = {0};
        H1.length = n;
        for(int i = 0; i < n; i++) {
            H1.array[i] = array[i];
        }
        buildHeapBottomUp(H1);

        heap H2 = {0};
        H2.length = n;
        buildHeapTopDown(H2, array);
    }


    profiler.addSeries("TOTAL BUILD HEAP", "Build Heap Compare", "Build Heap Assignments");
    profiler.addSeries("TOTAL PUSH HEAP", "Push Heap Compare", "Push Heap Assignments");

    profiler.createGroup("WORST COMPARISONS", "Build Heap Compare", "Push Heap Compare");
    profiler.createGroup("WORST ASSIGNMENTS", "Build Heap Assignments", "Push Heap Assignments");
    profiler.createGroup("WORST TOTAL", "TOTAL BUILD HEAP", "TOTAL PUSH HEAP");
}

int main()
{
    demo();
    //profilerHeap();
    //profilerBubbleSort();
    //profiler.showReport();
    return 0;
}
