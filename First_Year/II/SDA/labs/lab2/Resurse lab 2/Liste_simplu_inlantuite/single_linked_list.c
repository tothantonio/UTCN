//
// Created by Dan Domnita on 27.02.2024.
//
#include "single_linked_list.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct _SLL_NODE {
    int key;
    struct _SLL_NODE *next;
};

struct _SL_LIST {
    SLL_NODE *first;
    SLL_NODE *last;
};



SL_LIST *create_single_linked_list() {
    printf("Not implemented!\n");
    return NULL;
}

void destroy_single_linked_list(SL_LIST **sl_list) {
    printf("Not implemented!\n");
}

SLL_STATUS sll_print_list(const SL_LIST *list) {
    printf("Not implemented!\n");

    return SLL_STATUS_ERROR;
}

SLL_NODE *create_sll_node(int value) {
    printf("Not implemented!\n");

    return NULL;
}


SLL_STATUS sll_insert_first(SL_LIST *list, int given_key) {
    printf("Not implemented!\n");

    return SLL_STATUS_ERROR;
}


SLL_STATUS sll_insert_last(SL_LIST *list, int given_key) {
    printf("Not implemented!\n");

    return SLL_STATUS_ERROR;
}

SLL_NODE *sll_search(const SL_LIST *list, int search_key) {
    printf("Not implemented!\n");

    return NULL;
}

SLL_STATUS sll_insert_after_key(SL_LIST *list, int search_key, int value) {
    printf("Not implemented!\n");

    return SLL_STATUS_ERROR;
}

SLL_STATUS sll_delete_first(SL_LIST *list) {
    printf("Not implemented!\n");

    return SLL_STATUS_ERROR;
}

SLL_STATUS sll_delete_last(SL_LIST *list) {
    printf("Not implemented!\n");

    return SLL_STATUS_ERROR;
}

SLL_STATUS sll_delete_key(SL_LIST *list, int search_key) {
    printf("Not implemented!\n");

    return SLL_STATUS_ERROR;
}








int sll_get_node_value(const SLL_NODE *node) {
    if (node == NULL) {
        return 0;
    }

    return node->key;
}

SLL_STATUS sll_check_list_content(const SL_LIST *list, const int *values, unsigned int nr_values) {
    if (list == NULL || values == NULL) {
        return SLL_STATUS_INVALID_ARGS;
    }

    unsigned int idx = 0;

    for(SLL_NODE *node = list->first; node != NULL; node = node->next, idx++) {
        if (idx >= nr_values) { // the list has more elements than the array
            return SLL_STATUS_ERROR;
        }

        if (node->key != values[idx]) { // the content of the list is different
            return SLL_STATUS_ERROR;
        }
    }

    if (idx != nr_values) { // the list has to few values
        return SLL_STATUS_ERROR;
    }

    return SLL_STATUS_SUCCESS;
}

