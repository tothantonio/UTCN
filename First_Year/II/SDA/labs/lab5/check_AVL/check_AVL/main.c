#include <stdio.h>
#include <stdlib.h>

#define MAX(a, b) (((a) > (b)) ? (a) : (b))

typedef struct node_type {
    int id;
    struct node_type* left, * right;
} NodeT;

typedef struct {
    int height;
    int isAVL;
} AVLInfo;


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

int height(NodeT* node) {
    if (node == NULL)
        return -1;
    return 1 + MAX(height(node->left), height(node->right));
}

int isAVL(NodeT* root) {
    if (root == NULL)
        return 1;

    return (abs(height(root->left) - height(root->right)) <= 1 && isAVL(root->left) && isAVL(root->right));
}

AVLInfo checkAVL(NodeT* root) {
    AVLInfo info;

    if (root == NULL) {
        info.height = -1; 
        info.isAVL = 1; 
        return info;
    }

    AVLInfo leftInfo = checkAVL(root->left);
    AVLInfo rightInfo = checkAVL(root->right);

    info.height = 1 + MAX(leftInfo.height, rightInfo.height);

    if (abs(leftInfo.height - rightInfo.height) <= 1 && leftInfo.isAVL && rightInfo.isAVL) {
        info.isAVL = 1; 
    }
    else {
        info.isAVL = 0;
    }

    return info;
}

void inorder(NodeT* root) {
    if (root) {
        inorder(root->left);
        printf("%d ", root->id);
        inorder(root->right);
    }
}

int main() {
    NodeT* root = NULL;
    int keys[] = {4, 1, 5, 6};
    for (int i = 0; i < sizeof(keys) / sizeof(int); i++)
        root = insertNode(root, keys[i]);

    printf("Inorder traversal of the binary search tree:\n");
    inorder(root);
    printf("\n");

    //if (isAVL(root))
        //printf("The binary search tree is an AVL tree.\n");
    //else
        //printf("The binary search tree is not an AVL tree.\n");

    AVLInfo result = checkAVL(root);

    if (result.isAVL) {
        printf("Arborele este un arbore AVL.\n");
    }
    else {
        printf("Arborele nu este un arbore AVL.\n");
    }

    return 0;
}
