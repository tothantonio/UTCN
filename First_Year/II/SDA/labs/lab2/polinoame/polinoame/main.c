#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int coef, exp;
    struct Node* next;
} Node;

void create(Node** head, int coef, int exp) {
    Node* q = (Node*)malloc(sizeof(Node));
    if (!q)
        return;

    q->coef = coef;
    q->exp = exp;
    q->next = NULL;

    if (*head == NULL) {
        *head = q;
    }
    else {
        Node* p = *head;
        while (p->next != NULL) {
            p = p->next;
        }
        p->next = q;
    }
}

void print(Node* head) {
    if (head == NULL) {
        printf("0\n");
        return;
    }

    Node* p = head;
    while (p != NULL) {
        printf("%dx^%d", p->coef, p->exp);
        if (p->next != NULL) {
            printf(" + ");
        }
        p = p->next;
    }
    printf("\n");
}

Node* sum(Node* head1, Node* head2) {
    Node* answer = NULL;
    while (head1 != NULL && head2 != NULL) {
        if (head1->exp == head2->exp) {
            create(&answer, head1->coef + head2->coef, head1->exp);
            head1 = head1->next;
            head2 = head2->next;
        }
        else if (head1->exp > head2->exp) {
            create(&answer, head1->coef, head1->exp);
            head1 = head1->next;
        }
        else {
            create(&answer, head2->coef, head2->exp);
            head2 = head2->next;
        }
    }
    while (head1 != NULL) {
        create(&answer, head1->coef, head1->exp);
        head1 = head1->next;
    }
    while (head2 != NULL) {
        create(&answer, head2->coef, head2->exp);
        head2 = head2->next;
    }
    return answer;
}

Node* diff(Node* head1, Node* head2) {
    Node* answer = NULL;
    while (head1 != NULL && head2 != NULL) {
        if (head1->exp == head2->exp) {
            create(&answer, head1->coef - head2->coef, head1->exp);
            head1 = head1->next;
            head2 = head2->next;
        }
        else if (head1->exp > head2->exp) {
            create(&answer, head1->coef, head1->exp);
            head1 = head1->next;
        }
        else {
            create(&answer, head2->coef, head2->exp);
            head2 = head2->next;
        }
    }
    while (head1 != NULL) {
        create(&answer, head1->coef, head1->exp);
        head1 = head1->next;
    }
    while (head2 != NULL) {
        create(&answer, head2->coef, head2->exp);
        head2 = head2->next;
    }
    return answer;
}

Node* mul(Node* head1, Node* head2) {
    Node* answer = NULL;
    while (head1 != NULL && head2 != NULL) {
        if (head1->exp == head2->exp) {
            create(&answer, head1->coef * head2->coef, head1->exp);
            head1 = head1->next;
            head2 = head2->next;
        }
        else if (head1->exp > head2->exp) {
            create(&answer, head1->coef, head1->exp);
            head1 = head1->next;
        }
        else {
            create(&answer, head2->coef, head2->exp);
            head2 = head2->next;
        }
    }
    while (head1 != NULL) {
        create(&answer, head1->coef, head1->exp);
        head1 = head1->next;
    }
    while (head2 != NULL) {
        create(&answer, head2->coef, head2->exp);
        head2 = head2->next;
    }
    return answer;
}

int main() {
    Node* head1 = NULL;
    Node* head2 = NULL;

    create(&head1, 5, 4);
    create(&head1, 3, 2);
    create(&head1, 1, 0);

    create(&head2, 4, 4);
    create(&head2, 2, 2);
    create(&head2, 1, 1);

    printf("primul polinom: ");
    print(head1);

    printf("al doilea polinom: ");
    print(head2);

    Node* answer1 = sum(head1, head2);
    printf("suma: ");
    print(answer1);

    Node* answer2 = diff(head1, head2);
    printf("diferenta: ");
    print(answer2);

    Node* answer3 = mul(head1, head2);
    printf("produs: ");
    print(answer3);

    return 0;
}
