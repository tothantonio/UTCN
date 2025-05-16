% Functie care genereaza factorizarea Doolittle si factorizarea Crout pentru o matrice diagonal dominanta 

clc
clear

%A=[10,2,4,1,2;1,11,3,4,1;3,11,22,3,2;2,3,4,23,1;2,3,2,1,17];% matricea care trebuie factorizata
A=[2,3;4,7]
fprintf('Matricea este\n')
disp(A)

n=max(size(A)); % se determina dimensiunea lui A
L=eye(n); %initializarea lui L si U pentru factorizarea Doolittle
U=zeros(n);

%Algoritmul Doolitle
for k=1:n
   for j=k:n
       Sp1=0;
       for r=1:k-1
           Sp1=Sp1+L(k,r)*U(r,j);
       end
       U(k,j)=A(k,j)-Sp1;
   end
   for i=k+1:n
       Sp2=0;
       for r=1:k-1
           Sp2=Sp2+L(i,r)*U(r,k);
       end
       L(i,k)=(A(i,k)-Sp2)/U(k,k);
   end
end
fprintf('Matricile L si U pentru algoritmul Doolittle sunt\n')
disp(L)
disp(U)

