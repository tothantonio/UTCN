#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct NODE {
    char* word;
    int frecv;
    struct NODE* next;
    struct NODE* prev;
} NODE;

typedef struct LIST {
    NODE* first;
    NODE* last;
} LIST;

LIST* create_list() {
    LIST* list = (LIST*)malloc(sizeof(LIST));
    if (!list)
        return NULL;
    list->first = NULL;
    list->last = NULL;
    return list;
}

NODE* create_node(char* word) {
    NODE* new_node = (NODE*)malloc(sizeof(NODE));
    if (!new_node)
        return NULL;
    new_node->word = _strdup(word);
    new_node->frecv = 1;
    new_node->next = NULL;
    new_node->prev = NULL;
    return new_node;
}

void insert(LIST* list, char* word) {
    if (list == NULL)
        return;
    if (list->first == NULL) {
        NODE* new_node = create_node(word);
        if (!new_node)
            return;
        list->first = list->last = new_node;
        return;
    }
    NODE* curr = list->first;
    while (curr != NULL) {
        int cmp = strcmp(word, curr->word);
        if (cmp == 0) {
            curr->frecv++;
            return;
        }
        else if (cmp < 0) {
            NODE* new_node = create_node(word);
            if (!new_node)
                return;
            new_node->next = curr;
            new_node->prev = curr->prev;
            if (curr->prev != NULL)
                curr->prev->next = new_node;
            else
                list->first = new_node;
            curr->prev = new_node;
            return;
        }
        curr = curr->next;
    }
    NODE* new_node = create_node(word);
    if (!new_node)
        return;
    new_node->prev = list->last;
    list->last->next = new_node;
    list->last = new_node;
}

void print_forward(LIST* list) {
    if (list == NULL || list->first == NULL)
        return;
    NODE* curr = list->first;
    while (curr != NULL) {
        printf("%s:%d ", curr->word, curr->frecv);
        curr = curr->next;
    }
    printf("\n");
}

void print_backward(LIST* list) {
    if (list == NULL || list->last == NULL)
        return;
    NODE* curr = list->last;
    while (curr != NULL) {
        printf("%s:%d ", curr->word, curr->frecv);
        curr = curr->prev;
    }
    printf("\n");
}

void destroy_list(LIST* list) {
    if (list == NULL)
        return;
    NODE* curr = list->first;
    while (curr != NULL) {
        NODE* temp = curr;
        curr = curr->next;
        free(temp->word);
        free(temp);
    }
    free(list);
}

int main() {
    LIST* lista = create_list();
    if (!lista)
        return -1;

    int n = 3;
    for (int i = 0; i < n; i++) {
        char word[100];
        scanf_s("%s", word);
        insert(lista, word);
    }

    printf("Forward: ");
    print_forward(lista);

    printf("Backward: ");
    print_backward(lista);

    destroy_list(lista);

    return 0;
}
