%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
-([1-9]|[1-9][0-9]|100)+ {printf("%d", atoi(yytext) * 10);}
[7|8|9|10|11|12]+   {printf("%d", atoi(yytext) + 7);}
[0-9]+  {printf("%s", yytext);}
%%

int main(){
    yylex();
    return 0;
}