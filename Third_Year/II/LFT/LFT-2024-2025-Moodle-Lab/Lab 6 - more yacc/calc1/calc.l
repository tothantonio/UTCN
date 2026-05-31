%{
#include "y.tab.h"
%}
%%
"print"				   {return print;}
"exit"				   {return exit_command;}
[a-zA-Z]			   { /* yylval.id = Your code here; */ }
[0-9]+                             {/*yylval.num = Your code here */}
[ \t\n]                ;
[-+=;]           	   {return yytext[0];}
.                      {ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}

