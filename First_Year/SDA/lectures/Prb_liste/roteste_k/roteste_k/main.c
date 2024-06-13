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

void rotateK(SL_LIST* list, int k) {
    if (k == 0)
        return;

    SLL_NODE* curr = list->first;
    int cnt = 1;
    while (cnt < k && curr != NULL) {
        curr = curr->next;
        cnt++;
    }
    if (curr == NULL)
        return;

    SLL_NODE* knode = curr;
    while (curr->next != NULL)
        curr = curr->next;
    curr->next = list->first;
    list->first = knode->next;
    knode->next = NULL;
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

void print(SL_LIST* list) {
    SLL_NODE* p = list->first;
    while (p != NULL) {
        printf("%d ", p->key);
        p = p->next;
    }
    printf("NULL\n");
}

int main() {
    SL_LIST list = { NULL, NULL };
    insert_last(&list, 1);
    insert_last(&list, 2);
    insert_last(&list, 3);
    insert_last(&list, 4);
    insert_last(&list, 5);
    insert_last(&list, 6);

    rotateK(&list, 4);

    print(&list);

    return 0;
}
