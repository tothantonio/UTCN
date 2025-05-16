function [x,count]=SORvectorizat(A,b,omega,Nr_it,epsilon)
%functie care aproximeaza solutia unui sistem liniar folosind metoda
%iterativa a relaxarii (SOR)
% Nr_it-numarul maxim de iteratii
% epsilon-eoarea intre doua iteratii consecutive

 n=length(b);% se determina dimensiunea sistemului
 xold=zeros(n,1);% se initializeaza termenii din sirul iteratiilor 
 xnew=zeros(n,1);
 count=0; % se intializeaza contorul pentru numarul de iteratii
 
% Se descompune matricea A=L+D+U
 D=diag(diag(A));
 L=-tril(A,-1);
 U=-triu(A,1);
 iD=inv(D-omega*L);
 
 Tw=iD*((1-omega)*D+omega*U);
 cw=omega*iD*b;

 while count<Nr_it % se genereaza valorile iterative atat timp cat numarul de iteratii nu este depasit
      xnew=Tw*xold+cw;
      count=count+1;
     if norm(xnew-xold,Inf)<epsilon
         break
     end
     xold=xnew;
end
 x=xnew';