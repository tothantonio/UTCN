#include <stdio.h>
#include <stdlib.h>

typedef struct TRUCK {

	int truck_id;
	struct TRUCK* next;
}TRUCK;

typedef struct {
	TRUCK* first;
	TRUCK* last;
}GARAGE;

void enqueue(GARAGE* Q, int truck_id) {
	TRUCK* new_truck = (TRUCK*)malloc(sizeof(TRUCK));
	if (!new_truck)
		return;
	new_truck->truck_id = truck_id;
	new_truck->next = NULL;

	if (Q->first == NULL)
		Q->first = Q->last = new_truck;
	else
	{
		Q->last->next = new_truck;
		Q->last = new_truck;
	}
}

int dequeue(GARAGE* Q) {
	if (Q->first == NULL)
		return;
	TRUCK* tmp = Q->first;
	int truck_id = tmp->truck_id;
	Q->first = Q->first->next;
	if (Q->first == NULL)
		Q->last = NULL;
	free(tmp);
	return truck_id;
}

void afiseaza_camioane(GARAGE* Q, const char *loc) {
	if (Q->first == NULL)
	{
		printf("%s:nimic\n", loc);
		return;
	}
	printf("%s:", loc);
	TRUCK* curr = Q->first;
	while (curr != NULL) {
		printf("%d ", curr->truck_id);
		curr = curr->next;
	}
	printf("\n");
}
int main()
{
	GARAGE* garage = (GARAGE*)malloc(sizeof(GARAGE));
	if (!garage)
		return NULL;
	GARAGE* exit = (GARAGE*)malloc(sizeof(GARAGE));
	if (!exit)
		return NULL;

	garage->first = NULL;
	garage->last = NULL;
	exit->first = NULL;
	exit->last = NULL;

	enqueue(garage, 2);
	enqueue(garage, 5);
	enqueue(garage, 10);
	enqueue(garage, 9);
	enqueue(garage, 15);

	afiseaza_camioane(garage, "intrare");
	afiseaza_camioane(exit, "iesire");

	dequeue(garage, 2);
	dequeue(garage, 10);
	afiseaza_camioane(garage, "iesire");
	return 0;
}