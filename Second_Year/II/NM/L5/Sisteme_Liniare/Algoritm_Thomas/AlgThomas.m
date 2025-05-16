function x=AlgThomas(a,b,c,r)
%functie care implementeaza algoritmul Thomas pentru matrici tridiagonale

n=length(a);
d=zeros(1,n);
y=zeros(1,n);
x=zeros(1,n);

d(1)=c(1)/a(1);
y(1)=r(1)/a(1);

for i=1:n-1
 num=a(i+1)-b(i+1)*d(i);
 d(i+1)=c(i+1)/num;
 y(i+1)=(r(i+1)-b(i+1)*y(i))/num;
end

x(n)=y(n);
for i=n-1:-1:1
  x(i)=y(i)-d(i)*x(i+1);
end

