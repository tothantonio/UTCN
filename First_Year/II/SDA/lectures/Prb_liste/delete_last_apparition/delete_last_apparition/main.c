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

void deleteLast(SL_LIST* list, int x) {
    SLL_NODE* prev = NULL;
    SLL_NODE* current = list->first;
    while (current != NULL) {
        if (current->key == x) {
            list->last = prev;
        }
        prev = current;
        current = current->next;
    }
    if (list->last != NULL) {
        if (list->last == list->first) { 
            free(list->last);
            list->first = list->last = NULL;
        }
        else {
            SLL_NODE* tmp = list->last->next;
            free(tmp);
            list->last->next = NULL;
            list->last = prev;
        }
    }
}

void insert_first(SL_LIST* list, int key) {
    SLL_NODE* p = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (!p)
        return;
    p->key = key;
    p->next = list->first;
    list->first = p;
    if (list->last == NULL)
        list->last = p;
}

void print(SL_LIST* list) {
    SLL_NODE* p = list->first;
    while (p != NULL) {
        printf("%d ", p->key);
        p = p->next;
    }
    printf("\n");
}

int main() {

    SL_LIST list;
    list.first = NULL;
    list.last = NULL;

    insert_first(&list, 3);
    insert_first(&list, 2);
    insert_first(&list, 17);
    insert_first(&list, 3);
    insert_first(&list, 7);
    insert_first(&list, 3);

    deleteLast(&list, 3);

    print(&list);
    return 0;
}
