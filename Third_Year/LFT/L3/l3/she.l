D   he
    int s, h;
%%
s{D}      s++;
{D}       h++;
\n        ;
.         ;

%%
yywrap(){
  printf("She: %i; he:%i", s, h);
  return 1;
}

