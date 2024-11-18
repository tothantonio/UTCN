#include <iostream>
#include <fstream>
#include <list>
using namespace std;


/*
 * @author Antonio-Roberto Toth
 * @group 30228
* Assignment Requirments: Multi-way Trees. Transforms between different representations
* I implemented iterative and recursvie binary tree traversal in O(n) with constant additional memory
* Number of print key operations is the same. idk if this is good :(
*
* For Pretty Print for the tree represented by parent[] vector, I iterate through the array and for each son of current node
* I print it and call pretty print for him.
* Complexity : O(n^2)
*
* For Pretty Print for Multi-way tree representation I use a stucture Node2 where each node has a Key and a list of pointers(sons)
* I print the current node and then call pretty-print for all of his children
* Complexity : O(n)
*
* For Pretty Print for Binary Tree I use a structure where each node has left and right pointer to child/brother, it's like a preorder
* Complexity : O(n)
*
* For T1, the transformation from  the parent representation to the multy way representation, I iterate through the parent[] array
* I create a new object Node2 using an auxiliary array list[] for constant-time access
* Then I identify the root, and add each node to it's parent's sons list
* Time Complexity : O(n), I iterate through parent[] once, Space Complexity: O(n), for the list[] and tree nodes
*
* For T2, the transformation from the parent representation to the binary representation, I recursively traverse the multi-way tree(R2)
* For the first child I set the left pointer, and for siblings set the right pointer
* Time Complexity : O(n), as each node is visited once
* Space Complxity : O(n)
*
 */

struct Node {
    int key;
    Node *left, *right;
};

struct Node2 {
    int key;
    list <Node2*> sons;

};
Node2 *R2; // *list[500] pentru a face transformarea in O(n)

struct Node3 {
    int key;
    Node3 *left, *right;
};

Node3 *R3;

void prettyPrintR1(int parent[], int n, int indexParent, int tabs) {
    for(int i = 0; i < n; i++) {
        if(parent[i] == indexParent) {
            for(int j = 0; j < tabs; j++) {
                cout << "  ";
            }
            cout << i + 1 << endl;
            prettyPrintR1(parent, n, i + 1, tabs + 1);
        }
    }
}

void prettyPrintR2(Node2 *R2, int tabs) {
    for(int i = 0; i < tabs; i++) {
        cout << " ";
    }
    cout << R2->key << endl;
    for(auto it : R2->sons) {
        prettyPrintR2(it, tabs + 1);
    }
}

void prettyPrintR3(Node3 *R3, int tabs) {
    if(R3 != NULL) {
        for(int i = 0; i < tabs; i++) {
            cout << " ";
        }
        cout << R3->key << endl;
        prettyPrintR3(R3->left, tabs + 1);
        prettyPrintR3(R3->right, tabs);
    }
}

Node2* T1(int parent[], int size) {
    Node2 *root = NULL;
    Node2 *list[500] = {NULL}; // sir pentru acces constant

    for(int i = 0; i < size; i++) {
        if(list[i] == NULL) {
            list[i] = new Node2{i + 1};
        }
        if(parent[i] == -1) {
            root = list[i];
        } else {
            if(list[parent[i] - 1] == NULL) {
                list[parent[i] - 1] = new Node2{parent[i]};
            }
            list[parent[i] - 1]->sons.push_back(list[i]);
        }
    }
    return root;
}

Node3* T2(Node2* root) {
    if(root == NULL) {
        return NULL;
    }

    Node3* newNode = new Node3{root->key, NULL, NULL}; // O(1)

    if(!root->sons.empty()) { // O(n)
        auto it = root->sons.begin();
        newNode->left = T2(*it);
        Node3 *bro = newNode->left;

        for(++it; it != root->sons.end(); ++it) {
            bro->right = T2(*it);
            bro = bro->right;
        }
    }
    return newNode;
}

void recursivePreorder(Node *root, int& recOP) {
    if(root == NULL) {
        return;
    }
    recOP++;
    //cout << root->key << " ";
    recursivePreorder(root->left, recOP);
    recursivePreorder(root->right, recOP);
}

void iterativePreorder(Node *root, int& iterOP) {
    Node *curr = root;
    while(curr != NULL) {
        if(curr->left == NULL) {
            iterOP++;
            //cout << curr->key << " ";
            curr = curr->right;
        } else {
            Node *pred = curr->left;
            while(pred->right != NULL && pred->right != curr) {
                pred = pred->right;
            }
            if(pred->right == NULL) {
                pred->right = curr;
                iterOP++;
                //cout << curr->key << " ";
                curr = curr->left;
            } else {
                pred->right = NULL;
                curr = curr->right;
            }
        }
    }
}

Node *generateBinaryTree(int n) {
    if(n == 0) {
        return NULL;
    }
    Node *root = new Node(rand() % 100);
    int leftSize = rand() % n;
    root->left = generateBinaryTree(leftSize);
    root->right = generateBinaryTree(n - leftSize - 1);
    return root;
}

void demo() {
    int parent[] = {2, 7, 5, 2, 7, 7, -1, 5, 2};
    int size = sizeof(parent) / sizeof(parent[0]);
    cout << "Pretty Print R1: " << endl;
    prettyPrintR1(parent, size, -1, 0);


    Node2 *node = T1(parent, size);
    cout << "Pretty Print R2: " << endl;
    prettyPrintR2(node, 0);

    Node3 *newNode = T2(node);
    cout << "Pretty Print R3: " << endl;
    prettyPrintR3(newNode, 0);
}

void recursiveVsIterative() {
    int recOP = 0, iterOP = 0;
    for(int size = 100; size < 10000; size += 100) {
        Node *root = generateBinaryTree(size);
        recursivePreorder(root, recOP);
        iterativePreorder(root, iterOP);
    }
    cout << recOP << " " << iterOP << endl;
}

int main() {
    //demo();
    recursiveVsIterative();
    return 0;
}
