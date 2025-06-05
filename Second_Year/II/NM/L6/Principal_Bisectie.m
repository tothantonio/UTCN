

clc
clear 
close all


epsilon=10^(-10); % pragul erorii
it_max=100;%numarul maxim de iteratii admis

tipex='ex1';% tipul exemplului
[a,b,exact]=Date_pb(tipex);% returneaza datele problemei intervalul si solutia exacta (calculata cu fsolve din Matlab)
 
 x=a:0.01:b;
 Gf=fb_grafic(x,tipex);
    
 figure(1)
 hold on
 box on
 title('Graficul Functiei')
 plot(x,Gf)
 line([a,b],[0,0],'Color','k','LineWidth',1.5)
 plot(exact,0,'r*')
 xlabel('x')
 ylabel('f(x)')

st=fb(a,tipex);
dif=abs(b-a);
k=0; %contor pentru numarul de iteratii
fprintf('It. \t a \t\t\t\t (a+b)/2 \t\t b \t\t\t\t |b-a| \t\t\t Eroarea \n')
while (dif>epsilon)&&(k<it_max)
    m=0.5*(a+b);
    vm=fb(m,tipex);
    k=k+1;
    eroare(k)=m-exact;  %eroarea absoluta la o anumita iteratie
    fprintf('%d \t %.10f \t %.10f \t %13.10f \t %.10f \t %.10f\n',k,a,m,b,dif,eroare(k));
    
    if st*vm<0
        b=m;
    else
        a=m;
        st=vm;
    end
    dif=abs(b-a);
end
if k>=it_max
    fprintf('S-a depasit numarul de iteratii\n')
end


figure(2)
title('Eroarea absoluta')
plot(1:k,log10(abs(eroare)),'b*')
xlabel('Nr. iteratii')
ylabel('lg(abs(Eroare))')


