#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _SLL_NODE {
    int key;
    struct _SLL_NODE *next;
}SLL_NODE;

typedef struct {
    SLL_NODE *first;
    SLL_NODE *last;
}SL_LIST;


SL_LIST *create_single_linked_list() {
    printf("Not implemented!\n");
    return NULL;
}

void destroy_single_linked_list(SL_LIST *sl_list) {
    printf("Not implemented!\n");
}

void sll_print_list(const SL_LIST *list) {
    printf("Not implemented!\n");
}

SLL_NODE *create_sll_node(int value) {
    printf("Not implemented!\n");

    return NULL;
}

void sll_insert_first(SL_LIST *list, int given_key) {
    printf("Not implemented!\n");
}

void sll_insert_last(SL_LIST *list, int given_key) {
    printf("Not implemented!\n");
}

SLL_NODE *sll_search(const SL_LIST *list, int search_key) {
    printf("Not implemented!\n");

    return NULL;
}

void sll_insert_after_key(SL_LIST *list, int search_key, int value) {
    printf("Not implemented!\n");
}

void sll_delete_first(SL_LIST *list) {
    printf("Not implemented!\n");
}

void sll_delete_last(SL_LIST *list) {
    printf("Not implemented!\n");
}

void sll_delete_key(SL_LIST *list, int search_key) {
    printf("Not implemented!\n");
}


int main() {
    SL_LIST *list = NULL;
    SLL_NODE *node = NULL;
    int search_key = 0;

    list = create_single_linked_list();

    sll_insert_first(list, 4);
    sll_insert_first(list, 1);

    sll_insert_last(list, 3);

    search_key = 2;
    node = sll_search(list, search_key);
    if (node == NULL) {
        printf("The node with the key %d was NOT found!\n", search_key);
    } else {
        printf("The node with the key %d was found at address %p\n", search_key, node);
    }

    search_key = 3;
    node = sll_search(list, search_key);
    if (node == NULL) {
        printf("The node with the key %d was NOT found!\n", search_key);
    } else {
        printf("The node with the key %d was found at address %p\n", search_key, node);
    }

    sll_insert_after_key(list, 4, 22);
    sll_insert_after_key(list, 3, 25);

    sll_print_list(list);
    printf("\n");

    sll_delete_first(list);
    sll_delete_last(list);

    sll_delete_key(list, 22);
    sll_delete_key(list, 8);

    sll_print_list(list);
    printf("\n");

    while(list != NULL && list->first != NULL) {
        sll_delete_first(list);
    }

    sll_print_list(list);
    printf("\n");

    destroy_single_linked_list(list);
    list = NULL;

    return 0;
}
