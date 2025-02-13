#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define M 7 // Dimensiunea tabelei de dispersie

typedef struct node_type {
    char* word;
    struct node_type* next;
} NodeT;

// Funcția de dispersie f1
int f1(char* word) {
    int sum = 0;
    int len = strlen(word);
    for (int i = 0; i < len; i++) {
        sum += word[i];
    }
    return (sum / len) % M;
}

// Funcția de dispersie f2
int f2(int a) {
    return a % M;
}

void insert(NodeT* hTable[M], char* word) {
    int index = f2(f1(word)); // Calculăm indicele pentru inserare

    NodeT* new_node = (NodeT*)malloc(sizeof(NodeT));
    if (!new_node)
        return;
    new_node->word = (char*)malloc(sizeof(char));
    if (!(new_node->word))
        return;
    strcpy_s(new_node->word, strlen(word) + 1, word);
    new_node->next = hTable[index];
    hTable[index] = new_node;
}

void showAll(NodeT* hTable[M]) {
    for (int i = 0; i < M; i++) {
        printf("%d: ", i);
        NodeT* p = hTable[i];
        while (p != NULL) {
            printf("%s -> ", p->word);
            p = p->next;
        }
        printf("NULL\n");
    }
}

int main() {
    NodeT* hTable[M] = { NULL };

    char* words[] = { "mar", "var", "lup", "mop", "dop", "urs", "cuc", "laborator", "date", "structura", NULL };
    for (int i = 0; words[i] != NULL; i++) {
        insert(hTable, words[i]);
    }

    showAll(hTable);
    return 0;
}
