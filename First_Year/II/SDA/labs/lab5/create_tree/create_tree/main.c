#include <stdio.h>
#include <stdlib.h>

typedef struct node_type {
    float id;
    struct node_type* left, * right;
} NodeT;

NodeT* createTree(float val) {
    NodeT* p = (NodeT*)malloc(sizeof(NodeT));
    if (!p)
        return NULL;
    p->id = val; 
    p->left = NULL;
    p->right = NULL;
    return p;
}

NodeT* insertNodeINT(NodeT* root, float val) {
    if (root == NULL)
        return createTree((int)val); 
    if ((int)val < root->id)
        root->left = insertNodeINT(root->left, val);
    else if ((int)val > root->id)
        root->right = insertNodeINT(root->right, val);
    return root;
}

NodeT* insertNodeFR(NodeT* root, float val) {
    if (root == NULL)
        return createTree(val);

    float fr = val - (int)val;
    if (fr < 0)
        fr *= -1;
    if (fr < 0.0001)
        return root;
    if (fr < 0.001)
        val = 0.0;
    else
        val -= (int)val;

    if (val < root->id)
        root->left = insertNodeFR(root->left, val);
    else if (val > root->id)
        root->right = insertNodeFR(root->right, val);
    return root;
}

void inorder(NodeT* root) {
    if (root != NULL) {
        inorder(root->left);
        printf("%.2f ", root->id);
        inorder(root->right);
    }
}

int main() {
    NodeT* rootFR = NULL;
    NodeT* rootINT = NULL;

    float keys[100] = { 9.23, 8.35, 10.28, -98.1, 3.14, 2.19 };
    for (int i = 0; i < 6; i++)
    {
        rootINT = insertNodeINT(rootINT, keys[i]);
        rootFR = insertNodeFR(rootFR, keys[i]);
    }

    printf("Integer Binary Search Tree:\n");
    inorder(rootINT);
    printf("\n");

    printf("Fractional Binary Search Tree:\n");
    inorder(rootFR);
    printf("\n");

    return 0;
}
