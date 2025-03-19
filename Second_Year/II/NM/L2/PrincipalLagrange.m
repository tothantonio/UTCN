
clear 
close all
clc



tipex='ex1';

[a,b]=Interval_interpolare(tipex);

nx=3; %numarul nodurilor folosite (gradul polinomului va fi nx-1)


x=linspace(a,b,nx);% se genereaza punctele echidistante in intervalul [a,b]
y=fL(x,tipex);% se calculeaza valorile y_i, corespunzatoare nodurilor x_i, folosnd functia fL ("teoretic" functia nu se cunoaste, doar valorile in noduri)

xc=Cebisev(a,b,nx); % se calculeaza nodurile Cebisev corespunzatoare intervalului [a,b]
yc=fL(xc,tipex); % se calculeaza valorile y_i corespunzatoare nodurilor Cebisev x_i (nu sunt echidistante)


pasz=0.005;
z=a:pasz:b;
nz=length(z);
fz=fL(z,tipex);%date folosite pentru reprezentarea grafica a functiei


L=Lagrange(z,x);% se calculeaza valoarea polinoamelor fundamentale Lagrange in punctul/punctele z (folosind noduri echidistante)
Lc=Lagrange(z,xc); % se calculeaza valoarea polinoamelor fundamentale Lagrange in punctul/punctele z (folosind noduri Cebisev)

Aprox=AproxLagrange(y,L);% se calculeaza valoarea polinomului de interpolare Lagrange pt noduri echidistante
Aproxc=AproxLagrange(yc,Lc);% se calculeaza valoarea polinomului de interpolare Lagrange pt noduri Cebisev


figure(1)
hold on
box on
title('Polinoame Lagrange folosind noduri echidistante')
plot(x,zeros(1,nx),'r*')
plot(z,L(1:nx,:))

figure(2)
hold on
box on
title('Polinomul Lagrange cu noduri echidistante')
plot(x,y,'r*')
plot(z,Aprox,'g')
plot(z,fz, 'Color','k')
legend('Valori noduri','Polinomul Lagrange','Functia')

figure(3)
hold on
box on
title('Polinoame Lagrange folosind noduri Cebisev')
plot(x,zeros(1,nx),'r*')
plot(z,Lc(1:nx,:))

figure(4)
hold on
box on
title('Polinomul Lagrange cu noduri Cebisev')
plot(xc,yc,'r*')
plot(z,Aproxc,'g')
plot(z,fz, 'Color','k')
legend('Valori noduri','Polinomul Lagrange','Functia')

figure(5)
hold on
box on
title ('Noduri echidistante vs Noduri Cebisev')
plot(x,zeros(1,length(x)),'bo')
plot(xc,ones(1,length(xc)),'r*')
legend('Echiditante','Cebisev')
axis([a-0.1 b+0.1 -0.1 1.1])

figure(6)
hold on
box on
title('Nodurile Cebisev pe cercul unitate')
nxg=12;
xcc=Cebisev(-1,1,nxg);
ycc=sqrt(1-xcc.^2);
teta=0:0.01:pi;
xcerc=cos(teta);
ycerc=sin(teta);
plot(xcerc,ycerc,'Color','k','LineWidth',2)
plot(xcc,ycc,'r*')
plot(xcc,zeros(1,nxg),'bo')
for k=1:nxg
 line([xcc(k),xcc(k)],[0,ycc(k)],'Color','k','LineStyle',':')
end


