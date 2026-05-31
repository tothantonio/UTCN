%{
#include "y.tab.h"
%}

%%
[a-z]          ;
0              return *yytext;
1              return *yytext;
             
