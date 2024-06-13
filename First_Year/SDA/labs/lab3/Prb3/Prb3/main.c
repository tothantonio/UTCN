#include <stdio.h>
#include <stdlib.h>

typedef struct {
	int* arr;
	int capacity, head, tail, size;
}DEQUE;

#define MAX_SIZE 100

DEQUE* create_DEQUE(int capacity) {
	DEQUE* deque = (DEQUE*)malloc(sizeof(DEQUE));
	if (!deque)
		return NULL;
	
	deque->arr = (int*)malloc(sizeof(int));
	if (!deque->arr)
		return NULL;
	deque->capacity = capacity;
	deque->head = -1;
	deque->tail = 0;
	deque->size = 0;
	return deque;
}

void insert_first(DEQUE* deque, int key) {
	if (deque->size == deque->capacity)
		return;
	if (deque->head == -1)
		deque->head = deque->tail = 0;
	else
		deque->head = (deque->head - 1 + deque->capacity) % deque->capacity;
	deque->arr[deque->head] = key;
	deque->size++;
}

void insert_last(DEQUE* deque, int key) {
	if (deque->size == deque->capacity)
		return;
	if (deque->head == -1)
		deque->head = deque->tail = 0;
	else
		deque->tail = (deque->tail + 1) % deque->capacity;
	deque->arr[deque->tail] = key;
	deque->size++;
}

int delete_first(DEQUE* deque) {
	if (deque->size == 0)
		return -1;
	int val = deque->arr[deque->head];
	if (deque->head == deque->tail)
		deque->head = deque->tail = -1;
	else
		deque->head = (deque->head + 1) % deque->capacity;
	deque->size--;
	return val;
}

int delete_last(DEQUE* deque) {
	if (deque->size == 0)
		return -1;
	int val = deque->arr[deque->tail];
	if (deque->tail == deque->head)
		deque->tail = deque->head = -1;
	else
		deque->tail = (deque->tail - 1 + deque->capacity) % deque->capacity;
	deque->size--;
	return val;
}

void print(DEQUE* deque) {
	if (deque->size == 0)
		return;
	int ind = deque->head;
	while (1) {
		printf("%d ", deque->arr[ind]);
		if (ind == deque->tail)
			break;
		ind = (ind + 1) % deque->capacity;
	}
	printf("\n");
}

int main() {
	DEQUE* deque = create_DEQUE(MAX_SIZE);

	insert_first(deque, 10);
	insert_first(deque, 20);
	insert_first(deque, 20);
	insert_last(deque, 60);
	insert_first(deque, 90);
	insert_last(deque, 30);

	print(deque);

	printf("%d\n", delete_first(deque));
	printf("%d\n", delete_last(deque));

	print(deque);

	return 0;
}