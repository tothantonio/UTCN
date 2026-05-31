%token Word
%{
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <string.h>
char finalResult[100];  // rezultat parsare
%}

%%
text: ;
    |text Word  {
    		if($2<0) printf("%s",finalResult); 
    		else
    		printf("Eroare input \n");
    		}
%%

/*http://www.programmingsimplified.com/c/source-code/c-substring*/
char *substring(char *string, int position, int length) 
{
     char *pointer;
      int c;
	   pointer = malloc(length+1);
	   if (pointer == NULL)
	   {
		  printf("Unable to allocate memory.\n");
		  exit(EXIT_FAILURE);
	   } 
	   for (c = 0 ; c < position -1 ; c++) 
		  string++; 
 
	   for (c = 0 ; c < length ; c++)
	   {
		  *(pointer+c) = *string;      
		  string++;   
	   }
 	   *(pointer+c) = '\0';
 	   return pointer;
}

int findword(char *word)
{
	int i=1;
	int aux=0;
	char* type="";
	int length = (int)strlen(word);
	while(i<length)
	{
	  if(word[i]=='>')
		break;
	   i++;
	}	
	char* word1="";
	word1 = substring( word, 2, i-1);/*luam de la al doilea caracter pana la >  */ 	
	if(strcmp(word1,"class")==0) /*e class verificam modifier-ul*/
	{		
		if(word[i+1]=='+')   //public
		{		
         	strcpy(finalResult,"public ");
		}
		if(word[i+1]=='-')  //private
		{		
         	strcpy(finalResult,"private ");
		}
		if(word[i+1]=='#')   //protected
		{		
         	strcpy(finalResult,"protected ");
		}
		if(word[i+1]==' ') //default is internal
		{		
         	strcpy(finalResult,"internal ");
		}
		strcat(finalResult,"class ");  
		i+=3;
		aux=i;
		while(i  <length)
		{
	  	if(word[i]=='<')
				break; /*daca am ajungs dupa numele clasei*/
	   	i++;
		}
		word1 = substring( word, aux, i-aux+1);
		strcat(finalResult,word1);
		strcat(finalResult,"{");	
	}
	if(strcmp(word1,"attribute")==0)
	{	
		if(word[i+1]=='+')
		{		
         	strcpy(finalResult,"public ");
		}
		if(word[i+1]=='-')
		{		
         	strcpy(finalResult,"private ");
		}
		if(word[i+1]=='#')
		{		
         	strcpy(finalResult,"protected ");
		}
		if(word[i+1]==' ')
		{		
         	strcpy(finalResult,"internal ");
		}
		i+=3;
		aux=i;
		while(i<length)
		{
	  	if(word[i]==':')
		break;
	   	i++;
		}
		word1 = substring( word, aux, i-aux+1);
		i+=3;
		aux=i;
		while(i<length)
		{
	  	if(word[i]=='<')
		break;
	   	i++;
		}
		type = substring( word, aux, i-aux+1);
		if(strcmp(type,"Integer")==0)
		{
	          strcat(finalResult,"int");	
		}
		else if(strcmp(type,"Boolean")==0)
		{
	          strcat(finalResult,"bool");	
		}
		else if(strcmp(type,"Float")==0)
		{
	          strcat(finalResult,"float");	
		}
		else if(strcmp(type,"Double")==0)
		{
	          strcat(finalResult,"double");	
		}
		else if(strcmp(type,"Char")==0)
		{
	          strcat(finalResult,"char");	
		}
		else if(strcmp(type,"String")==0)
		{
	          strcat(finalResult,"string");	
		}
		else
		strcat(finalResult,type);
		strcat(finalResult, word1);
		strcat(finalResult, ";");		
	}
	if(strcmp(word1,"method")==0)	
	{
		if(word[i+1]=='+')
		{		
         	strcpy(finalResult,"public ");
		}
		if(word[i+1]=='-')
		{		
         	strcpy(finalResult,"private ");
		}
		if(word[i+1]=='#')
		{		
         	strcpy(finalResult,"protected ");
		}
		if(word[i+1]==' ')
		{		
         	strcpy(finalResult,"internal ");
		}
		i+=3;
		aux=i;
		while(i<length)
		{
	  	if(word[i]=='(')
		break; 
	   	i++;
		}

		if(word[i+1]==')')
		{
		word1 = substring( word, aux, i-aux+3);
		i+=5;
		}

		else // daca avem parametru
		{
			i+=2;		  
			aux=i;
			while(i<length)
			{
	  			if(word[i]==':')
				break;
				i++;
			}
			char* word2 = substring( word, aux, i-aux-1); 	//salvam numele parametrului
		
			i+=2;
			aux=i;
			while(i<length) 
			{
				if(word[i]==')')
				break;
				i++;
			}	
			char* word3 = substring( word, aux, i-aux-1); //salvam tipul parametrului
			if(strcmp(word3,"Integer")==0)
			{
			     strcat(finalResult,"int");	
			}
			else if(strcmp(word3,"Boolean")==0)
			{
				strcat(finalResult,"bool");	
			}
			else if(strcmp(word3,"Float")==0)
			{
			   strcat(finalResult,"float");	
			}
			else if(strcmp(word3,"Double")==0)
			{
			   strcat(finalResult,"double");	
			}
			else if(strcmp(word3,"Char")==0)
			{
			   strcat(finalResult,"char");	
			}
			else if(strcmp(word3,"String")==0)
			{
			     strcat(finalResult,"string");	
			}
			else
				strcat(finalResult,word3);
			strcat(finalResult,word2);
			strcat(finalResult,") ");
		}		
				
		aux=i;
		while(i<length)
		{
	  		if(word[i]=='<')
			break;
	   		i++;
			}
			type = substring( word, aux, i-aux+1);	
			if(strcmp(type,"Integer")==0)
			{
				  strcat(finalResult,"int");	
			}
			else if(strcmp(type,"Boolean")==0)
			{
				  strcat(finalResult,"bool");	
			}
			else if(strcmp(type,"Float")==0)
			{
				  strcat(finalResult,"float");	
			}
			else if(strcmp(type,"Double")==0)
			{
				  strcat(finalResult,"double");	
			}
			else if(strcmp(type,"Char")==0)
			{
				  strcat(finalResult,"char");	
			}
			else if(strcmp(type,"String")==0)
			{
				  strcat(finalResult,"string");	
			}
			else
			strcat(finalResult,type);

			strcat(finalResult, word1);
			strcat(finalResult, "{ }");	
	}
	if(strcmp(word1,"end")==0)	
		strcpy(finalResult,"} \n");
	return -1; 
}
#include "lex.yy.c"
int main(int argc, char* argv[])
{
	yyparse();	
	return 0;
}

int yyerror(char *s){fprintf(stderr, "%s\n", s);}
