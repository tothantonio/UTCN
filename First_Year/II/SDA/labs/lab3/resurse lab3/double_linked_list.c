#include <stdio.h>
#include <stdlib.h>

typedef struct _DLL_NODE {
    int key;
    struct _DLL_NODE* next;
    struct _DLL_NODE* prev;
} DLL_NODE;

typedef struct {
    DLL_NODE* first;
    DLL_NODE* last;
} DL_LIST;

DL_LIST* create_double_linked_list() {
    DL_LIST* list = (DL_LIST*)malloc(sizeof(DL_LIST));
    if(!list)
        return NULL;

    list->first = NULL;
    list->last = NULL;
    return list;
}

void destroy_double_linked_list(DL_LIST* list) {
    if (!list)
        return;
    DLL_NODE* curr = list->first;
    while (curr) {
        DLL_NODE* temp = curr;
        curr = curr->next;
        free(temp);
    }
    free(list);
}

void dll_print_forward(const DL_LIST* list) {
    if (!list || !list->first) {
        return;
    }

    DLL_NODE* curr = list->first;
    while (curr) {
        printf("%d ", curr->key);
        curr = curr->next;
    }
    printf("\n");
}

void dll_print_backward(const DL_LIST* list) {
    if (!list || !list->last) {
        return;
    }
    DLL_NODE* curr = list->last;
    while (curr) {
        printf("%d ", curr->key);
        curr = curr->prev;
    }
    printf("\n");
}

DLL_NODE* dll_search(const DL_LIST* list, int given_key) {
    if (!list || !list->first)
        return NULL;
    DLL_NODE* curr = list->first;
    while (curr) {
        if (curr->key == given_key)
            return curr;
        curr = curr->next;
    }
    return NULL;
}

DLL_NODE* create_dll_node(int given_key) {
    DLL_NODE* node = (DLL_NODE*)malloc(sizeof(DLL_NODE));
    if (!node) {
        return NULL;
    }
    node->key = given_key;
    node->next = NULL;
    node->prev = NULL;
    return node;
}

void dll_insert_first(DL_LIST* list, int given_key) {
    DLL_NODE* new_node = create_dll_node(given_key);
    if (!list->first) {
        list->first = new_node;
        list->last = new_node;
    }
    else {
        new_node->next = list->first;
        list->first->prev = new_node;
        list->first = new_node;
    }
}

void dll_insert_last(DL_LIST* list, int given_key) {
    DLL_NODE* new_node = create_dll_node(given_key);
    if (!list->first) {
        list->first = new_node;
        list->last = new_node;
    }
    else {
        new_node->prev = list->last;
        list->last->next = new_node;
        list->last = new_node;
    }
}

void dll_insert_after_key(DL_LIST* list, int after_key, int given_key) {
    DLL_NODE* curr = dll_search(list, after_key);
    if (!curr)
        return;

    DLL_NODE* new_node = create_dll_node(given_key);
    new_node->prev = curr;
    new_node->next = curr->next;

    if (curr->next)
        curr->next->prev = new_node;
    else
        list->last = new_node;

    curr->next = new_node;
}

void dll_delete_first(DL_LIST* list) {
    if (!list->first)
        return;

    DLL_NODE* curr = list->first;
    list->first = curr->next;
    if (list->first)
        list->first->prev = NULL;
    else
        list->last = NULL;
    free(curr);
}

void dll_delete_last(DL_LIST* list) {
    if (!list->first)
        return;

    DLL_NODE* curr = list->last;
    list->last = curr->prev;
    if (list->first)
        list->last->next = NULL;
    else
        list->last = NULL;
    free(curr);
}

void dll_delete_key(DL_LIST* list, int given_key) {
    DLL_NODE* curr = dll_search(list, given_key);
    if (!curr)
        return;

    if (curr->prev)
        curr->prev->next = curr->next;
    else
        list->first = curr->next;

    if (curr->next)
        curr->next->prev = curr->prev;
    else
        list->last = curr->prev;

    free(curr);
}

int main() {
    DL_LIST* list = create_double_linked_list();

    dll_insert_first(list, 3);
    dll_insert_first(list, 4);
    dll_insert_first(list, 2);
    dll_insert_first(list, 1);

    dll_insert_last(list, 6);
    dll_insert_last(list, 8);

    dll_print_forward(list);
    dll_print_backward(list);

    printf("Searching for key 2: ");
    DLL_NODE* searched_node = dll_search(list, 2);
    if (searched_node)
        printf("Found!\n");
    else
        printf("Not found!\n");

    printf("Searching for key 9: ");
    searched_node = dll_search(list, 9);
    if (searched_node)
        printf("Found!\n");
    else
        printf("Not found!\n");

    dll_delete_first(list);
    dll_print_forward(list);

    dll_delete_first(list);
    dll_delete_last(list);
    dll_print_forward(list);

    dll_delete_key(list, 4);
    dll_print_backward(list);

    dll_delete_key(list, 15);
    dll_print_backward(list);


    dll_print_forward(list);
    dll_print_backward(list);

    dll_delete_key(list, 2);
    dll_delete_key(list, 6);

    dll_print_forward(list);
    dll_print_backward(list);

    destroy_double_linked_list(list);

    return 0;
}
