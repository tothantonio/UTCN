%{
#include "myscanner.h"
%}

%%
   //your code here: write rules to identify all the tokens from myscanner.h 
   //do not forget to print an error message in case unexpected characters are identified


%%
int yywrap(void)
{
	return 1;
}
