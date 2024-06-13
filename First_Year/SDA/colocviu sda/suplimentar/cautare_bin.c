#include <stdio.h>
#include <stdlib.h>

int binarySearch(int arr[], int n, int x){
    int left = 0, right = n - 1;
    while(left <= right){
        int mid = left + (right - left) / 2;
        if(arr[mid] == x){
            return mid;
        }
        if(arr[mid] < x){
            left = mid + 1;
        }else{
            right = mid - 1;
        }
    }
    return -1;
}

int main(){

    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

    int n = sizeof(arr) / sizeof(arr[0]);

    int x = 2;
    int result = binarySearch(arr, n, x);

    if(result == -1){
        printf("Elementul nu a fost gasit\n");
    }else{
        printf("Elementul a fost gasit pe pozitia %d\n", result);
    }

    return 0;
}
