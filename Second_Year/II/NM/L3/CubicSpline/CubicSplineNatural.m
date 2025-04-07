clc
clear 
close all

x=0:0.25:10;
f=sin(2*x).*exp(sin(2*x));

n=length(x);
A=zeros(n,n);
rt=zeros(1,n);
h=diff(x);
C=zeros(1,n-1);
Ct=zeros(1,n-1);

A(1,1)=1; A(n,n)=1;% conditii pentru spline natural
rt(1)=0; rt(n)=0;% conditti pentru spline natural
for i=2:n-1
 A(i,i)=2*(h(i-1)+h(i));
 A(i,i-1)=h(i-1);
 A(i,i+1)=h(i);
 rt(i)=3/h(i)*(f(i+1)-f(i))-3/h(i-1)*(f(i)-f(i-1));
end
rt=rt';
M=A\rt;
M=M';
for j=1:n-1
    C(j)=(f(j+1)-f(j))/h(j)-(M(j+1)-M(j))*h(j)/6;
    Ct(j)=f(j)-M(j)*(h(j))^2/6;
end

Coef=[(M(1:end-1)/(6*h(j)))' (M(2:end)/(6*h(j)))' C' Ct'];

figure(1)
hold on
box on

 for i=1:n-1
   z=x(i):h/10:x(i+1);
   P=Coef(i,1)*(x(i+1)-z).^3+Coef(i,2)*(z-x(i)).^3+Coef(i,3)*(z-x(i))+Coef(i,4);
   plot(z,P,'r');
 end


plot(x,f,'b*')


