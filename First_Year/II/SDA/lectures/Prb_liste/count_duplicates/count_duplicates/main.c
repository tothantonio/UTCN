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

int count_duplicates(SL_LIST* list) {
    if (list == NULL || list->first == NULL)
        return 0;

    int cnt = 0;
    SLL_NODE* current = list->first;

    while (current != NULL && current->next != NULL) {
        if (current->key == current->next->key) {
            cnt++;
            while (current->next != NULL && current->key == current->next->key) {
                SLL_NODE* temp = current->next;
                current->next = current->next->next;
                if (temp == list->last)
                    list->last = current;
                free(temp);
            }
        }
        else {
            current = current->next;
        }
    }
    return cnt;
}

SLL_NODE* create_sll_node(int key) {
    SLL_NODE* new_node = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (new_node != NULL) {
        new_node->key = key;
        new_node->next = NULL;
    }
    return new_node;
}

void sll_insert_last(SL_LIST* list, int key) {
    SLL_NODE* new_node = create_sll_node(key);
    if (new_node == NULL) {
        printf("Memory allocation failed!\n");
        return;
    }
    if (list->first == NULL) {
        list->first = new_node;
        list->last = new_node;
    }
    else {
        list->last->next = new_node;
        list->last = new_node;
    }
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

    // Populate the list using insert_last function
    sll_insert_last(&list, 1);
    sll_insert_last(&list, 1);
    sll_insert_last(&list, 2);
    sll_insert_last(&list, 2);
    sll_insert_last(&list, 3);

    printf("Original list: ");
    print(&list);

    int duplicates = count_duplicates(&list);
    printf("Number of duplicates: %d\n", duplicates);

    return 0;
}
