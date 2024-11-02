#include <iostream>
#include <queue>
#include "Profiler.h"
Profiler profiler("merge k lists");
using namespace std;

#define MAX_SIZE 10000
#define STEP_SIZE 100
#define STEP_SIZE_K 10
#define MAX_SIZE_K 500
#define NR_TESTS 5

/*
 * @author Antonio-Roberto Toth
 * @group 30228
 * Assignment requirements: Merge k Ordered Lists Efficiently
 * I implemented createNode, insertFirst, createList, generateLists
 * minHeap, where I put the smallest element from every list, so in the root, there will always be the min from these values
 * in generateLists I put n / k elements in lists, and in the last one I put the remaining elements
 * To merge k lists I use minHeap and I add in the list the smallest elements from the heap, resulting a sorted list
 * When an element is removed from heap, its next element from the same linked list is added to heap, maintaining the order(sink)
 * I repeat until heapSize = 0
 * Complexity: O(nlogk)
 * For k1 = 5, k2 = 10, k3 = 100 and 100 <= n < 10000 for k1, the operation number increases with the number of lists
 * OP(k1) < OP(k2) < OP(k3), where OP = number of operations
 *
 * For n = 10000 and 5 <= k <= 500, the OP is small when k is small, but for big values the difference is not that big
 */

struct node {
    int key;
    node *next;
};

node* h[505];

node* createNode(int val) {
    node *newNode = new node;
    newNode->key = val;
    newNode->next = nullptr;
    return newNode;
}

void insertFirst(node *&head, int val) {
    node *newNode = createNode(val);
    newNode->next = head;
    head = newNode;
}

node* createList(int array[], int n) {
    node *head = nullptr;
    for(int i = 0; i < n; i++) {
        insertFirst(head, array[i]);
    }
    return head;
}

void generateLists(node* lists[], int k, int n) {
    int size = 0, sum = 0;
    int array[MAX_SIZE] = {0};
    for(int i = 1; i <= k; i++) {
        if(i == k) {
            size = n - sum;
        } else {
            size = n / k;
            sum += size;
        }
        FillRandomArray(array, size, 10, 50000, false, 2);
        lists[i] = createList(array, size);
    }
}

void print(node* head) {
    for(node* p = head; p != nullptr; p = p->next) {
        cout << p->key << " ";
    }
    cout << endl;
}

void printLists(node* lists[], int k) {
    for(int i = 1; i <= k; i++) {
        cout << "K" << i << ": ";
        print(lists[i]);
    }
}

void sink(node *h[], int index, int k, const int n, const string sK) {
    string aux = "Operations " + sK;
    const char *s = aux.c_str();
    Operation op = profiler.createOperation(s, n);

    while(2 * index <= k) {
        int min = 2 * index;
        op.count(1);
        if(min + 1 <= k && h[min + 1]->key < h[min]->key) {
            min++;
        }
        op.count();
        if(h[min]->key < h[index]->key) {
            swap(h[min], h[index]);
            op.count(3);
            index = min;
        } else break;
    }
}

void makeHeap(node *h[], int k, const int n, const string sK) {
    for(int i = k / 2; i >= 1; i--) {
        sink(h, i, k, n, sK);
    }
}

queue<int> sol;

void Kmerge_ordered_lists(node *h[], int k, int n, const string sK) {
    string aux = "Operations " + sK;
    const char *s = aux.c_str();
    Operation op = profiler.createOperation(s, n);

    makeHeap(h, k, n, sK);
    int heapSize = k;
    while(heapSize > 0) {
        op.count();
        sol.push(h[1]->key);
        if(h[1]->next != nullptr) {
            node *aux = h[1];
            h[1] = h[1]->next;
            free(aux);
            op.count(2);
        } else {
            node *aux = h[1];
            h[1] = h[heapSize];
            free(aux);
            heapSize--;
            op.count(2);
        }
        sink(h, 1, heapSize, n, sK);
    }
}
void demo() {
    int k = 4, n = 20;
    for(int i = 0; i < 505; i++) {
        h[i] = nullptr;
    }
    generateLists(h, k, n);
    printLists(h, k);

    Kmerge_ordered_lists(h, k, n, "demo");
    cout << "\nSorted output:\n";
    while(!sol.empty()) {
        cout << sol.front() << " ";
        sol.pop();
    }
cout << endl;
}

void perf() {
    int ki[3] = {5, 10, 100};
    node *h[MAX_SIZE];

    for(int i = 0; i < MAX_SIZE; i++) {
        h[i] = nullptr;
    }

    for(int i = 0; i < 3; i++) {
        string sK = "k" + to_string(i + 1);
        for(int n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
            for(int test = 0; test < NR_TESTS; test++) {
                generateLists(h, ki[i], n);
                Kmerge_ordered_lists(h, ki[i], n, sK);
            }
        }
    }

    for(int i = 0; i < 3; i++) {
        const char *sK = ("Operations k" + to_string(i + 1)).c_str();
        profiler.divideValues(sK, NR_TESTS);
    }
    profiler.createGroup("Operations for k1 = 5, k2 = 10, k3 = 100", "Operations k1", "Operations k2", "Operations k3");

    for(int i = 0; i < MAX_SIZE; i++) {
        h[i] = nullptr;
    }
    string sK = "n = 10000";
    for(int k = STEP_SIZE_K; k <= MAX_SIZE_K; k += STEP_SIZE_K) {
        int n = MAX_SIZE;
        for(int test = 0; test < NR_TESTS; test++) {
            generateLists(h, k, n);
            Kmerge_ordered_lists(h, k, k, sK);
        }
    }
    profiler.divideValues("Operations n = 10000", NR_TESTS);
}

int main()
{
    //demo();
    perf();
    profiler.showReport();
    return 0;
}
