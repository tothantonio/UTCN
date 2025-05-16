function [L,U]=FactorizareLUThomas(a,b,c)

n=length(a);
alph=zeros(1,n);
bet=zeros(1,n);

alph(1)=a(1);
for i=2:n
 bet(i)=b(i)/alph(i-1);
 alph(i)=a(i)-bet(i)*c(i-1);
end

L=diag(ones(1,n))+diag(bet(2:n),-1);
U=diag(alph)+diag(c(1:n-1),1);