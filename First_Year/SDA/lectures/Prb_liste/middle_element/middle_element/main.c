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

void findMiddle(SL_LIST* list) {
    SLL_NODE* slow = list->first, * fast = list->first;
    if (list->first != NULL) {
        while (fast != NULL && fast->next != NULL) {
            fast = fast->next->next;
            slow = slow->next;
        }
        printf("%d", slow->key);
    }
}

void insert_last(SL_LIST* list, int key) {
    SLL_NODE* p = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (p == NULL)
        return;
    p->next = NULL;
    p->key = key;

    if (list->first == NULL)
        list->first = list->last = p;
    else {
        list->last->next = p;
        list->last = p;
    }
}

int main() {
    SL_LIST list = { NULL, NULL };
    insert_last(&list, 3);
    insert_last(&list, 7);
    insert_last(&list, 2);
    insert_last(&list, 3);

    findMiddle(&list);
    return 0;
}
