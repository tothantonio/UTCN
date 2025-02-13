#include <stdio.h>
typedef struct NodeT {

    int key;
    struct NodeT* next;

}NodeT;

NodeT* search(NodeT* head, int key) {
    NodeT* p = head;
    while (p != NULL) {
        if (p->key == key)
            return p;
        p = p->next;
    }
    return NULL;
}

void insert_first(NodeT** head, int key) {
    NodeT* p = (NodeT*)malloc(sizeof(NodeT));
    if (!p)
    {
        printf("Memory allocation failed\n");
        return;
    }
    p->key = key;
    if (*head == NULL) {
        *head = p;
        p->next = *head;
    }
    else {
        NodeT* tail = *head;
        while (tail->next != *head) {
            tail = tail->next;
        }
        p->next = *head;
        tail->next = p;
        *head = p;
    }
}

void insert_after_key(NodeT** head, int afterkey, int key) {
    NodeT* p = *head;

    while (p != *head) {
        if (p->key == afterkey) {
            NodeT* new_p = (NodeT*)malloc(sizeof(NodeT));
            new_p->key = key;
            new_p->next = p->next;
            p->next = new_p;
            return;
        }
        p = p->next;
    }
}

int main() {
    NodeT* head = NULL;

    // Inserăm câteva elemente în listă
    insert_first(&head, 3);
    insert_first(&head, 2);
    insert_first(&head, 1);

    printf("Lista initiala: ");
    print(head);

    // Căutăm un element în listă
    NodeT* searchResult = search(head, 2);
    if (searchResult != NULL) {
        printf("Elementul cu cheia 2 a fost gasit.\n");
    }
    else {
        printf("Elementul cu cheia 2 nu a fost gasit.\n");
    }

    // Inserăm un element după o anumită cheie
    insert_after_key(&head, 2, 4);
    print(head);

    // Eliberăm memoria
    NodeT* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }

    return 0;
	return 0;
}