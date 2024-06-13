#include <stdio.h>
#include <stdlib.h>

typedef struct _SLL_NODE {
    int key;
    struct _SLL_NODE* next;
} SLL_NODE;

typedef struct {
    SLL_NODE* first;
    SLL_NODE* last;
} SL_LIST;

SLL_NODE* create(int key) {
    SLL_NODE* p = (SLL_NODE*)malloc(sizeof(SLL_NODE));
    if (!p)
        return NULL;
    p->key = key;
    p->next = NULL;
    return p;
}

void insert_first(SL_LIST* list, int key) {
    SLL_NODE* p = create(key);
    if (!p)
        return;
    p->next = list->first;
    list->first = p;
    if (list->last == NULL)
        list->last = p;
}

void print(SL_LIST* list) {
    SLL_NODE* p = list->first;
    while (p != NULL) {
        printf("%d ", p->key);
        p = p->next;
    }
    printf("\n");
}

void unique_replace(SL_LIST* list, int repl) {
    SLL_NODE* curr = list->first;
    while (curr != NULL) {
        int val = curr->key;
        int cnt = 0;
        SLL_NODE* q = list->first;
        while (q != NULL) {
            if (q->key == val) {
                cnt++;
                if (cnt > 1)
                    break;
            }
            q = q->next;
        }
        if (cnt == 1)
            curr->key = repl;
        curr = curr->next;
    }
}

int main() {
    SL_LIST list;
    list.first = NULL;
    list.last = NULL;

    insert_first(&list, 3);
    insert_first(&list, 7);
    insert_first(&list, 7);
    insert_first(&list, 2);
    insert_first(&list, 3);
    insert_first(&list, 26);

  


    int repl = 15;
    unique_replace(&list, repl);


    print(&list);

    SLL_NODE* temp;
    while (list.first != NULL) {
        temp = list.first;
        list.first = list.first->next;
        free(temp);
    }

    return 0;
}
