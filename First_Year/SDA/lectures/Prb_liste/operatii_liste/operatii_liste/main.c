#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _SLL_NODE {
    int key;
    struct _SLL_NODE* next;
} SLL_NODE;

typedef struct {
    SLL_NODE* first;
    SLL_NODE* last;
} SL_LIST;


SL_LIST* create_single_linked_list() {
    SL_LIST* list = (SL_LIST*)malloc(sizeof(SL_LIST));
    if (list) {
        list->first = NULL;
        list->last = NULL;
    }
    return list;
}

void destroy_single_linked_list(SL_LIST** sl_list) {
    if (sl_list == NULL)
        return;
        
    if (*sl_list == NULL)
        return;

    SLL_NODE* curr = (*sl_list)->first;
    SLL_NODE* prev;

    while (curr != NULL) {
        prev = curr;
        free(prev);
        curr = curr->next;
        prev = NULL;
    }
    free(*sl_list);
    *sl_list = NULL;
}

void sll_print_list(const SL_LIST* list) {
    if (list == NULL)
        return NULL;
    const SLL_NODE* curr = list->first;
    while (curr != NULL) {
        printf("%d ", curr->key);
        curr = curr->next;
    }
}

SLL_NODE* create_sll_node(int value) {
    SLL_NODE* node = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (node) {
        node->key = value;
        node->next = NULL;
    }
    return node;
}

void sll_insert_first(SL_LIST* list, int given_key) {
    SLL_NODE* new_node = create_sll_node(given_key);
    if (new_node) {
        new_node->next = list->first;
        list->first = new_node;
        if (list->last == NULL) {
            list->last = new_node;
        }
    }
}

void sll_insert_last(SL_LIST* list, int given_key) {
    SLL_NODE* new_node = create_sll_node(given_key);
    if (new_node) {
        if (list->last == NULL) {
            list->first = new_node;
            list->last = new_node;
        }
        else {
            list->last->next = new_node;
            list->last = new_node;
        }
    }
}

SLL_NODE* sll_search(const SL_LIST* list, int search_key) {
    SLL_NODE* current = list->first;
    while (current != NULL) {
        if (current->key == search_key) {
            return current;
        }
        current = current->next;
    }
    return NULL;
}

void sll_insert_after_key(SL_LIST* list, int search_key, int value) {
    SLL_NODE* curr = sll_search(list, search_key);
    if (curr != NULL) {
        SLL_NODE* new_node = create_sll_node(value);
        if (new_node) {
            new_node->next = curr->next;
            curr->next = new_node;
            if (curr == list->last) {
                list->last = new_node;
            }
        }
    }
}

void sll_delete_first(SL_LIST* list) {

    SLL_NODE *node = list->first;
    if (node != NULL) {
        list->first = list->first->next;
        free(node);
        node = NULL;

        if (list->first == NULL) {
            list->last = NULL;
        }
    }
}

void sll_delete_last(SL_LIST* list) {

    SLL_NODE* curr = NULL;
    SLL_NODE* prev = NULL;
    curr = list->first;
    if (curr != NULL) {
        while (curr != list->last) {
            prev = curr;
            curr = curr->next;
        }
        if (curr == list->first) // numai un nod 
        {
            list->first = list->last = NULL;
        }
        else {
            prev->next = NULL;
            list->last = prev;
        }
        free(curr);
        curr = NULL;
    }
}

void sll_delete_key(SL_LIST* list, int search_key) {
    if (list->first != NULL) {
        if (list->first->key == search_key) {
            sll_delete_first(list);
            return;
        }

        SLL_NODE* curr = list->first;
        while (curr->next != NULL && curr->next->key != search_key) {
            curr = curr->next;
        }
        if (curr->next != NULL) {
            SLL_NODE* temp = curr->next;
            curr->next = temp->next;
            free(temp);
            if (curr->next == NULL) {
                list->last = curr;
            }
        }
    }
}


int main() {
    SL_LIST* list = NULL;
    SLL_NODE* node = NULL;
    int search_key = 0;

    list = create_single_linked_list();

    sll_insert_first(list, 4);
    sll_insert_first(list, 1);
    sll_insert_first(list, 2);

    sll_insert_last(list, 3);

    search_key = 69;
    node = sll_search(list, search_key);
    if (node == NULL) {
        printf("The node with the key %d was NOT found!\n", search_key);
    }
    else {
        printf("The node with the key %d was found at address %p\n", search_key, node);
    }

    search_key = 3;
    node = sll_search(list, search_key);
    if (node == NULL) {
        printf("The node with the key %d was NOT found!\n", search_key);
    }
    else {
        printf("The node with the key %d was found at address %p\n", search_key, node);
    }

    sll_insert_after_key(list, 4, 22);
    sll_insert_after_key(list, 3, 25);
    sll_insert_after_key(list, 1, 8);


    sll_print_list(list);
    printf("\n");

    sll_delete_first(list);
    sll_print_list(list);
    printf("\n");

    sll_delete_last(list);
    sll_print_list(list);

    printf("\n");

    sll_delete_key(list, 22);
    sll_print_list(list);
    sll_delete_key(list, 8);
    printf("\n");
    sll_print_list(list);
    printf("\n");

    while (list != NULL && list->first != NULL) {
        sll_delete_first(list);
    }

    sll_print_list(list);
    printf("\n");

    destroy_single_linked_list(&list);
    //list = NULL;
    printf("Lista goala:\n");
    sll_print_list(list);
    return 0;
}
