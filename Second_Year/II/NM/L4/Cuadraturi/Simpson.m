function rez=Simpson(Dif,F,Fm,n)
rez=sum(Dif.*(F(1:n)+F(2:n+1)+4*Fm))/6;
