// Exemplu de scriere a unor date intr-un fisier text si de citire a datelor

#include <stdio.h>
#include <stdlib.h>

int main(void) {
  char nume[256];
  int varsta;

  /* se creeaza un fisier text si se deschide pentru scriere */
  FILE *f = fopen("test.txt", "w");
  if (!f) {
    printf("Nu se poate deschide fisierul ");
    exit(1) ;
  }
  //se scriu date in fisier
  fprintf(f, "Ion 25 \n");
  fclose(f);

  /* se deschide un fisier pentru citire */
  FILE *f2 = fopen("test.txt", "r");
  if (!f2) {
    printf("Nu se poate deschide fisierul ");
    exit(1);
  }
  if (fscanf(f2, "%s %d", nume, &varsta) != 2)
    printf("Nu s-au putut citi numele si varsta");
  else
    printf("[S-a citit] Nume: %s, Varsta %d\n", nume, varsta);
  fclose(f2);

  return 0;
}
