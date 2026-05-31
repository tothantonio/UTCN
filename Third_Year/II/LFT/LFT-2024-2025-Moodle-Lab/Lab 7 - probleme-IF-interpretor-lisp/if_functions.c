#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

typedef struct _node{
  int type;
  struct _node *first;
  struct _node *second;
  struct _node *third;
  int value;
} node;

node *opr2(int type, node *first, node *second){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
}

node *opr3(int type, node *first, node *second, node * third){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
   p->third = third;
}

node *setConst(int value){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= NUMBER;
   p->value=value;

}
void printpre(node *opr){
    if (opr==NULL)
       return ;
    if (opr->type ==NUMBER)
       printf("%i ", opr->value);
    else
     {
      switch (opr->type ){
      case IF: printf("( IF ");break;
      case ID: printf("( Variable ");  break;
      default : printf(" ( %c ", opr->type);
      }
      printpre(opr->first);
      printpre(opr->second);
      printpre(opr->third);
      printf(" ) ");
     }
 
}




int main(){
  node *number1 = setConst(2);
  node *number2 = setConst(3);
  node * expression1=opr2('+', number1, number2);
  printpre(expression1);

  node * expression2=opr2('>', expression1, number2);
  printf("\n");
  printpre(expression2);

 node *expression3 = opr2('<', 
                               opr2(ID, opr2('a', NULL, NULL), NULL), 
                               number1);
  printf("\n");
  printpre(expression3);
}
