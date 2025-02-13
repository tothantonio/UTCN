#include <stdio.h>
#include <stdlib.h>

struct Activity {
    int start, finish;
};

int compare(const void *a, const void *b) {
    return ((struct Activity *)a)->finish - ((struct Activity *)b)->finish;
}

void selectActivities(struct Activity activities[], int n) {
    qsort(activities, n, sizeof(struct Activity), compare);

    int i = 0;
    printf("Activitatea selectata: (%d, %d)\n", activities[i].start, activities[i].finish);

    for (int j = 1; j < n; j++) {
        if (activities[j].start >= activities[i].finish) {
            printf("Activitatea selectata: (%d, %d)\n", activities[j].start, activities[j].finish);
            i = j;
        }
    }
}

int main() {
    struct Activity activities[] = {{5, 9}, {1, 2}, {3, 4}, {0, 6}, {5, 7}, {8, 9}};
    int n = sizeof(activities) / sizeof(activities[0]);
    selectActivities(activities, n);
    return 0;
}
