#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int start;
    int end;
    char name[100];
} Activity;

int maxActivities(Activity activities[], int n) {
    int i, j;
    int maxCount = 1;
    int count = 1;

    for (i = 1; i < n; i++) {
        for (j = 0; j < n - i; j++) {
            if (activities[j].end > activities[j + 1].end) {
                Activity temp = activities[j];
                activities[j] = activities[j + 1];
                activities[j + 1] = temp;
            }
        }
    }

    int lastEnd = activities[0].end;
    for (i = 1; i < n; i++) {
        if (activities[i].start >= lastEnd) {
            count++;
            lastEnd = activities[i].end;
        }
    }

    return count;
}

int main() {
    int n;
    printf("Enter the number of activities: ");
    scanf("%d", &n);

    Activity activities[10];
    printf("Enter the start time, end time, and name of each activity:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d %d %[^\n]", &activities[i].start, &activities[i].end, activities[i].name);
    }

    int maxCount = maxActivities(activities, n);
    printf("The maximum number of activities that can be performed is: %d\n", maxCount);

    printf("The activities that can be performed are:\n");
    for (int i = 0; i < n; i++) {
        if (activities[i].start >= activities[i-1].end) {
            printf("Activity %d: Start Time = %d, End Time = %d, Name = %s\n", i+1, activities[i].start, activities[i].end, activities[i].name);
        }
    }

    return 0;
}