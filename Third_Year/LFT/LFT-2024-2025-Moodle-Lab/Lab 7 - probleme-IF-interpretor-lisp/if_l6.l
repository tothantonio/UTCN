%{
#include "y.tab.h"
%}

%%

[0-9]+ { yylval.number = atoi(yytext); return NUMBER; }
[a-zA-Z] { yylval.variable = yytext[0]; return ID; }

"IF"|"if" return IF;
"THEN"|"then" return THEN;
"ELSE"|"else" return ELSE;

[()=+\n] return *yytext;
">" return *yytext;

[ \t] ;

%%

int yywrap() {
    return 1;
}