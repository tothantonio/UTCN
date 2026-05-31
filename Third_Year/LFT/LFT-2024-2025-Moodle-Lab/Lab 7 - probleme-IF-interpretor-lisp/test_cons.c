#include <stdio.h>
#include <stdlib.h>
typedef struct _cons {
  int car;
  struct _cons *cdr;
} cons_c;

cons_c *cons(int, cons_c *);
cons_c *concat(cons_c *, cons_c *);
cons_c *cdr(cons_c *);
int car(cons_c *);
void print_list(cons_c *);
void print_l(cons_c *);


cons_c *concat(cons_c *l1, cons_c *l2)
{
  cons_c *p;
  for(p = l1; p->cdr != NULL; p = p->cdr)
    ;
  p->cdr = l2;
  return l1;
}

cons_c *cons(int nr, cons_c *l)
{
  cons_c *p = (cons_c *)malloc(sizeof(cons_c));
  p->car = nr;
  p->cdr = l;
  return p;
}

cons_c *cdr(cons_c *l)
{
  return l->cdr;
}

int car(cons_c *l)
{
  return l->car;
}

void print_list(cons_c *l)
{
  printf("(");
  print_l(l);
  printf(")\n");
}

void print_l(cons_c *l)
{
  if(l != NULL) {
    if(l->cdr != NULL)
      printf("%d ", l->car);
    else
      printf("%d", l->car);
    print_l(l->cdr);
  }
}

int main(){

  cons_c *my_list = cons(1, NULL);
  cons_c *my_list_2 = cons(2, NULL);
  printf("SImple cons cell\n");
  print_list(my_list);
  my_list=cons(2, my_list);
  print_list(my_list);
  my_list = concat(my_list, my_list_2);
  print_list(my_list);
  printf("car is %d", car(my_list_2));  
}

/* Many thanks to Chifu Emil, author of this code. */
