function [x,count]=SOR(A,b,omega,Nr_it,epsilon)
%functie care aproximeaza solutia unui sistem liniar folosind metoda
%iterativa SOR
% Nr_it-numarul maxim de iteratii
% epsilon-eoarea intre doua iteratii consecutive

 n=length(b);% se determina dimensiunea sistemului
 xold=zeros(1,n);% se initializeaza termenii din sirul iteratiilor 
 xnew=zeros(1,n);
 count=0; % se intializeaza contorul pentru numarul de iteratii

 while count<Nr_it % se genereaza valorile iterative atat timp cat numarul de iteratii nu este depasit
    for i=1:n % se construieste iteratia urmatoare
         S1=0; S2=0;
         for j=1:i-1
         S1=S1+A(i,j)*xnew(j);
         end
         for j=i+1:n
           S2=S2+A(i,j)*xold(j);
        end
         xnew(i)=(1-omega)*xold(i)+omega*(b(i)-S1-S2)/A(i,i);
     end
    count=count+1;
   if norm(xnew-xold,Inf)<epsilon
       break
    end
     xold=xnew;
 end
 x=xnew';