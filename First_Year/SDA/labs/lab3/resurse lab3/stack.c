#include <stdio.h>
#include <stdlib.h>

typedef struct _STACK_NODE {
    int key;
    struct _STACK_NODE *next;
} STACK_NODE;

typedef struct {
    STACK_NODE *top;
}STACK;

STACK *create_stack() {
    STACK *stack = (STACK*)malloc(sizeof(STACK));
    if (!stack)
        return NULL;

    stack->top = NULL;
    return stack;
}

void destroy_stack(STACK *stack) {
    if (stack == NULL)
        return;

    while (stack->top != NULL) {
        STACK_NODE* tmp = stack->top;
        stack->top = stack->top->next;
        free(tmp);
    }
    free(stack);
    stack = NULL;
}

void stack_push(STACK *stack, int key) {
    STACK_NODE* new_node = (STACK_NODE*)malloc(sizeof(STACK_NODE));
    if (!new_node)
        return;
    new_node->key = key;
    new_node->next = stack->top;
    stack->top = new_node;
}

int stack_pop(STACK *stack) {
    if (stack->top == NULL)
        return -1;
    int val = stack->top->key;
    STACK_NODE* tmp = stack->top;
    stack->top = stack->top->next;
    free(tmp);
    return val;
}

void print_stack_contents(const STACK *stack) {
    if (stack->top == NULL)
        return;
    STACK_NODE* curr = stack->top;
    while (curr != NULL) {
        printf("%d ", curr->key);
        curr = curr->next;
    }
    printf("\n");
}

int main() {
    STACK *stack = NULL;

    stack = create_stack();

    stack_push(stack, 8);
    stack_push(stack, 4);
    stack_push(stack, 3);
    stack_push(stack, 6);

    print_stack_contents(stack);  // 6 3 4 8
    printf("\n");

    stack_pop(stack);
    stack_pop(stack);

    print_stack_contents(stack);  // 4 8
    printf("\n");

    stack_push(stack, 2);
    stack_push(stack, 6);

    stack_pop(stack);
    stack_pop(stack);
    stack_pop(stack);

    print_stack_contents(stack);  // 8
    printf("\n");

    stack_pop(stack);
    stack_pop(stack); // the stack is already empty

    destroy_stack(stack);
    stack = NULL;

    return 0;
}
