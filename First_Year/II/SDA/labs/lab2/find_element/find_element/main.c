#include <stdio.h>
#include <stdlib.h>

typedef struct NodeT {

	int key;
	struct NodeT* next;

}NodeT;

int findKthFromEnd(NodeT* head, int k) {
    if (head == NULL)
        return -1;

    NodeT* fast = head, * slow = head;
    for (int i = 0; i < k; i++) {
        if (fast == NULL)
            return -1;
        fast = fast->next;
    }

    while (fast != NULL) {
        fast = fast->next;
        slow = slow->next;
    }

    return slow->key;
}

int main() {
    NodeT* head = (NodeT*)malloc(sizeof(NodeT));
    head->key = 1;
    head->next = (NodeT*)malloc(sizeof(NodeT));
    head->next->key = 2;
    head->next->next = (NodeT*)malloc(sizeof(NodeT));
    head->next->next->key = 3;
    head->next->next->next = (NodeT*)malloc(sizeof(NodeT));
    head->next->next->next->key = 4;
    head->next->next->next->next = (NodeT*)malloc(sizeof(NodeT));
    head->next->next->next->next->key = 5;
    head->next->next->next->next->next = NULL;

    int k = 2; 
    int result = findKthFromEnd(head, k);
    if (result != -1) {
        printf("%d\n", result);
    }
    else {
        printf("Lista are mai putin de %d elemente.\n", k);
    }
	return 0;
}