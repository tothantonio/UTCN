#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int* array;
    int capacity;
    int head;
    int tail;
    int size;
} QUEUE;

QUEUE* create_queue(int capacity) {
    QUEUE* queue = (QUEUE*)malloc(sizeof(QUEUE));
    if (!queue) {
        return NULL;
    }
    queue->array = (int*)malloc(capacity * sizeof(int));
    if (!queue->array) {
        free(queue);
        return NULL;
    }
    queue->capacity = capacity;
    queue->head = 0;
    queue->tail = -1;
    queue->size = 0;
    return queue;
}

void destroy_queue(QUEUE* queue) {
    if (!queue)
        return;
    free(queue->array);
    free(queue);
}

void enqueue(QUEUE* Q, int key) {

    if (!Q)
        return;
    if (!Q->array)
        return;

    if (Q->size == Q->capacity) {
        return;
    }
    Q->tail = (Q->tail + 1) % Q->capacity;
    Q->array[Q->tail] = key;
    Q->size++;
}

int dequeue(QUEUE* Q) {
    if (!Q) {
        return;
    }
    if (Q->size == 0)
        return -1;

    int val = Q->array[Q->head];
    Q->head = (Q->head + 1) % Q->capacity;
    Q->size--;
    return val;
}

void print(const QUEUE* Q) {
    if (!Q) {
        return;
    }
    if (Q->array == 0) {
        return;
    }
    for (int i = 0; i < Q->size; i++) {
        int idx = (Q->head + i) % Q->capacity;
        printf("%d ", Q->array[idx]);
    }
    printf("\n");
}

int main() {
    QUEUE* queue = create_queue(7);

    enqueue(queue, 1);
    enqueue(queue, 3);
    enqueue(queue, 5);
    enqueue(queue, 2);

    print(queue); // 1 3 5 2
    printf("\n");

    dequeue(queue);
    dequeue(queue);

    print(queue); // 5 2
    printf("\n");

    enqueue(queue, 4);
    enqueue(queue, 9);
    enqueue(queue, 2);
    enqueue(queue, 6);

    print(queue); // 5 2 4 9 2 6
    printf("\n");

    dequeue(queue);

    print(queue); // 2 4 9 2 6
    printf("\n");

    enqueue(queue, 3);
    enqueue(queue, 7);

    print(queue); // 2 4 9 2 6 3 7
    printf("\n");

    enqueue(queue, 9);  // overflow

    destroy_queue(queue);

    return 0;
}
