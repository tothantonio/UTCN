function L=Lagrange(z,x)
%functie care calculeaza valorile polinoamelor fundamentale Lagrange in punctul/punctele z
n=length(x);
m=length(z);
L=zeros(n,m);

  for i=1:n
      Polinom=ones(1,m); 
   for j=[1:i-1,i+1:n]
          Polinom=Polinom.*(z-x(j))/(x(i)-x(j));
   end
   L(i,:)=Polinom;
  end

  