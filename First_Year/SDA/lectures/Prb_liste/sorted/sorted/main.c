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

void insert_sorted(SL_LIST* list, int key) {
    SLL_NODE* new_node = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (!new_node) {
        printf("Memory allocation failed!\n");
        return;
    }
    new_node->key = key;
    new_node->next = NULL;

    if (list->first == NULL || key < list->first->key) {
        new_node->next = list->first;
        list->first = new_node;
        if (list->last == NULL)
            list->last = new_node;
        return;
    }

    SLL_NODE* current = list->first;
    while (current->next != NULL && current->next->key < key) {
        current = current->next;
    }

    new_node->next = current->next;
    current->next = new_node;
    if (new_node->next == NULL)
        list->last = new_node;
}

void insert_first(SL_LIST* list, int key) {
    SLL_NODE* new_node = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (!new_node) {
        printf("Memory allocation failed!\n");
        return;
    }
    new_node->key = key;
    new_node->next = list->first;
    list->first = new_node;
    if (list->last == NULL)
        list->last = new_node;
}

void print(SL_LIST* list) {
    SLL_NODE* current = list->first;
    while (current != NULL) {
        printf("%d ", current->key);
        current = current->next;
    }
    printf("\n");
}

int main() {
    SL_LIST list;
    list.first = NULL;
    list.last = NULL;

    insert_first(&list, 126);
    insert_first(&list, 31);
    insert_first(&list, 25);
    insert_first(&list, 17);
    insert_first(&list, 13);
    insert_first(&list, 7);
    insert_first(&list, 3);

    insert_sorted(&list, 8);
    print(&list);

    return 0;
}
