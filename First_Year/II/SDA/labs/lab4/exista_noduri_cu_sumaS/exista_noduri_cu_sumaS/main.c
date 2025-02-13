#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* left, * right;
};

struct Node* createNode(int value) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->left = newNode->right = NULL;
    return newNode;
}

int find_pair(struct Node* root, int s, int* arr) {
    if (root == NULL) return 0;
    if (find_pair(root->left, s, arr))
        return 1;
    if (arr[root->data]) {
        printf("Pereche gasita: (%d, %d)\n", root->data, s - root->data);
        return 1;
    }
    arr[s - root->data] = 1;
    return find_pair(root->right, s, arr);
}

int main() {

    struct Node* root = createNode(10);
    root->left = createNode(5);
    root->right = createNode(15);
    root->left->left = createNode(3);
    root->left->right = createNode(7);
    root->right->left = createNode(12);
    root->right->right = createNode(18);

    int sum = 17;

    int* arr = (int*)calloc(sum + 1, sizeof(int));

    // Cãutarea unei perechi de noduri cu suma specificatã
    if (!find_pair(root, sum, arr))
        printf("Nu exista o pereche de noduri cu suma %d.\n", sum);

    else printf("exista");
    return 0;
}