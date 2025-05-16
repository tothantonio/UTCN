%Program care implementeaza metoda substitutiei progresive pentru sisteme triunghiulare inferior
%Sistemul triunghiular Lx=b se rezolva folosind: 
%1) comanda \ din Matlab; 
%2) folosind substitutia directa-implementare vectorizata
%3) folsind substitutia directa-implementare clasica
% Pentru analiza timpului de executie se ruleaza fiecare implementare de un
% anumit numar de ori ("realizari") si apoi se face media timpilor de executie

clc
clear 

fprintf('REZOLVAREA SISTEMELOR TRIUNGHIULARE INFERIOR\n')
Timp1=0;Timp2=0;Timp3=0;%initializarea timpilor de executie
L=[1,0,0;2,1,0;-1,2,1];%matricea triunghiulara inferior
b=[1;0;-2];%vectorul termenilor liberi
rulari=10000;% numarul de rulari pentru a determina timpul de executie

fprintf('Matricea sistemului si vectorul termenilor liberi\n')
disp(L)% afisarea matricei L
disp(b)% afisarea vectorului b

for k=1:rulari
tic% implemtarea folosind \ din Matlab
 xm=L\b;
timp1=toc;
Timp1=Timp1+timp1;

tic % implementarea vectorizata
n=length(L);
x=zeros(1, n);
x(1)=b(1)/L(1,1);
for i=2:n
x(i)=(b(i)-sum(L(i,1:i-1).*x(1:i-1)))/L(i,i);    
end
timp2=toc;
Timp2=Timp2+timp2;


tic %implementarea clasica
n=length(L);
y=zeros(1, n);
y(1)=b(1)/L(1,1);
for i=2:n
      Sp=0;
     for j=1:i-1
      Sp=Sp+L(i,j)*y(j);
     end
y(i)=(b(i)-Sp)/L(i,i); 
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


