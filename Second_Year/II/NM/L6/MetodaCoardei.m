%Patrulescu 2020% 
%este implementata  metoda Coardei
clear 
clc
close all

tipex='ex1';
Nmax=1000;%numarul de iteratii maxim
a=0;b=1.5;

x0=0.75; % valorea de start
fa=f(a,tipex); fb=f(b,tipex);% se calculeaza valorile functiei in a si b
count=1;% contor pt iteratii
epsilon=10^(-10);% "pragul" pt conditia de stop

tic% masurarea timpului de executie
while count<Nmax % cat timp nu s-a depasit numarul maxim de iteratii
    x1=x0-(b-a)/(fb-fa)*f(x0,tipex); % se calculeaza noua iteratie
    count=count+1;
    if abs(x1-x0)<epsilon % daca diferenta intre doua iteratii consecutive este suficient de mica ne oprim
      break
    end
    x0=x1;
end
timp=toc;% masurarea timpului de executie folosind comanda tic-toc
fprintf('Numarul de iteratii este %d\n',count)% afisarea numarului de iteratii
fprintf('Solutia aproximata cu metoda Coardei %f\n',x1) % afisarea solutiei
fprintf('Timpul necesar este %f secunde\n',timp)


 