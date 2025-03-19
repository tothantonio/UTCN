function x=Cebisev(a,b,nc)
%functie care returneaza nodurile Cebisev corespunzatoare intervalului [a,b]
x=0.5*(a+b)+0.5*(b-a)*cos((2*(1:nc)-1)/(2*nc)*pi);