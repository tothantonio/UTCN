function [A,b,solexact]=DateSistem(n,tipex)
%functie care furnizeaza datele sistemului: matricea sistemului si vectorul
%termenilor liberi
switch tipex
    case 'ex1'
A=(diag(5*ones(1,n)))+diag(-ones(1,n-1),-1)+diag(-ones(1,n-1),1);
b(1,1)=4; b(2:n-1,1)=3*ones(1,n-2); b(n,1)=4;
solexact=ones(n,1);
    case 'ex2'
A=diag(5*ones(1,n))+diag(-ones(1,n-1),1)+diag(-ones(1,n-1),-1)+diag(-ones(1,n-3),3)+diag(-ones(1,n-3),-3);
b(1,1)=3; b(2,1)=2; b(3,1)=2; b(4:n-3,1)=ones(1,n-6); b(n-2,1)=2; b(n-1,1)=2; b(n,1)=3;
solexact=ones(n,1);
    case 'ex3'
    A=[2,-1,1;2,2,2;-1,-1,2];
    b=[-1;4;-5];
    solexact=[1,2,-1];
end
