#include <iostream>
#include "Profiler.h"
using namespace std;

Profiler profiler;

struct Node {
    int key;
    Node *left, *right;
};

void recursiveInorder(Node *root) {
    if(root == NULL) {
        return;
    }
    recursiveInorder(root->left);
    cout << root->key << " ";
    recursiveInorder(root->right);
}

void iterativeInorder(Node *root) {
    Node *curr = root;
    while(curr != NULL) {
        if(curr->left == NULL) {
            cout << curr->key << " ";
            curr = curr->right;
        } else {
            Node *pred = curr->left;
            while(pred->right != NULL && pred->right != curr) {
                pred = pred->right;
            }
            if(pred->right == NULL) {
                pred->right = curr;
                curr = curr->left;
            } else {
                pred->right = NULL;
                cout << curr->key << " ";
                curr = curr->right;
            }
        }
    }
}


Node *buildTree(int arr[], int p, int r) {
    if(p > r) {
        return NULL;
    }
    int mid = (p + r) / 2;
    Node *root = new Node(arr[mid]);
    root->left = buildTree(arr, p, mid - 1);
    root->right = buildTree(arr, mid + 1, r);
    return root;
}

void demo() {
    int array[] = {1, 2, 3, 4, 5, 6};
    int size = sizeof(array) / sizeof(array[0]);
    Node *root = buildTree(array, 0, size - 1);

    cout << "Recursive Inorder: ";
    recursiveInorder(root);
    cout << endl;
    cout << "Iterative Inorder: ";
    iterativeInorder(root);
    cout << endl;
}

void iterativeVsRecursive() {

}

int main() {
    demo();
    return 0;
}
