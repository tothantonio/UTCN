clear
clc
close all

x=linspace(0,6,13);% nodurile de interpolare
f=exp(sin(0.5*x)); % valorile functiei pentru noduri
fd=0.5*exp(sin(0.5*x)).*cos(0.5*x);
Al=DiferenteDivizate(x,f);% se calculeaza diferentele divizate
[zh,Ah]=DifDivDuble(x,f,fd);% se calculeaza diferentele divizate pentru noduri duble

u=0:0.05:6;%punctele pentru polinomul Hermite si Lagrange-Newton
Exact=exp(sin(u)); % valoarea exacta a functiei pentru aceste puncte
Herm=zeros(1,length(u));
Lagr=zeros(1,length(u));
for k=1:length(u)
     Herm(k)=Newton_Polinom(Ah,zh,u(k));
     Lagr(k)=Newton_Polinom(Al,x,u(k));
end
 
Erh=abs(Exact-Herm);
Erl=abs(Exact-Lagr); 

figure(1)
hold on
box on
title('Interpolare Hermite cu noduri duble')
plot(u,exp(sin(u)),'r')
plot(u,Herm,'b*')

figure(2)
hold on
box on
title('Eroarea pentru interpolarea Hermite')
plot(u,log10(abs(Erh)),'b*')

figure(3)
hold on
box on
title('Interpolare Lagrange cu diferente divizate')
plot(u,exp(sin(u)),'r')
plot(u,Lagr,'b*')

figure(4)
hold on
box on
title('Eroarea pentru interpolarea Lagrange')
plot(u,log10(abs(Erl)),'b*')
