function rez=Trapez(Dif,F,n)
rez=sum(0.5*Dif.*(F(1:n)+F(2:n+1)));