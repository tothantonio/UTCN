#include <iostream>
#include "Profiler.h"
using namespace std;
#define MAX_SIZE 10000
#define STEP_SIZE 100
#define NR_TESTS 5
Profiler profiler;

/*
 * @author Antonio-Roberto Toth
 * @group 30228
 * Assignment Requirements: Dynamic Order Statistics
 * I implemented BUILD_TREE, OS_SELECT, and OS_DELETE
 * BUILD_TREE:
 * I have an array with already sorted elements and it's limits(left and right) to create a perfect balanced tree
 * I create the node with the key as the middle element. The size is the number of elements from the part of the vector
 * that I am using at a certain moment.
 * I recursively call the function for the parts before and after the middle element
 * Complexity: O(n), the height of the tree is O(logn)
 *
 * OS_SELECT:
 * I start at root and search the element with rank i. I compare i with the current node's rank
 * And if the rank is equal to i, it means that I found the element, if i is less than the rank, I will search
 * in the left subtree, otherwise, I will search the element in the right subtree.
 * Complexity: O(logn)
 *
 * OS_SELECT is similar with QuickSelect because it is based on DIVIDE AND CONQUER, selects the element with the i-th smallest key
 *
 * OS_DELETE:
 * First I make the classic delete for an element from a tree, and then I go, from the point where the node is deleted, upwards
 * If the node has max one child, I swap the child with the node, otherwise, if the node has 2 children, I swap it with his successor
 * I remake the size of each node. The tree does not require re-balancing because delete operation does not increase the height
 * And even if the tree is not balanced, the complexity at OS_SELECT and OS_DELETE remains O(logn)
 * Complexity: O(logn)
 *
 */

struct bst {
    int key, size;
    bst* left;
    bst* right;
    bst* parent;
};

bst* createNode(int key, int size) {
    bst* newNode = new bst();
    newNode->key = key;
    newNode->size = size;

    return newNode;
}

bst* BUILD_TREE(int left, int right, int array[], bst* parent) {
    if(right < left) {
        return nullptr;
    }

    int mid = (left + right) / 2;

    bst* node = createNode(array[mid], right - left + 1);

    node->parent = parent;
    node->left = BUILD_TREE(left, mid - 1, array, node);
    node->right = BUILD_TREE(mid + 1, right, array, node);

    return node;
}

bst* OS_SELECT(bst* root, int i, int n) {
    Operation op = profiler.createOperation("Select Op", n);

    int rank = 1;
    op.count();
    if(root->left != NULL) {
        rank = (root->left)->size + 1;
    }

    op.count();
    if(i == rank) {
        return root;
    } else {
        op.count();
        if(i < rank) {
            return OS_SELECT(root->left, i, n);
        }
        return OS_SELECT(root->right, i - rank, n);
    }
}

bst* succ(bst *node, int n) {
    Operation op = profiler.createOperation("Delete Op", n);

    op.count();
    if(node->right != NULL) {
        op.count();
        node = node->right;

        op.count();
        while(node->left != NULL) {
            op.count(2);
            node = node->left;
        }
        return node;
    }

    op.count();
    bst *parent = node->parent;

    op.count(2);
    while(parent != NULL && node == parent->right) {
        op.count(4);
        node = parent;
        parent = parent->parent;
    }
    return parent;
}

bst* OS_DELETE(bst* root, bst* z, int n) { // z = node to be deleted
    Operation op = profiler.createOperation("Delete Op", n);

    bst *y = NULL, *x = NULL; // y = the node that is actually deleted, x = the child of y which will replace y

    op.count(3);
    if(z->left == NULL || z->right == NULL) { // if z has at most one child
        y = z;
    } else {
        y = succ(z, n);
    }

    op.count(2);
    if(y->left != NULL) { // if y has a child, it will be x
        x = y->left;
    } else {
        x = y->right;
    }

    op.count();
    if(x != NULL) { // we link x to y's parent
        op.count();
        x->parent = y->parent;
    }

    op.count();
    if(y->parent == NULL) { // if y is root of tree, we set x as root
        root = x;
    } else {
        if(y == (y->parent)->left) { // if y is left or right child of its parent
            (y->parent)->left = x;
        } else {
            (y->parent)->right = x;
        }
    }

    op.count();
    if(y != z) { // if the deleted node was successor of z
        op.count();
        z->key = y->key;
    }

    for(bst *p = y->parent; p != NULL; p = p->parent) { // update the size for each node
        op.count(3);
        p->size = (p->left == NULL ? 0 : (p->left)->size) + (p->right == NULL ? 0 : (p->right)->size) + 1;
    }

    delete y;

    return root;
}

void prettyPrint(bst* root, int tabs) {
    if(root == NULL) {
        return;
    }

    for(int i = 0; i < tabs; i++) {
        cout << "  ";
    }
    cout << root->key << " size: " << root->size << endl;

    prettyPrint(root->left, tabs + 1);
    prettyPrint(root->right, tabs + 1);
}

int *generateArray(int size) {
    int *array = new int[size];
    for(int i = 0; i < size; i++) {
        array[i] = i + 1;
    }
    return array;
}

void demo() {
    int array[] = {1, 2, 3, 4, 5};
    int size = sizeof(array) / sizeof(array[0]);
    bst* root = BUILD_TREE(0, size - 1, array, NULL);
    prettyPrint(root, 0);

    bst* node = OS_SELECT(root, 3, size - 1);
    cout << "Nodul cautat: " << node->key << endl;

    cout << "Nod de sters : " << node->key << endl;
    root = OS_DELETE(root, node, size);
    prettyPrint(root, 0);
}

void perf() {
    for(int n = STEP_SIZE; n <= MAX_SIZE; n += STEP_SIZE) {
        for(int test = 0; test < NR_TESTS; test ++) {
            int *array = generateArray(n);
            bst *root = BUILD_TREE(0, n - 1, array, NULL);

            for(int i = 0; i < n; i++) {
                int p = rand() % (root->size) + 1;

                bst *node = OS_SELECT(root, p, n);
                root = OS_DELETE(root, node, n);
            }
        }
    }

    profiler.divideValues("Select Op", NR_TESTS);
    profiler.divideValues("Delete Op", NR_TESTS);

    profiler.createGroup("TOTAL OPERATIONS", "Select Op", "Delete Op");
    profiler.showReport();
}

int main()
{
    demo();
    //perf();
    return 0;
}
