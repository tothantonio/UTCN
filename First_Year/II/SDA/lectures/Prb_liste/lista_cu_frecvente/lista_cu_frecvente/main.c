#include <stdio.h>
#include <stdlib.h>

typedef struct _SLL_NODE {
    int key;
    int frecv;
    struct _SLL_NODE* next;
} SLL_NODE;

typedef struct {
    SLL_NODE* first;
    SLL_NODE* last;
} SL_LIST;

void insert_after(SLL_NODE* node, int key, int frecv) {
    SLL_NODE* p = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (!p)
        return;
    p->key = key;
    p->frecv = frecv;
    p->next = node->next;
    node->next = p;
}

SLL_NODE* count_frequency(SLL_NODE* head) {
    SLL_NODE* p = NULL;
    SLL_NODE* q = head;
    while (q != NULL) {
        SLL_NODE* temp = p;
        while (temp != NULL && temp->key != q->key) {
            temp = temp->next;
        }
        if (temp != NULL)
            temp->frecv++;
        else {
            if (p == NULL) {
                p = (SLL_NODE*)malloc(sizeof(SLL_NODE));
                p->key = q->key;
                p->frecv = 1;
                p->next = NULL;
            }
            else {
                insert_after(p, q->key, 1);
            }
        }
        q = q->next;
    }
    return p;
}

void insert_last(SL_LIST* list, int key) {
    SLL_NODE* p = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (!p)
        return;
    p->key = key;
    p->frecv = 1;
    p->next = NULL;

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
        printf("%d:%d ", p->key, p->frecv);
        p = p->next;
    }
    printf("NULL\n");
}

int main() {
    SL_LIST list = { NULL, NULL };
    insert_last(&list, 1);
    insert_last(&list, 3);
    insert_last(&list, 3);
    insert_last(&list, 2);
    insert_last(&list, 15);
    insert_last(&list, 6);
    insert_last(&list, 15);
    insert_last(&list, 6);
    insert_last(&list, 15);
    insert_last(&list, 10);

    list.first = count_frequency(list.first);
    print(list.first);

    return 0;
}
