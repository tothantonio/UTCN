function [x,count]=Jacobi(A,b,Nr_it,epsilon)
%functie care aproximeaza solutia unui sistem liniar folosind metoda iterativa Jacobi
% Nr_it-numarul maxim de iteratii
% epsilon-eoarea intre doua iteratii consecutive

n=length(b);% se determina dimensiunea sistemului
xold=zeros(1,n);% se initializeaza termenii din sirul iteratiilor 
xnew=zeros(1,n);
count=0; % se intializeaza contorul pentru numarul de iteratii



while count<Nr_it % se genereaza valorile iterative atat timp cat numarul de iteratii nu este depasit
    for i=1:n % se construieste iteratia urmatoare
        S=0;
        for j=1:n
            if i~=j
          S=S+A(i,j)*xold(j);
            end
        end
        xnew(i)=(b(i)-S)/A(i,i);
    end
     count=count+1;
    if norm(xnew-xold,Inf)<epsilon
        break
    end
   
    xold=xnew;
end
x=xnew';