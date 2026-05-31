%{
#include "y.tab.h"
%}
%option yylineno

%%
:     			return COLON;
"db_type"   		return TYPE;
"db_name" 		return NAME;
"db_table_prefix" 	return TABLE_PREFIX;
"db_port" 		return PORT;

[a-zA-Z][_a-zA-Z0-9]*   {yylval.svalue = yytext;
			return IDENTIFIER;
                        }
[1-9][0-9]*		{
                        yylval.ivalue = atoi(yytext);
			return INTEGER;
                        }
[ \t\n]			;
.		       printf("unexpected character\n");


%%

