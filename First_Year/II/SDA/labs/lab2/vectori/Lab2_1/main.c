#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int* array;
    int size;
    int capacity;
} SEQ_LIST;

SEQ_LIST* create_seq_list(int init_capacity) {
    SEQ_LIST* list = (SEQ_LIST*)malloc(sizeof(SEQ_LIST));
    if (list == NULL) {
        printf("Memory allocation failed.\n");
        return;
    }
    list->array = (int*)malloc(init_capacity * sizeof(int));
    if (list->array == NULL) {
        printf("Memory allocation failed.\n");
        return;
    }
    list->size = 0;
    list->capacity = init_capacity;
    return list;
}

void destroy_seq_list(SEQ_LIST* list) {
    free(list->array);
    free(list);
}

void print(const SEQ_LIST* list) {
    printf("Elements in the list: ");
    for (int i = 0; i < list->size; i++) {
        printf("%d ", list->array[i]);
    }
    printf("\n");
}

void seql_insert_first(SEQ_LIST* list, int key) {
    if (list->size == list->capacity) {
        return;
    }
    for (int i = list->size; i > 0; i--) {
        list->array[i] = list->array[i - 1];
    }
    list->array[0] = key;
    list->size++;
}

void seql_insert_last(SEQ_LIST* list, int key) {
    if (list->size == list->capacity) {
        return;
    }
    list->array[list->size] = key;
    list->size++;
}

int seql_search(const SEQ_LIST* list, int key) {
    for (int i = 0; i < list->size; i++) {
        if (list->array[i] == key) {
            return i;
        }
    }
    return -1;
}

void seql_delete_first(SEQ_LIST* list) {
    if (list->size == 0) {
        return;
    }
    for (int i = 0; i < list->size - 1; i++) {
        list->array[i] = list->array[i + 1];
    }
    list->size--;
}

void seql_delete_last(SEQ_LIST* list) {
    if (list->size == 0) {
        return;
    }
    list->size--;
}

void seql_delete_key(SEQ_LIST* list, int key) {
    int index = seql_search(list, key);
    if (index == -1) {
        return;
    }
    for (int i = index; i < list->size - 1; i++) {
        list->array[i] = list->array[i + 1];
    }
    list->size--;
}

int main() {
    SEQ_LIST* list = create_seq_list(8);

    seql_insert_first(list, 5);
    seql_insert_first(list, 2);
    seql_insert_first(list, 7);

    print(list);

    int index2 = seql_search(list, 2);
    printf("Index of key 2: %d\n", index2);

    int index20 = seql_search(list, 20);
    printf("Index of key 20: %d\n", index20);

    seql_delete_first(list);
    seql_delete_key(list, 12);

    print(list);

    destroy_seq_list(list);

    return 0;
}
