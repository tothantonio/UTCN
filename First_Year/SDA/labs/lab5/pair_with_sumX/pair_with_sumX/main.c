#include <stdio.h>
#include <stdlib.h>

typedef struct node_type {
    int id;
    struct node_type* left, * right;
} NodeT;

NodeT* createNode(int val) {
    NodeT* p = (NodeT*)malloc(sizeof(NodeT));
    if (!p)
        return NULL;
    p->id = val;
    p->left = p->right = NULL;
    return p;
}

NodeT* insertNode(NodeT* root, int val) {
    if (root == NULL)
        return createNode(val);

    if (val < root->id)
        root->left = insertNode(root->left, val);
    else if (val > root->id)
        root->right = insertNode(root->right, val);
    return root;
}

NodeT* findMin(NodeT* root) {
    if (!root)
        return NULL;
    while (root->left)
        root = root->left;
    return root;
}

NodeT* findMax(NodeT* root) {
    if (!root)
        return NULL;
    while (root->right)
        root = root->right;
    return root;
}
void find_pair(NodeT* root, int sum) {
    NodeT* p = findMin(root);
    NodeT* q = findMax(root);

    while (p != NULL && q != NULL && p != q && p->id < q->id) {
        int s = p->id + q->id;
        if (s == sum) {
            printf("Pair: (%d, %d)\n", p->id, q->id);
            return;
        }
        else if (s < sum) {
            p = p->right;
        }
        else {
            q = q->left;
        }
    }
    printf("Pair not found.\n");
}


void inorder(NodeT* root) {
    if (root != NULL) {
        inorder(root->left);
        printf("%d ", root->id);
        inorder(root->right);
    }
}

int main() {
    NodeT* root = NULL;
    int keys[7] = { 5, 3, 7, 2, 4, 6, 8 };
    for (int i = 0; i < sizeof(keys) / sizeof(int); i++)
        root = insertNode(root, keys[i]);

    inorder(root);

    find_pair(root, 8);
    return 0;
}
