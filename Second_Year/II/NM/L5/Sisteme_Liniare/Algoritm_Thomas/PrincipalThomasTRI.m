% functie care implementeaza algoritmul Thomas folosind MEG (nu fatorizarea!)
clc
clear 
close all

fprintf('Matricea sistemului este de forma \n')% pentru a vedea cum arata matricea sistemului consideram n=7
T7=(diag(5*ones(1,7)))+diag(-ones(1,7-1),-1)+diag(-ones(1,7-1),1);
disp(T7)

n=100;
exact=ones(1,n);
r(1,1)=4; r(2:n-1,1)=3*ones(1,n-2); r(n,1)=4;%vectorul termenilor liber

%Algoritmul Thomas
a=5*ones(1,n);%vectorii pentru algoritmul Thomas
b=[0,-ones(1,n-1)];
c=[-ones(1,n-1),0];


tic 
xth=AlgThomas(a,b,c,r);
timpth=toc;
fprintf('Timpul de executie pentru algoritmul Thomas %.10f\n',timpth)
Eroareth=norm(exact-xth,'Inf');
fprintf('Eroarea pentru algoritmul Thomas %.15f\n',Eroareth)
fprintf('\n\n')

%Metoda eliminarii lui Gauss si \ din Matlab
T=(diag(5*ones(1,n)))+diag(-ones(1,n-1),-1)+diag(-ones(1,n-1),1);%matricea sistemului

tic
xeg=ElimGaussPivPartial(T,r);%solutia calculata folosind metoda eliminarii lui Gauss
timpeg=toc;
fprintf('Timpul de executie pentru metoda eliminarii lui Gauss %.10f\n',timpeg)
Eroareeg=norm(exact-xeg,'Inf');
fprintf('Eroare pentru metoda eliminarii lui Gauss%.15f\n',Eroareeg)

fprintf('\n\n')
tic
xm=T\r;% solutia calculata  cu functia \ din Matlab;
timpm=toc;
fprintf('Timpul de executie pentru metoda mldivide din MATLAB %.10f\n',timpm)
Eroarem=norm(exact-xm','Inf');
fprintf('Eroare pentru functia din MATLAB %.15f\n',Eroarem)