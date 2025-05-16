%Program care implementeaza metoda substitutiei progresive pentru sisteme triunghiulare superior
%Sistemul triunghiular Ux=b se rezolva folosind: 
%1) comanda \ din Matlab; 
%2) folosind substitutia inversa-implementare vectorizata
%3) folsind substitutia inversa-implementare clasica
% Pentru analiza timpului de executie se ruleaza fiecare implementare de un
% anumit numar de ori ("realizari") si apoi se face media timpilor de executie
clc
clear 

fprintf('REZOLVAREA SISTEMELOR TRIUNGHIULARE SUPERIOR\n')

Timp1=0;Timp2=0;Timp3=0;%initializarea timpilor de executie
U=[1 2 0 4; 4 5 6 1; 0 1 1 3; -1 -2 3 2];%matricea triunghiulara superior
b=[1; 2; 3; 0];%vectorul termenilor liberi
rulari=10000;% numarul de rulari pentru a determina timpul de executie

fprintf('Matricea sistemului si vectorul termenilor liberi\n')
disp(U)% afisarea matricei U
disp(b)% afisarea vectorului b

for k=1:rulari
tic% implemtarea folosind \ din Matlab
 xm=U\b;
timp1=toc;
Timp1=Timp1+timp1;


tic % implementarea vectorizata
n=length(U);
x=zeros(1, n);
x(n)=b(n)/U(n,n);
for i=n-1:-1:1
x(i)=(b(i)-sum(U(i,i+1:n).*x(i+1:n)))/U(i,i);    
end
timp2=toc;
Timp2=Timp2+timp2;



tic %implementarea clasica
n=length(U);
y=zeros(1, n);
y(n)=b(n)/U(n,n);
for i=n-1:-1:1
      Sp=0;
     for j=i+1:n
      Sp=Sp+U(i,j)*y(j);
     end
y(i)=(b(i)-Sp)/U(i,i);    
end
timp3=toc;
Timp3=Timp3+timp3;

end

Solutii=[xm x' y'];
fprintf('Solutiile pentru cele trei implementari\n')
disp(Solutii)% afisarea solutiilor pentru cele 3 tipuri de implementari

fprintf('TIMPII DE EXECUTIE PENTRU CELE %d DE RULARI\n',rulari)
fprintf('Timpul pentru functia din Matlab %f\n',Timp1)
fprintf('Timpul pentru implementarea vectorizata %f\n', Timp2)
fprintf('Timpul pentru implementarea clasica %f\n',Timp3)

