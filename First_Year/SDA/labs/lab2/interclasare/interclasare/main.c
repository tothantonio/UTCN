#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int key;
    struct node* next;
} node;

node* merge(node* p, node* q) {
    node* new_head = NULL;

    if (p == NULL) return q;
    if (q == NULL) return p;

    if (p->key <= q->key) {
        new_head = p;
        p = p->next;
    }
    else {
        new_head = q;
        q = q->next;
    }
    node* s = new_head;

    while (p && q) {
        if (p->key <= q->key) {
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

    return new_head;
}

node* createNode(int key) {
    node* newNode = (node*)malloc(sizeof(node));
    if (newNode == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }
    newNode->key = key;
    newNode->next = NULL;
    return newNode;
}

void printList(node* head) {
    while (head != NULL) {
        printf("%d ", head->key);
        head = head->next;
    }
    printf("\n");
}

int main() {
    node* list1 = createNode(22);
    list1->next = createNode(47);
    list1->next->next = createNode(52);

    node* list2 = createNode(-5);
    list2->next = createNode(-11);
    list2->next->next = createNode(33);

    node* mergedList = merge(list1, list2);

    printf("Merged List: ");
    printList(mergedList);

    while (mergedList != NULL) {
        node* temp = mergedList;
        mergedList = mergedList->next;
        free(temp);
    }

    return 0;
}
