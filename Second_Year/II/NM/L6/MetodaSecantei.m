%Patrulescu 2020% 
%este implementata  metoda Secantei
clear 
clc
close all

tipex='ex1';
Nmax=1000;%numarul de iteratii maxim

x1=0; x2=0.75; % valorile de start (spre deosebire de Newton sunt doua valori)
f1=f(x1,tipex); f2=f(x2,tipex);% se calculeaza valorile functiei pt "punctele de pornire"
count=1;% contor pt iteratii
epsilon=10^(-10);% "pragul" pt conditia de stop

tic% masurarea timpului de executie
while count<Nmax % cat timp nu s-a depasit numarul maxim de iteratii
    x3=x2-f2*(x2-x1)/(f2-f1); % se calculeaza noua iteratie
    f3=f(x3,tipex);% se calculeaza valoarea functiei pt noua iteratie
    count=count+1;
    if abs(x3-x2)<epsilon % daca diferenta intre doua iteratii consecutive este suficient de mica ne oprim
      break
    end
    x1=x2;% se actualizeaza iteratiile
    x2=x3;
    f1=f2; % se actualizeaza valorile functiei
    f2=f3;
end
timp=toc;% masurarea timpului de executie folosind comanda tic-toc
fprintf('Numarul de iteratii este %d\n',count)% afisarea numarului de iteratii
fprintf('Solutia aproximata cu metoda Secantei %f\n',x3) % afisarea solutiei
fprintf('Timpul necesar este %f secunde\n',timp)



 