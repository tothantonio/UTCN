function x=ElimGaussPivPartial(A,b)
%functie care implementeaza metoda eliminarii lui Gauss cu pivot partial

 n=length(b);% se determina dimensiunea sistemului
 A=[A b]; %se construieste matricea extinsa
 
 x=zeros(1,n);%se initializeaza vectorul solutie cu zero
   for i=1:n-1 % se parcurg primele n-1 linii
       ma=abs(A(i,i)); 
       p=i;
       for j=i+1:n % se determina maximul pe coloana, luand in calcul elementele de sub diagonala principala
        if ma<abs(A(j,i))
            ma=abs(A(j,i));
            p=j;
        end
       end
       if A(p,i)==0
       fprintf('Sistemul nu are solutie\n')
       return
       end
       if p~=i % se interschimba linia p cu linia i, i.e. pivotarea
          aux=A(p,:);
          A(p,:)=A(i,:);
          A(i,:)=aux;
       end
      for j=i+1:n
           m(j,i)=A(j,i)/A(i,i);% se calculeaza multitiplicatorii
           A(j,:)=A(j,:)-m(j,i)*A(i,:);
      end
    end
   if A(n,n)==0
     fprintf('Sistemul nu are solutie')
     return
   else
     x(n)=A(n,n+1)/A(n,n);% se aplica substitutia inversa
     for i=n-1:-1:1
      x(i)=(A(i,n+1)-sum(A(i,i+1:n).*x(i+1:n)))/A(i,i);    
     end
   end
