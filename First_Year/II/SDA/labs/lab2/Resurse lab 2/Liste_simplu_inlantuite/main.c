#include <stdio.h>
#include <stdlib.h>
#include "single_linked_list.h"
#include "test_helper.h"

int test_create_empty_list() {
    SL_LIST *list = NULL;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_destroy_single_linked_list_null_ptr() {
    destroy_single_linked_list(NULL);
    return 0;
}

int test_destroy_single_linked_list_null_list() {
    SL_LIST *list = NULL;
    destroy_single_linked_list(&list);
    return 0;
}

int test_print_null_list() {
    sll_print_list(NULL);
    return 0;
}

int test_print_empty_list() {
    SL_LIST *list = NULL;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    sll_print_list(list);
    printf("\n");

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_insert_first_null_list() {
    sll_insert_first(NULL, 10);
    return 0;
}

int test_insert_first() {
    SL_LIST *list = NULL;
    int values[] = {3, 1, 4};
    unsigned int nr_values = sizeof(values) / sizeof (values[0]);

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);

    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    if (sll_check_list_content(list, values, nr_values) != SLL_STATUS_SUCCESS) {
        printf("The correct order should be:\n");
        for (unsigned int i = 0; i < nr_values; i++) {
            printf("%d ", values[i]);
        }
        printf("\n");
        return -1;
    }

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_insert_last_null_list() {
    sll_insert_last(NULL, 10);
    return 0;
}

int test_insert_last() {
    SL_LIST *list = NULL;
    int values[] = {3, 1, 4};
    unsigned int nr_values = sizeof(values) / sizeof (values[0]);

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_last(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_last(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_last(list, 4) == SLL_STATUS_SUCCESS, -1);

    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    if (sll_check_list_content(list, values, nr_values) != SLL_STATUS_SUCCESS) {
        printf("The correct order should be:\n");
        for (unsigned int i = 0; i < nr_values; i++) {
            printf("%d ", values[i]);
        }
        printf("\n");
        return -1;
    }

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_search_null_list() {
    sll_insert_last(NULL, 10);
    return 0;
}

int test_search_empty_list() {
    SL_LIST *list = NULL;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_search(list, 10) == NULL, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_search_value_not_found() {
    SL_LIST *list = NULL;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 6) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 18) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, -5) == SLL_STATUS_SUCCESS, -1);

    CHECK_RET(sll_search(list, 2) == NULL, -1);
    CHECK_RET(sll_search(list, -6) == NULL, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_search_value_found_first() {
    SL_LIST *list = NULL;
    SLL_NODE *node = NULL;
    int search_val = 0;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 6) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 18) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, -5) == SLL_STATUS_SUCCESS, -1);

    search_val = -5;

    node = sll_search(list, search_val);
    CHECK_RET(node != NULL, -1);

    CHECK_RET(sll_get_node_value(node) == search_val, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_search_value_found_last() {
    SL_LIST *list = NULL;
    SLL_NODE *node = NULL;
    int search_val = 0;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 6) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 18) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, -5) == SLL_STATUS_SUCCESS, -1);

    search_val = 4;

    node = sll_search(list, search_val);
    CHECK_RET(node != NULL, -1);

    CHECK_RET(sll_get_node_value(node) == search_val, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_search_value_found_middle() {
    SL_LIST *list = NULL;
    SLL_NODE *node = NULL;
    int search_val = 0;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 6) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 18) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, -5) == SLL_STATUS_SUCCESS, -1);

    search_val = 3;

    node = sll_search(list, search_val);
    CHECK_RET(node != NULL, -1);

    CHECK_RET(sll_get_node_value(node) == search_val, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_insert_after_key_null_list() {
    sll_insert_after_key(NULL, 10, 15);
    return 0;
}

int test_insert_after_key_empty_list() {
    SL_LIST *list = NULL;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_after_key(list, 1, 5) == SLL_STATUS_SUCCESS, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_insert_after_key_middle() {
    SL_LIST *list = NULL;
    int values[] = {3, 1, 5, 4};
    unsigned int nr_values = sizeof(values) / sizeof (values[0]);

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);

    printf("Before insert:\n");
    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    CHECK_RET(sll_insert_after_key(list, 1, 5) == SLL_STATUS_SUCCESS, -1);

    printf("After insert:\n");
    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    if (sll_check_list_content(list, values, nr_values) != SLL_STATUS_SUCCESS) {
        printf("The correct order should be:\n");
        for (unsigned int i = 0; i < nr_values; i++) {
            printf("%d ", values[i]);
        }
        printf("\n");
        return -1;
    }

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_insert_after_key_last() {
    SL_LIST *list = NULL;
    int values[] = {3, 1, 4, 5};
    unsigned int nr_values = sizeof(values) / sizeof (values[0]);

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);

    printf("Before insert:\n");
    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    CHECK_RET(sll_insert_after_key(list, 4, 5) == SLL_STATUS_SUCCESS, -1);

    printf("After insert:\n");
    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    if (sll_check_list_content(list, values, nr_values) != SLL_STATUS_SUCCESS) {
        printf("The correct order should be:\n");
        for (unsigned int i = 0; i < nr_values; i++) {
            printf("%d ", values[i]);
        }
        printf("\n");
        return -1;
    }

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_delete_first_null_list() {
    sll_delete_first(NULL);
    return 0;
}

int test_delete_first_empty_list() {
    SL_LIST *list = NULL;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_delete_first(list) == SLL_STATUS_SUCCESS, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_delete_first() {
    SL_LIST *list = NULL;
    int values[] = {8, 5, 3, 1, 4};
    unsigned int nr_values = sizeof(values) / sizeof (values[0]);

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 5) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 8) == SLL_STATUS_SUCCESS, -1);

    printf("Before delete:\n");
    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    printf("Start deleting:\n");

    for (unsigned int i = 0; i < nr_values - 1; i++) {
        CHECK_RET(sll_delete_first(list) == SLL_STATUS_SUCCESS, -1);

        CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
        printf("\n");

        if (sll_check_list_content(list, values + i + 1, nr_values - i - 1) != SLL_STATUS_SUCCESS) {
            printf("The correct order should be:\n");
            for (unsigned int j = i + 1; j < nr_values; j++) {
                printf("%d ", values[j]);
            }
            printf("\n");
            return -1;
        }
    }

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_delete_last_null_list() {
    sll_delete_last(NULL);
    return 0;
}

int test_delete_last_empty_list() {
    SL_LIST *list = NULL;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_delete_last(list) == SLL_STATUS_SUCCESS, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_delete_last() {
    SL_LIST *list = NULL;
    int values[] = {8, 5, 3, 1, 4};
    unsigned int nr_values = sizeof(values) / sizeof (values[0]);

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 5) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 8) == SLL_STATUS_SUCCESS, -1);

    printf("Before delete:\n");
    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    printf("Start deleting:\n");

    for (unsigned int i = 0; i < nr_values - 1; i++) {
        CHECK_RET(sll_delete_last(list) == SLL_STATUS_SUCCESS, -1);

        CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
        printf("\n");

        if (sll_check_list_content(list, values, nr_values - i - 1) != SLL_STATUS_SUCCESS) {
            printf("The correct order should be:\n");
            for (unsigned int j = 0; j < nr_values - i - 1; j++) {
                printf("%d ", values[j]);
            }
            printf("\n");
            return -1;
        }
    }

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_delete_key_null_list() {
    sll_delete_key(NULL, 10);
    return 0;
}

int test_delete_key_empty_list() {
    SL_LIST *list = NULL;

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_delete_key(list, 10) == SLL_STATUS_SUCCESS, -1);

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_delete_key_first() {
    SL_LIST *list = NULL;
    int values[] = {8, 5, 3, 1, 4};
    unsigned int nr_values = sizeof(values) / sizeof (values[0]);

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 5) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 8) == SLL_STATUS_SUCCESS, -1);

    printf("Before delete:\n");
    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    printf("Start deleting:\n");

    for (unsigned int i = 0; i < nr_values - 1; i++) {
        CHECK_RET(sll_delete_key(list, values[i]) == SLL_STATUS_SUCCESS, -1);

        CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
        printf("\n");

        if (sll_check_list_content(list, values + i + 1, nr_values - i - 1) != SLL_STATUS_SUCCESS) {
            printf("The correct order should be:\n");
            for (unsigned int j = i + 1; j < nr_values; j++) {
                printf("%d ", values[j]);
            }
            printf("\n");
            return -1;
        }
    }

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_delete_key_last() {
    SL_LIST *list = NULL;
    int values[] = {8, 5, 3, 1, 4};
    unsigned int nr_values = sizeof(values) / sizeof (values[0]);

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 5) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 8) == SLL_STATUS_SUCCESS, -1);

    printf("Before delete:\n");
    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    printf("Start deleting:\n");

    for (unsigned int i = 0; i < nr_values - 1; i++) {
        CHECK_RET(sll_delete_key(list, values[nr_values - i - 1]) == SLL_STATUS_SUCCESS, -1);

        CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
        printf("\n");

        if (sll_check_list_content(list, values, nr_values - i - 1) != SLL_STATUS_SUCCESS) {
            printf("The correct order should be:\n");
            for (unsigned int j = 0; j < nr_values - i - 1; j++) {
                printf("%d ", values[j]);
            }
            printf("\n");
            return -1;
        }
    }

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int test_delete_key_middle() {
    SL_LIST *list = NULL;
    int values[] = {8, 5, 1, 4};
    unsigned int nr_values = sizeof(values) / sizeof (values[0]);

    list = create_single_linked_list();
    CHECK_RET(list != NULL, -1);

    CHECK_RET(sll_insert_first(list, 4) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 1) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 3) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 5) == SLL_STATUS_SUCCESS, -1);
    CHECK_RET(sll_insert_first(list, 8) == SLL_STATUS_SUCCESS, -1);

    printf("Before delete:\n");
    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    printf("Start deleting:\n");

    CHECK_RET(sll_delete_key(list, 3) == SLL_STATUS_SUCCESS, -1);

    CHECK_RET(sll_print_list(list) == SLL_STATUS_SUCCESS, -1);
    printf("\n");

    if (sll_check_list_content(list, values, nr_values) != SLL_STATUS_SUCCESS) {
        printf("The correct order should be:\n");
        for (unsigned int i = 0; i < nr_values; i++) {
            printf("%d ", values[i]);
        }
        printf("\n");
        return -1;
    }

    destroy_single_linked_list(&list);
    CHECK_RET(list == NULL, -1); // after we free the ptr should be NULL

    return 0;
}

int main() {

    MAKE_TEST(create_empty_list);
    MAKE_TEST(destroy_single_linked_list_null_ptr);
    MAKE_TEST(destroy_single_linked_list_null_list);

    MAKE_TEST(print_null_list);
    MAKE_TEST(print_empty_list);

    MAKE_TEST(insert_first_null_list);
    MAKE_TEST(insert_first);

    MAKE_TEST(insert_last_null_list);
    MAKE_TEST(insert_last);

    MAKE_TEST(search_null_list);
    MAKE_TEST(search_empty_list);
    MAKE_TEST(search_value_not_found);
    MAKE_TEST(search_value_found_first);
    MAKE_TEST(search_value_found_last);
    MAKE_TEST(search_value_found_middle);

    MAKE_TEST(insert_after_key_null_list);
    MAKE_TEST(insert_after_key_empty_list);
    MAKE_TEST(insert_after_key_middle);
    MAKE_TEST(insert_after_key_last);

    MAKE_TEST(delete_first_null_list);
    MAKE_TEST(delete_first_empty_list);
    MAKE_TEST(delete_first);

    MAKE_TEST(delete_last_null_list);
    MAKE_TEST(delete_last_empty_list);
    MAKE_TEST(delete_last);

    MAKE_TEST(delete_key_null_list);
    MAKE_TEST(delete_key_empty_list);
    MAKE_TEST(delete_key_first);
    MAKE_TEST(delete_key_last);
    MAKE_TEST(delete_key_middle);

    return 0;
}
