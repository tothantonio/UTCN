#include <iostream>
#include "Profiler.h"

#define MAX_SIZE 10000
#define START_SIZE 100
#define INCREMENT_SIZE 200

Profiler profiler("directSortingAlgorithms");
using namespace std;

/*
 * @author Antonio-Roberto Toth
 * @group 30228
 * Assignment requirements : Compare the three direct sorting algorithms
 * (selection sort, insertion sort and bubble sort) on average case, best case and worst case
 * As a bonus I implemented the Binary Insertion Sort

 * The BEST CASE is when the array is already sorted.
 * The AVERAGE CASE is when the array is filled with random numbers.
 * The WORST CASE is when the array is sorted in reverse order.

 * Insertion Sort is the best, followed by Selection Sort and Bubble Sort.
 * The Binary Insertion Sort is better than Insertion Sort because it uses binary search to find the proper position, instead of a linear search.
 */

void selectionSort(int array[], int size) {
    Operation assing = profiler.createOperation("Selection_Assignment", size);
    Operation compare = profiler.createOperation("Selection_Compare", size);
    for(int i = 0; i < size - 1; i++) {
        int min = i;
        for(int j = i + 1; j < size; j++) {
            compare.count();
            if(array[j] < array[min]) {
                min = j;
            }
        }
        if(min != i) {
            swap(array[min], array[i]);
            assing.count(3);
        }
    }
}

void insertionSort(int array[], int size) {
    Operation assign = profiler.createOperation("Insertion_Assignment", size);
    Operation compare = profiler.createOperation("Insertion_Compare", size);
    for(int i = 1; i < size; i++) {
        assign.count();
        int element = array[i];
        int j = i - 1;
        compare.count();
        while(j >= 0 && array[j] > element) {
            array[j + 1] = array[j];
            assign.count();
            j--;
        }
        array[j + 1] = element;
        assign.count(1);
    }
}

void bubbleSort(int array[], int size) {
    Operation assing = profiler.createOperation("Bubble_Assignment", size);
    Operation compare = profiler.createOperation("Bubble_Compare", size);
    int ok = 0;
    do {
        ok = 0;
        for(int i = 0; i < size - 1; i++) {
            compare.count();
            if(array[i] > array[i + 1]) {
                assing.count(3);
                swap(array[i], array[i + 1]);
                ok = 1;
            }
        }
    }while(ok);
}

void binaryInsertionSort(int array[], int size) {
    for(int i = 1; i < size; i++) {
        int element = array[i];
        int left = 0;
        int right = i - 1;
        while(left <= right) {
            int mid = left + (right - left) / 2;
            if(array[mid] > element) {
                right = mid - 1;
            }
            else {
                left = mid + 1;
            }
        }
        for(int j = i - 1; j >= left; j--) {
            array[j + 1] = array[j];
        }
        array[left] = element;
    }
}

void print(int array[], int size) {
    for(int i = 0; i < size; i++) {
        cout << array[i] << " ";
    }
    cout << endl;
}

void testBinaryInsertionSort(int array[], int size) {
    FillRandomArray(array, size, 10, 50000, false);
    print(array, size);
    binaryInsertionSort(array, size);
    print(array, size);
}

void profilerReport(const char* compareName, const char* assignName, const char* sortName) {
    profiler.divideValues("Selection_Compare", 5);
    profiler.divideValues("Selection_Assignment", 5);
    profiler.addSeries("Selection_Sort", "Selection_Assignment", "Selection_Compare");

    profiler.divideValues("Bubble_Assignment", 5);
    profiler.divideValues("Bubble_Compare", 5);
    profiler.addSeries("Bubble_Sort", "Bubble_Assignment", "Bubble_Compare");

    profiler.divideValues("Insertion_Assignment", 5);
    profiler.divideValues("Insertion_Compare", 5);
    profiler.addSeries("Insertion_Sort", "Insertion_Assignment", "Insertion_Compare");

    profiler.createGroup(compareName, "Selection_Compare", "Bubble_Compare", "Insertion_Compare");
    profiler.createGroup(assignName, "Selection_Assignment", "Bubble_Assignment", "Insertion_Assignment");
    profiler.createGroup(sortName, "Selection_Sort", "Bubble_Sort", "Insertion_Sort");
}

void averageCaseSortReport() {
    int arraySelectionSort[MAX_SIZE];
    int arrayBubbleSort[MAX_SIZE];
    int arrayInsertionSort[MAX_SIZE];

    for(int i = START_SIZE; i <= MAX_SIZE; i += INCREMENT_SIZE) {
        for(int m = 0; m < 5; m++) {
            FillRandomArray(arraySelectionSort, i, 10, 10000);
            selectionSort(arraySelectionSort, i);
            FillRandomArray(arrayBubbleSort, i, 10, 10000);
            bubbleSort(arrayBubbleSort, i);
            FillRandomArray(arrayInsertionSort, i, 10, 10000);
            insertionSort(arrayInsertionSort, i);
        }
    }
    profilerReport("AVERAGE CASE COMPARE", "AVERAGE CASE ASSIGN", "AVERAGE CASE SORT");
}

void bestCaseSortReport() {
    int arraySelectionSort[MAX_SIZE];
    int arrayBubbleSort[MAX_SIZE];
    int arrayInsertionSort[MAX_SIZE];

    for(int i = START_SIZE; i <= MAX_SIZE; i += INCREMENT_SIZE) {
        FillRandomArray(arraySelectionSort, i, 10, 10000, false, 1);
        selectionSort(arraySelectionSort, i);
        FillRandomArray(arrayBubbleSort, i, 10, 10000, false, 1);
        bubbleSort(arrayBubbleSort, i);
        FillRandomArray(arrayInsertionSort, i, 10, 10000, false, 1);
        insertionSort(arrayInsertionSort, i);
    }
    profilerReport("BEST CASE COMPARE", "BEST CASE ASSIGN", "BEST CASE SORT");
}

void worstCaseSortReport() {
    int arraySelectionSort[MAX_SIZE];
    int arrayBubbleSort[MAX_SIZE];
    int arrayInsertionSort[MAX_SIZE];

    for(int i = START_SIZE; i <= MAX_SIZE; i += INCREMENT_SIZE) {
        FillRandomArray(arraySelectionSort, i, 10, 10000, false, 2);
        selectionSort(arraySelectionSort, i);
        FillRandomArray(arrayBubbleSort, i, 10, 10000, false, 2);
        bubbleSort(arrayBubbleSort, i);
        FillRandomArray(arrayInsertionSort, i, 10, 10000, false, 2);
        insertionSort(arrayInsertionSort, i);
    }
    profilerReport("WORST CASE COMPARE", "WORST CASE ASSIGN", "WORST CASE SORT");
}
int main()
{
    //int array[MAX_SIZE];
    //int size = 10;
    //testBinaryInsertionSort(array, size);

    profiler.reset("AVERAGE CASE");
    averageCaseSortReport();
    profiler.reset("BEST CASE");
    bestCaseSortReport();
    profiler.reset("WORST CASE");
    worstCaseSortReport();

    profiler.showReport();
    return 0;
}
