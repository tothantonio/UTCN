#include <stdio.h>
#include <stdlib.h>

#define size 100

void push(int *stack, int *top, int key) {
	if (*top == size)
		return;
	(*top)++;
	stack[*top] = key;
}
int pop(int* stack, int *top) {
	if (*top == -1)
		return -1;
	int val = stack[*top];
	(*top)--;
	return val;
}

int main() {
	int stack[size];
	int top = -1;
	push(stack, &top, 10);
	push(stack, &top, 20);
	push(stack, &top, 30);

	for (int i = 0; i <= top; i++)
		printf("%d ", stack[i]);
	printf("\n");

	printf("%d", pop(stack, &top));

	return 0;
}