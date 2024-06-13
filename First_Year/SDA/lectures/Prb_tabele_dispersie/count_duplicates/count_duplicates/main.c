#include <stdio.h>
#include <stdlib.h>

#define size 100

typedef struct node_type {
    int key;
    int cnt;
    struct node_type* next;
} NodeT;

int hFunction(int key) {
    return key % size;
}

NodeT* createNode(int key) {
    NodeT* new_node = (NodeT*)malloc(sizeof(NodeT));
    if (!new_node)
        return NULL;
    new_node->key = key;
    new_node->cnt = 1;
    new_node->next = NULL;

    return new_node;
}

void insert(NodeT* hashtable[], int key) {
    int index = hFunction(key);
    NodeT* new_node = createNode(key);

    NodeT* tmp = hashtable[index];
    while (tmp) {
        if (tmp->key == key) {
            tmp->cnt++;
            free(new_node);
            return;
        }
        tmp = tmp->next;
    }
    new_node->next = hashtable[index];
    hashtable[index] = new_node;
}

int count_duplicates(NodeT* hashTable[]) {
    int dup = 0;
    for (int i = 0; i < size; i++) {
        NodeT* tmp = hashTable[i];
        while (tmp) {
            if (tmp->cnt > 1)
                dup++;
            tmp = tmp->next;
        }
    }
    return dup;
}

int main() {
    int arr[] = { 3, 6, 8, 3, 6, 5, 8, 9, 2, 3 };
    int arr_size = sizeof(arr) / sizeof(arr[0]);

    NodeT* hashTable[size] = { NULL };

    for (int i = 0; i < arr_size; i++) {
        insert(hashTable, arr[i]);
    }

    int cnt = count_duplicates(hashTable);
    printf("%d ", cnt);
    return 0;
}
