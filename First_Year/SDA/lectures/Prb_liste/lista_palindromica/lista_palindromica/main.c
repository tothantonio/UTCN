#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct _SLL_NODE {
    int key;
    struct _SLL_NODE* next;
} SLL_NODE;

typedef struct {
    SLL_NODE* first;
    SLL_NODE* last;
} SL_LIST;

SLL_NODE* reverseList(SLL_NODE* head) {
    SLL_NODE* curr = head, * prev = NULL, * next = NULL;
    while (curr != NULL) {
        next = curr->next;
        curr->next = prev;
        prev = curr;
        curr = next;
    }
    return prev;
}

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

bool isPal(SL_LIST* list) {
    SLL_NODE* slow = list->first, * fast = list->first;
    while (fast != NULL && fast->next != NULL) {
        fast = fast->next->next;
        slow = slow->next;
    }
    SLL_NODE* sec_half = reverseList(slow);
    while (sec_half != NULL) {
        if (list->first->key != sec_half->key)
            return false;
        list->first = list->first->next;
        sec_half = sec_half->next;
    }
    return true;
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
    insert_last(&list, 2);
    insert_last(&list, 7);
    insert_last(&list, 7);
    insert_last(&list, 2);

    if (isPal(&list))
        puts("Palindromica");
    else
        puts("Nu e palindromica");

    return 0;
}
