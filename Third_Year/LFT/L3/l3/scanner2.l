%{
#include <stdio.h>
%}

%%

\"[^"]* {
    if (yytext[yyleng-1] == '\\')
        yymore();
    else
        printf("%s\n", yytext);
}

.|\n   ;

%%

int main()
{
    yylex();
    return 0;
}