%Factorizare Crout
%A=[10,2,4,1,2;1,11,3,4,1;3,11,22,3,2;2,3,4,23,1;2,3,2,1,17];% matricea care trebuie factorizata
A=[2,3;4,7]

fprintf('Matricea este\n')
disp(A)

n=max(size(A)); % se determina dimensiunea lui A
L=zeros(n); %initializarea lui L si U pentru factorizarea Crout
U=eye(n);

%Algoritmul Crout
for k=1:n
   for i=k:n
       Sp1=0;
       for r=1:k-1
           Sp1=Sp1+L(i,r)*U(r,k);
       end
       L(i,k)=A(i,k)-Sp1;
   end
   for j=k+1:n
       Sp2=0;
       for r=1:k-1
           Sp2=Sp2+L(k,r)*U(r,j);
       end
       U(k,j)=(A(k,j)-Sp2)/L(k,k);
   end
end
fprintf('Matricile L si U pentru algoritmul Crout sunt\n')
disp(L)
disp(U)
