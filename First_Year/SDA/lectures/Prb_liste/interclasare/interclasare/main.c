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

SLL_NODE* merge(SL_LIST* list1, SL_LIST* list2) {
    SLL_NODE* p = list1->first;
    SLL_NODE* q = list2->first;
    SLL_NODE* s = NULL;
    SLL_NODE* new_node = NULL;

    if (p == NULL) return list2->first;
    if (q == NULL) return list1->first;

    if (p != NULL && q != NULL) {
        if (p->key <= q->key) {
            s = p;
            p = s->next;
        }
        else {
            s = q;
            q = s->next;
        }
    }
    new_node = s;

    while (p != NULL && q != NULL) {
        if (p->key < q->key) {
            s->next = p;
            s = p;
            p = s->next;
        }
        else {
            s->next = q;
            s = q;
            q = s->next;
        }
    }
    if (p == NULL) s->next = q;
    if (q == NULL) s->next = p;

    list1->last = list2->last = s; // Update last pointer for both lists
    return new_node;
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
    SL_LIST list1 = { NULL, NULL };
    SL_LIST list2 = { NULL, NULL };

    insert_last(&list1, 32);
    insert_last(&list1, 41);
    insert_last(&list1, 52);
    insert_last(&list2, 27);
    insert_last(&list2, 39);
    insert_last(&list2, 49);
    insert_last(&list2, 151);

    SLL_NODE* res = merge(&list1, &list2);
    print(&list1); 


    return 0;
}
