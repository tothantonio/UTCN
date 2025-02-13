#include <stdio.h>
#include <stdlib.h>
#define N 100

int main(void) {
  char *str1, *str2;

  /* Aloca memorie pentru primul sir de caractere */
  str1 = (char*) malloc(N*sizeof(char));
  if (str1 == NULL) {
    printf("Memorie insuficienta \n");
    exit(1) ;
  }
  printf("Introduceti primul sir de caractere terminat cu ENTER \n");
  fgets(str1, N, stdin);
  printf("\nSirul de caractere introdus este \n%s\n", str1);

  /* Aloca memorie pentru al doilea sir de caractere */
  str2 = (char*) calloc(N, sizeof(char));
  if (str2 == NULL) {
    printf("Memorie insuficienta \n");
    exit(2);
  }
  printf("\nIntroduceti al doilea sir de caractere terminat cu ENTER \n");
  fgets(str2, N, stdin);
  printf("\nSirul de caractere introdus este \n%s\n",str2);

  /* Eliberarea memoriei */
  free(str1);
  free(str2);
  return 0;
}
