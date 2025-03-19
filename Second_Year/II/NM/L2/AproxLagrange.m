function rez=AproxLagrange(y,L)
%functie care calculeaza valoarea polinomului Lagrange folosind valorile
%polinoamelor fundamentale din matricea L (valorile fiecarui polinom fundamental sunt situate pe coloana)

[n,m]=size(L);

rez=zeros(1,m);

for k=1:m
 rez(k)=sum(L(:,k)'.*y);
end
