function FormuleCuadratura
clc
clear all
close all


[a,b,exact]=LimiteInterval;% se genereaza captele intervalului si valoarea exacta a integralei definite
Grafice(a,b,8)
vectorptn=100:100:1000;

nv=length(vectorptn);
Im=zeros(1,nv); It=zeros(1,nv); Is=zeros(1,nv); Erm=zeros(1,nv); Ert=zeros(1,nv); Ers=zeros(1,nv);
for k=1:nv
n=vectorptn(k);% nr de subintervale
x=linspace(a,b,n+1); % se genereaza punctele diviziunii, avem n+1 puncte echidistante
% sau se mai pot genera in felul urmator in cazul cand sunt echidistante
%h=(b-a)/n;
%y=(0:n)*h;
Dif=diff(x); % se genereaza diferentele x_i+1-x_i
Mjlc=0.5*(x(1:n)+x(2:n+1)); % se genereaza mijloacele (x_i+x_{i+1})/2
F=f(x);
Fm=f(Mjlc);

Im(k)=Midpoint(Dif,Fm);
It(k)=Trapez(Dif,F,n);
Is(k)=Simpson(Dif,F,Fm,n);

Erm(k)=abs(Im(k)-exact);
Ert(k)=abs(It(k)-exact);
Ers(k)=abs(Is(k)-exact);

fprintf('Erorile pt n=%d\n',n)
fprintf('Midpoint %.10f\n',Erm(k))
fprintf('Trapez %.10f\n',Ert(k))
fprintf('Simpson %.10f\n',Ers(k))
fprintf('___________________________\n')
end




