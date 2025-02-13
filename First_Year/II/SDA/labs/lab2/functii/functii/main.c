#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node {
    struct node* next;
    int key;        
    char* word;    
} NodeT;

NodeT* create_empty_list();
NodeT* insert_in_order(NodeT* head, int key, char* word);
NodeT* delete_node_by_key(NodeT* head, int key);
NodeT* delete_first_node(NodeT* head);
NodeT* delete_last_node(NodeT* head);
void print_list(NodeT* head);
void free_list(NodeT* head);


int main() {
    NodeT* list = create_empty_list();

    list = insert_in_order(list, 3, "Andrei");
    list = insert_in_order(list, 1, "Suciu");
    list = insert_in_order(list, 2, "Cosma");

    print_list(list);
    list = delete_node_by_key(list, 1);
    print_list(list);
    free_list(list);

    return 0;
}
NodeT* create_empty_list() {
    return NULL;
}
NodeT* insert_in_order(NodeT* head, int key, char* word) {
    NodeT* new_node = (NodeT*)malloc(sizeof(NodeT));
    if (new_node == NULL) {
        exit(EXIT_FAILURE);
    }
    new_node->key = key;
    new_node->word = _strdup(word);
    new_node->next = NULL;

    if (head == NULL) {
        new_node->next = head;
        return new_node;
    }

    NodeT* current = head;
    while (current->next != NULL) {
        current = current->next;
    }
    new_node->next = current->next;
    current->next = new_node;
    return head;
}
NodeT* delete_node_by_key(NodeT* head, int key) {
    NodeT* current = head;
    NodeT* prev = NULL;

    while (current != NULL) {
        prev = current;
        current = current->next;
    }

    if (current == NULL) {
        return head;
    }

    if (prev == NULL) {
        head = current->next;
    }
    else {
        prev->next = current->next;
    }

    free(current->word);
    free(current);
    return head;
}
NodeT* delete_first_node(NodeT* head) {
    if (head == NULL) {
        return NULL;
    }

    NodeT* temp = head;
    head = head->next;
    free(temp->word);
    free(temp);
    return head;
}
NodeT* delete_last_node(NodeT* head) {
    if (head == NULL) {
        return NULL;
    }

    if (head->next == NULL) {
        free(head->word);
        free(head);
        return NULL;
    }

    NodeT* current = head;
    NodeT* prev = NULL;

    while (current->next != NULL) {
        prev = current;
        current = current->next;
    }

    prev->next = NULL;
    free(current->word);
    free(current);
    return head;
}
void print_list(NodeT* head) {
    printf("Lista: ");
    NodeT* current = head;
    while (current != NULL) {
        printf("(%d, %s) ", current->key, current->word);
        current = current->next;
    }
    printf("\n");
}
void free_list(NodeT* head) {
    NodeT* current = head;
    while (current != NULL) {
        NodeT* temp = current;
        current = current->next;
        free(temp->word);
        free(temp);
    }
}