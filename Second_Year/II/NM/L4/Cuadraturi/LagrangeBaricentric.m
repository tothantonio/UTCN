function L=LagrangeBaricentric(z,x,y)
%functie care implementeaza interpolarea Lagrange folosind formularea
%baricentrica

n=length(x);
wj=zeros(1,n);
Coef=zeros(1,n);
for i=1:n
    if z==x(i)% verifica daca punctul care se interpoleaza se afla printre noduri
       L=f(x(i));
       return
    end
   p=1;
   for j=[1:i-1,i+1:n]
         p=p*(x(i)-x(j));
   end
  wj(i)=1/p;
  Coef(i)=wj(i)/(z-x(i));
end
L=sum(Coef.*y)/sum(Coef);

%$$$$$$$$$$$$$$$$$$$$$$ 
% S1=0;S2=0;
% wj=zeros(1,n);
% Coef=zeros(1,n);
% for i=1:n
%     if z==x(i)
%        L=fL(x(i));
%        return
%     end
%    p=1;
%    for j=1:n
%       if j~=i
%          p=p*(x(i)-x(j));
%       end
%    end
%   wj(i)=1/p;
%   Coef(i)=wj(i)/(z-x(i));
%   S1=S1+Coef(i)*y(i);
%   S2=S2+Coef(i);
%   
% end
% L=S1/S2;






