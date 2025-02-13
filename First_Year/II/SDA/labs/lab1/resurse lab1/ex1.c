/* Programul exemplifica folosirea operatiilor asupra pointerilor */
#include <stdio.h>

void max_min1(int n, int a[], int* max, int* min) {
  int i;
  *max = a[0];
  *min = a[0];
  for (i=1; i<n; i++) {
    if (a[i]>*max )
      *max = a[i];
    else if (a[i]<*min)
      *min = a[i];
  }
}

void max_min2 ( int n,int *a, int *max, int * min ) {
  int i;
  *max = *a;
  *min = *a;
  for (i=1; i<n; i++) {
    if (*(a+i) > *max)
      *max = *(a+i);
    else if (*(a+i)< *min)
      *min =*(a+i);
  }
}

int main(void) {
  int i, n, maxim, minim;
  int x[100];
  /* Introducerea datelor */
  printf(" Numarul elementelor tabloului n=");
  scanf("%d",&n);
  for (i=0; i<n; i++) {
    printf("x[%d]=", i);
    scanf("%d", &x[i]);
  }
  /* Apelul primei proceduri */
  max_min1 (n, x, &maxim, &minim);
  printf("\nLa apelul functiei Max_min1 rezulta : maximul=%d minimul=%d\n", maxim, minim);
  /* Apelul celei de a doua proceduri */
  max_min2(n, x, &maxim, &minim);
  printf("\nLa apelul functiei Max_min2 rezulta : maximul=%d minimul=%d\n", maxim, minim);
  return 0;
}
