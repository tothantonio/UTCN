#include <stdio.h>
#include <stdlib.h>

typedef struct Student {
    char nume[50];
    int nota;
    struct Student* next;
} Student;

void deleteNextNode(Student* student) {

    Student* temp = student->next;
    student->next = temp->next; 
    free(temp); 
}

void printList(Student* head) {
    Student* current = head;
    while (current != NULL) {
        printf("Nume: %s, Nota: %d\n", current->nume, current->nota);
        current = current->next;
    }
}

void deleteStudent(Student* student) {
    if (student == NULL || student->next == NULL) {
        return;
    }

    Student* nextStudent = student->next;
    student->nota = nextStudent->nota; 
    deleteNextNode(student);
}

int main() {
    Student* student1 = (Student*)malloc(sizeof(Student));
    Student* student2 = (Student*)malloc(sizeof(Student));
    Student* student3 = (Student*)malloc(sizeof(Student));

    strcpy(student1->nume, "Ana");
    student1->nota = 7;
    student1->next = student2;

    strcpy(student2->nume, "Bogdan");
    student2->nota = 4;
    student2->next = student3;

    strcpy(student3->nume, "Cristina");
    student3->nota = 9;
    student3->next = NULL;

    Student* studentToDelete = student2;

    printf("Lista initiala:\n");
    printList(student1);

    deleteStudent(studentToDelete);

    printf("\nLista dupa eliminare:\n");
    printList(student1);

    free(student1);
    free(student2);
    free(student3);

    return 0;
}
