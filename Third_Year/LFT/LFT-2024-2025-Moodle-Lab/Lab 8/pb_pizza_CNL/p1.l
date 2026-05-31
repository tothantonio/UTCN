%{
#include "y.tab.h"
%}

%%
"I would like"      |
"I want"            |
"Please give me"     return ORDER;
"I prefer"           return PREFER;
"a"|"one"           {yylval=1; return QUANT;}
"two"               {yylval=2; return QUANT;}
"three"             {yylval=3; return QUANT;}
"four"              {yylval=4; return QUANT;}
"pizza"|"pizzas"              return PIZZA;
"with"               return WITH;
"extra cheese"    |
"cheese"     |
"anchovies"     |
"bacon"    |
"cheedar"    |
"extra topping"       return INGREDIENT;
[,.]                   return *yytext;
"and"                return AND;
"large"|"small"      return SIZE;
[ \n]        ;
.           printf("Error");
