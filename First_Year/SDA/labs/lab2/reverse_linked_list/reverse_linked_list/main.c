#include <stdio.h>
#include <stdlib.h>

typedef struct _SLL_NODE {
    int key;
    struct _SLL_NODE* next;
} SLL_NODE;

typedef struct {
    SLL_NODE* first;
    SLL_NODE* last;
} SL_LIST;

void sll_reverse(SL_LIST* list) {
    SLL_NODE* prev = NULL;
    SLL_NODE* current = list->first;
    SLL_NODE* next = NULL;

    while (current != NULL) {
        next = current->next;
        current->next = prev;
        prev = current;
        current = next;
    }

    list->first = prev;
}

void sll_print_list(const SL_LIST* list) {
    const SLL_NODE* current = list->first;
    while (current != NULL) {
        printf("%d ", current->key);
        current = current->next;
    }
}

SLL_NODE* create_sll_node(int value) {
    SLL_NODE* new_node = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (new_node) {
        new_node->key = value;
        new_node->next = NULL;
    }
    return new_node;
}

void sll_insert_last(SL_LIST* list, int given_key) {
    SLL_NODE* new_node = create_sll_node(given_key);
    if (new_node) {
        if (list->last == NULL) {
            list->first = new_node;
            list->last = new_node;
        }
        else {
            list->last->next = new_node;
            list->last = new_node;
        }
    }
}

int main() {
    SL_LIST list;
    list.first = NULL;
    list.last = NULL;

    sll_insert_last(&list, 3);
    sll_insert_last(&list, 7);
    sll_insert_last(&list, 17);
    sll_insert_last(&list, 2);
    sll_insert_last(&list, 3);
    sll_insert_last(&list, 26);

    sll_reverse(&list);

    sll_print_list(&list);
    return 0;
}
