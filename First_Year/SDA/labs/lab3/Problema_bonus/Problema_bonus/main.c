#include <stdio.h>
#include <stdlib.h>

#define CAPACITY 4

typedef struct {
    int data[CAPACITY];
    int head;
    int tail;
} CircularQ;

// Funcție pentru inițializare
void init(CircularQ* Q) {
    Q->head = -1;
    Q->tail = -1;
    for (int i = 0; i < CAPACITY; i++)
        Q->data[i] = 0;
}

// Funcție pentru adăugarea unui element în coadă
void enqueue(CircularQ* Q, int val) {
    if ((Q->tail + 1) % CAPACITY == Q->head) {
        printf("Overflow\n");
        return;
    }
    if (Q->head == -1)
        Q->head = 0;

    Q->tail = (Q->tail + 1) % CAPACITY;
    Q->data[Q->tail] = val;
}

// Funcție pentru eliminarea unui element din coadă 
int dequeue(CircularQ* Q) {

    int value = Q->data[Q->head];

    if (Q->head == -1 && Q->tail == -1) {
        return -1;
    }
    else {
        Q->head = (Q->head + 1) % CAPACITY;
    }
    return value;
}

// Funcție pentru afișare
void print_queue(CircularQ* Q) {
    if (Q->head == -1 && Q->tail == -1)
        return;

    for (int i = Q->head; i != Q->tail; i = (i + 1) % CAPACITY) {
        printf("%d ", Q->data[i]);
    }
    printf("%d\n", Q->data[Q->tail]);
}

int main() {
    CircularQ Q;
    init(&Q);

    enqueue(&Q, 10);
    enqueue(&Q, 20);
    enqueue(&Q, 30);
    enqueue(&Q, 40);


    print_queue(&Q);

    enqueue(&Q, 50);

    printf("Elementul eliminat: %d\n", dequeue(&Q));
    printf("Elementul eliminat: %d\n", dequeue(&Q));

    print_queue(&Q);

    enqueue(&Q, 50);
    enqueue(&Q, 60);
    print_queue(&Q);
    enqueue(&Q, 70);


    return 0;
}
