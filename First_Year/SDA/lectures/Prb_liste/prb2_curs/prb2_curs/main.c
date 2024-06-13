#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct DLL_NODE {
    char character;
    int frequency;
    struct DLL_NODE* next;
    struct DLL_NODE* prev;
} DLL_NODE;

typedef struct DL_LIST {
    DLL_NODE* first;
    DLL_NODE* last;
} DL_LIST;

DLL_NODE* createNode(char character, int frequency) {
    DLL_NODE *newNode = (DLL_NODE*)malloc(sizeof(DLL_NODE));
    newNode->character = character;
    newNode->frequency = frequency;
    newNode->next = newNode->prev = NULL;
    return newNode;
}

void insertLast(DL_LIST* list, char character, int frequency) {
    DLL_NODE* newNode = createNode(character, frequency);
    if (!list->first) list->first = list->last = newNode;
    else {
        list->last->next = newNode;
        newNode->prev = list->last;
        list->last = newNode;
    }
}

void deleteFirst(DL_LIST* list) {
    if (!list->first) return;
    DLL_NODE* temp = list->first;
    list->first = list->first->next;
    if (list->first) list->first->prev = NULL;
    else list->last = NULL;
    free(temp);
}

void deleteLast(DL_LIST* list) {
    if (!list->last) return;
    DLL_NODE* temp = list->last;
    list->last = list->last->prev;
    if (list->last) list->last->next = NULL;
    else list->first = NULL;
    free(temp);
}

void printListForward(DL_LIST* list) {
    DLL_NODE* current = list->first;
    while (current) {
        printf("%c: %d\n", current->character, current->frequency);
        current = current->next;
    }
}

void searchAndDecrement(DL_LIST* list, char character) {
    DLL_NODE* current = list->first;
    while (current) {
        if (current->character == character) {
            current->frequency--;
            if (current->frequency == 0) {
                if (current == list->first) deleteFirst(list);
                else if (current == list->last) deleteLast(list);
                else {
                    current->prev->next = current->next;
                    current->next->prev = current->prev;
                    free(current);
                }
            }
            return;
        }
        current = current->next;
    }
}

int main() {
    int n;
    scanf("%d", &n);
    getchar();
    DL_LIST list = { NULL, NULL };
    for (int i = 0; i < n; i++) {
        char word[100];
        scanf("%s", word);
        getchar();
        for (int j = 0; j < strlen(word); j++) {
            insertLast(&list, word[j], 1);
        }
    }
    printListForward(&list);
    char searchWord[100];
    scanf("%s", searchWord);
    getchar();
    for (int i = 0; i < strlen(searchWord); i++) {
        searchAndDecrement(&list, searchWord[i]);
    }
    printf("Lista actualizatã:\n");
    printListForward(&list);
    return 0;
}
