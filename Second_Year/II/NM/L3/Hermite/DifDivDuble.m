function [z,A]=DifDivDuble(x,f,fd)
%functie care calculeaza diferentele divizate cu noduri duble, varianta
%nevectorizata


n=length(x);
z=zeros(1,2*n);
A=zeros(2*n,2*n);

z(1:2:2*n-1)=x;
z(2:2:2*n)=x;
A(1:2:2*n-1,1)=f';
A(2:2:2*n,1)=f';
A(1:2:2*n-1,2)=fd';
for i=2:2:2*n-2
   A(i,2)=(A(i+1,1)-A(i,1))/(z(i+1)-z(i));
end

for j=3:2*n
  for i=1:2*n-j+1
     A(i,j)=(A(i+1,j-1)-A(i,j-1))/(z(i+j-1)-z(i));
  end
end
