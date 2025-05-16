%Programul implementeaza Metoda Eliminarii lui Gauss (MEG) cu pivot partial. 
%Sistemul se va rezolva folosind:
%1) folsoind functia \ din Matlab
%2) folsoind MEG cu pivot partial 
%3) folsoind MEG cu pivot partial, lucrand pe matricea extinsa
% Pentru analiza timpului de executie se ruleaza fiecare implementare de un
% anumit numar de ori ("realizari") si apoi se face media timpilor de executie

clc
clear 


Timp1=0;Timp2=0;Timp3=0;%initializarea timpilor de executie
As=[10,-7,0;-3,2,6;5,-1,5];%matricea sistemului
bs=[7,4,6]';%vectorul termenilor liberi


rulari=10000;% numarul de rulari pentru a determina timpul de executie

fprintf('Matricea sistemului si vectorul termenilor liberi\n')
disp(As)% afisarea matricei sistemului
disp(bs)% afisarea vectorului b

for k=1:rulari

tic% implemtarea folosind \ din Matlab
xm=As\bs;
timp1=toc;
Timp1=Timp1+timp1;

A=As;
b=bs;
tic % implementarea clasica a MEG cu pivot partial
    n=length(A);
    x=zeros(1,n);
  for i=1:n-1 %determinarea pivotului si interschimbarea liniilor
     m=abs(A(i,i)); 
     p=i;
     for j=i+1:n
      if m<abs(A(j,i))
          m=abs(A(j,i));
          p=j;
      end
     end
     if A(p,i)==0
     fprintf('Sistemul nu are solutie\n')
     break
     end
     if p~=i
        aux=A(p,:);
        A(p,:)=A(i,:);
        A(i,:)=aux;
        auxb=b(p);
        b(p)=b(i);
        b(i)=auxb;
     end
     for j=i+1:n
         m(j,i)=A(j,i)/A(i,i);%calcularea multiplicatorilor
         A(j,:)=A(j,:)-m(j,i)*A(i,:);
         b(j)=b(j)-m(j,i)*b(i);
     end
  end

  if A(n,n)==0% substitutia regresiva
   fprintf('Sistemul nu are solutie')
  else
   x(n)=b(n)/A(n,n);
   for i=n-1:-1:1
    x(i)=(b(i)-sum(A(i,i+1:n).*x(i+1:n)))/A(i,i);    
   end
  end
timp2=toc;
Timp2=Timp2+timp2;



A=[As bs];
tic
    n=length(A)-1;
    xe=zeros(1,n);
    for i=1:n-1%determinarea pivotului si interschimbarea liniilor
      m=abs(A(i,i)); 
      p=i;
      for j=i+1:n
       if m<abs(A(j,i))
           m=abs(A(j,i));
           p=j;
       end
      end
      if A(p,i)==0
      fprintf('Sistemul nu are solutie\n')
      break
      end
      if p~=i
         aux=A(p,:);
         A(p,:)=A(i,:);
         A(i,:)=aux;
      end
      for j=i+1:n
          m(j,i)=A(j,i)/A(i,i);%calcularea multiplicatorilor
          A(j,:)=A(j,:)-m(j,i)*A(i,:);
     end
   end
  if A(n,n)==0 %substitutia regresiva
    fprintf('Sistemul nu are solutie')
   else
    xe(n)=A(n,n+1)/A(n,n);
    for i=n-1:-1:1
     xe(i)=(A(i,n+1)-sum(A(i,i+1:n).*xe(i+1:n)))/A(i,i);    
    end
  end
timp3=toc;
Timp3=Timp3+timp3;

end

Solutii=[xm x' xe'];
fprintf('Solutiile pentru cele trei implementari\n')
disp(Solutii)% afisarea solutiilor pentru cele 3 tipuri de implementari

fprintf('TIMPII DE EXECUTIE PENTRU CELE %d DE RULARI\n',rulari)
fprintf('Timpul pentru functia din Matlab %f\n',Timp1)
fprintf('Timpul pentru MEG cu pivot partial %f\n', Timp2)
fprintf('Timpul pentru MEG cu pivot partial lucrand pe matricea extinsa %f\n',Timp3)



