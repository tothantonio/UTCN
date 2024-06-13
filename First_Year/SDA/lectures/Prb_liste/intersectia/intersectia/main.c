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

SLL_NODE* intersect(SL_LIST* list1, SL_LIST* list2) {
    SLL_NODE* result = NULL;
    SLL_NODE* tail = NULL;
    SLL_NODE* p = list1->first;
    SLL_NODE* q = list2->first;

    while (p != NULL && q != NULL) {
        if (p->key == q->key) {
            SLL_NODE* newNode = (SLL_NODE*)malloc(sizeof(SLL_NODE));
            if (!newNode)
                return NULL;

            newNode->key = p->key;
            newNode->next = NULL;

            if (result == NULL) {
                result = newNode;
                tail = result;
            }
            else {
                tail->next = newNode;
                tail = newNode;
            }
            p = p->next;
            q = q->next;
        }
        else if (p->key < q->key)
            p = p->next;
        else
            q = q->next;
    }
    return result;
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

void print(SLL_NODE* head) {
    SLL_NODE* p = head;
    while (p != NULL) {
        printf("%d ", p->key);
        p = p->next;
    }
    printf("\n");
}

int main() {
    SL_LIST list1 = { NULL, NULL };
    SL_LIST list2 = { NULL, NULL };

    insert_last(&list1, 2);
    insert_last(&list1, 4);
    insert_last(&list1, 6);
    insert_last(&list1, 8);
    insert_last(&list1, 10);

    insert_last(&list2, 3);
    insert_last(&list2, 4);
    insert_last(&list2, 6);
    insert_last(&list2, 9);
    insert_last(&list2, 10);

    SLL_NODE* result = intersect(&list1, &list2);
    print(result);

    return 0;
}
