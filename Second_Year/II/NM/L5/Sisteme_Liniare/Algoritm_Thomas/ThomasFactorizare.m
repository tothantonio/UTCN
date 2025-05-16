% functie care implementeaza algoritmul Thomas folosind fatorizarea
clc

clear 
close all

fprintf('Matricea  este de forma \n')% pentru a vedea cum arata matricea sistemului consideram n=7
T7=(diag(5*ones(1,7)))+diag(-ones(1,7-1),-1)+diag(-ones(1,7-1),1);
disp(T7)

n=8;

%Algoritmul Thomas
a=5*ones(1,n);%vectorii pentru algoritmul Thomas
b=[0,-ones(1,n-1)];
c=[-ones(1,n-1),0];
T=(diag(5*ones(1,n)))+diag(-ones(1,n-1),-1)+diag(-ones(1,n-1),1);% matricea tridiagonala care trebuie factorizata


[L,U]=FactorizareLUThomas(a,b,c);
fprintf('Eroarea de factorizare este %f\n',norm(T-L*U,Inf))



