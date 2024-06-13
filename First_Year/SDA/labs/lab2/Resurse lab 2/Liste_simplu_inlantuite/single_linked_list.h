//
// Created by Dan Domnita on 27.02.2024.
//

#ifndef SINGLE_LINKED_LIST_H
#define SINGLE_LINKED_LIST_H

// Forward declaration of struct. see: https://en.cppreference.com/w/c/language/struct
typedef struct _SLL_NODE SLL_NODE;
typedef struct _SL_LIST SL_LIST;

typedef enum {
    SLL_STATUS_MEM_ERROR = -3,
    SLL_STATUS_INVALID_ARGS = -2,
    SLL_STATUS_ERROR = -1,
    SLL_STATUS_SUCCESS = 0,
}SLL_STATUS;

/// Creates a single linked list
///@returns On success a pointer to an empty list is returned. On error a NULL pointer is returned.
SL_LIST *create_single_linked_list();

/// Frees the allocated memory in the given linked list.
///@attention After the call the ptr passed to the function should be set to NULL. This helps to avoid double free and use after free errors.
void destroy_single_linked_list(SL_LIST **sl_list);

/// Prints the values in the list.
SLL_STATUS sll_print_list(const SL_LIST *list);

/// Inserts the given key as the first element in the received list.
///@arg list Pointer to the list to insert into.
///@arg key The value to insert in the list.
///@return On success the function should return SLL_STATUS_SUCCESS. To see all the possible values in case of error check SLL_STATUS definition.
SLL_STATUS sll_insert_first(SL_LIST *list, int given_key);

/// Inserts the given key as the last element in the received list.
///@arg list Pointer to the list to insert into.
///@arg key The value to insert in the list.
///@return On success the function should return SLL_STATUS_SUCCESS. To see all the possible values in case of error check SLL_STATUS definition.
SLL_STATUS sll_insert_last(SL_LIST *list, int given_key);

/// Search the list for the given value.
///@arg list Pointer to the list to search into.
///@arg search_key The value to find in the list.
///@return If the value is found the function will return a pointer to the list node. If the value is not found the function will return NULL.
SLL_NODE *sll_search(const SL_LIST *list, int search_key);

/// Insert the given value after the search key.
///@arg list Pointer to the list to insert into.
///@arg search_key The value to find in the list.
///@arg value The value that we want inserted after the search key.
///@return On success the function should return SLL_STATUS_SUCCESS. To see all the possible values in case of error check SLL_STATUS definition.
SLL_STATUS sll_insert_after_key(SL_LIST *list, int search_key, int value);

/// Remove the first value from the list.
///@arg list Pointer to the list to remove from.
///@return On success the function should return SLL_STATUS_SUCCESS. To see all the possible values in case of error check SLL_STATUS definition.
SLL_STATUS sll_delete_first(SL_LIST *list);

/// Remove the last value from the list.
///@arg list Pointer to the list to remove from.
///@return On success the function should return SLL_STATUS_SUCCESS. To see all the possible values in case of error check SLL_STATUS definition.
SLL_STATUS sll_delete_last(SL_LIST *list);

/// Remove the first occurrence of search key from the list.
///@arg list Pointer to the list to remove from.
///@arg search_key The value to remove from the list.
///@return On success the function should return SLL_STATUS_SUCCESS. To see all the possible values in case of error check SLL_STATUS definition.
SLL_STATUS sll_delete_key(SL_LIST *list, int search_key);


int sll_get_node_value(const SLL_NODE *node);
SLL_STATUS sll_check_list_content(const SL_LIST *list, const int *values, unsigned int nr_values);

#endif //SINGLE_LINKED_LIST_H
