#include <stdio.h>
#include <stdlib.h>

typedef struct ListNode {
    int key;
    struct ListNode* next;
} ListNode;

ListNode* insertInOrder(ListNode* head, int val) {
    ListNode* newNode = (ListNode*)malloc(sizeof(ListNode));
    newNode->key = val;
    newNode->next = NULL;

    if (head == NULL || val < head->key) {
        newNode->next = head;
        return newNode;
    }

    ListNode* current = head;
    while (current->next != NULL && current->next->key < val) {
        current = current->next;
    }

    newNode->next = current->next;
    current->next = newNode;

    return head;
}

void printList(ListNode* head) {
    while (head != NULL) {
        printf("%d  ", head->key);
        head = head->next;
    }
    printf("NULL\n");
}

int main() {
    ListNode* head = (ListNode*)malloc(sizeof(ListNode));
    head->key = 1;
    head->next = (ListNode*)malloc(sizeof(ListNode));
    head->next->key = 3;
    head->next->next = (ListNode*)malloc(sizeof(ListNode));
    head->next->next->key = 5;
    head->next->next->next = NULL;

    printf("Lista initiala: ");
    printList(head);

    head = insertInOrder(head, 4);

    printf("Lista dupa inserare: ");
    printList(head);

    // Eliberăm memoria
    ListNode* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }

    return 0;
}
