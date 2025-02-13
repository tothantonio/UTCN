#include <stdio.h>
#include <stdlib.h>

typedef struct TRUCK{

	int truck_id;
	struct TRUCK* next;

}TRUCK;

typedef struct {
	TRUCK* top;
}GARAGE;

void on_road(int truck_id) {
	printf("Truck %d is on the road\n", truck_id);
}

void intra_in_garaj(GARAGE* list, int truck_id) {
	TRUCK* new_truck = (TRUCK*)malloc(sizeof(TRUCK));
	if (!new_truck)
		return;
	new_truck->truck_id = truck_id;
	new_truck->next = list->top;
	list->top = new_truck;
}

void iese_din_garaj(GARAGE* list) {
	if (list->top == NULL)
		return;
	TRUCK* tmp = list->top;
	list->top = list->top->next;
	free(tmp);
}

void afiseaza_camioane(GARAGE* list) {
	if (list->top == NULL)
		return;
	TRUCK* curr = list->top;
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

	garage->top = NULL;

	intra_in_garaj(garage, 3);
	intra_in_garaj(garage, 2);
	intra_in_garaj(garage, 8);
	afiseaza_camioane(garage);
	iese_din_garaj(garage);
	afiseaza_camioane(garage);
	iese_din_garaj(garage);
	afiseaza_camioane(garage);

	return 0;
}