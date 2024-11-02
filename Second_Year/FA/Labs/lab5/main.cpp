#include <iostream>
#include <queue>
using namespace std;

struct node {
    int key;
    node *next;
};

// in medie n / k elemente in lista
//dumb which is not really dumb
node *h[505];

node* createNode(int val) {
    node *newNode = new node;
    newNode->key = val;
    newNode->next = NULL;
}

void sink(node *h[], int index, int k) {
    // k = HeapSize, indexare de la 1, min is a index, not a value

    while(2 * index <= k) {
        int min = 2 * index;
        //find the smallest child
        if(min + 1 <= k && h[min + 1]->key < h[min]->key) {
            min++;
        }
        //swap if i find the smaller one
        if(h[min]->key < h[index]->key) {
            swap(h[min], h[index]);
            index = min;
        }
        //if i didn't find any child
        else break;
    }
}

void makeHeap(node *h[], int k) {
    for(int i = k / 2; i >= 1; i--) {
        sink(h, i, k);
    }
}

queue<int>sol;
void Kmerge_ordered_lists(node *h[], int k, int n) {
    makeHeap(h, k);
    int heapSize = k;
    while(heapSize > 0) {
        sol.push(h[1]->key);
        if(h[1]->next != NULL) {
            node *aux = h[1];
            h[1] = h[1]->next;
            free(aux);
        } else {
            node *aux = h[1];
            h[1] = h[heapSize];
            free(aux);
            heapSize--;
        }
        sink(h, 1, heapSize);
    }
}

int main()
{

    return 0;
}
