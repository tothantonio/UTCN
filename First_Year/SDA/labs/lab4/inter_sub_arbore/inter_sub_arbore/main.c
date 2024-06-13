#include <stdio.h>
#include <stdlib.h>

typedef struct TreeNode {
	int val;
	struct TreeNode* left;
	struct TreeNode* right;
}TREENODE;

TREENODE* alloc(int key) {
    TREENODE* q = calloc(1, sizeof(TREENODE));
    if (!q)
        return NULL;
    q->val = key;
    return q;
}

void insert_rec(TREENODE** root, int key) {
    if (!root)
        return;
    if (!(*root)) {
        *root = alloc(key);
        return;
    }

    if (key < (*root)->val)
        insert_rec(&((*root)->left), key);
    else if (key > (*root)->val)
        insert_rec(&((*root)->right), key);
}

void insert_iter(TREENODE** root, int key) {
    if (!root)
        return;
    if (!(*root)) {
        *root = alloc(key);
        return;
    }

    TREENODE* node = *root;

    while (1) {
        if (key < node->val) {
            if (node->left == NULL)
            {
                node->left = alloc(key);
                return;
            }
            node = node->left;
        }
        else if (key > node->val) {
            if (node->right == NULL) {
                node->right = alloc(key);
                return;
            }
            node = node->right;
        }
        else return;
    }
}

TREENODE* invertTree(TREENODE* root) {
    if (!root)
        return NULL;

    TREENODE* invertL = invertTree(root->left);
    TREENODE* invertR = invertTree(root->right);

    root->left = invertR;
    root->right = invertL;

    return root;
}

void printPreorder(TREENODE* root) {
    
    if (!root)
        return;
    else
    {
        printf("%d ", root->val);
        printPreorder(root->left);
        printPreorder(root->right);
    }
}

int main() {
    TREENODE* root = NULL;
    int keys[] = {7, 3, 2, 9, 10, 8};
    for (int i = 0; i < sizeof(keys) / sizeof(int); i++)
        insert_rec(&root, keys[i]);
      //insert_iter(&root, keys[i]);

    printf("Original tree (preorder): ");
    printPreorder(root);
    printf("\n");

    root = invertTree(root);

    printf("Inverted tree (preorder): ");
    printPreorder(root);
    printf("\n");
	return 0;
}