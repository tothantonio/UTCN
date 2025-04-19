% Se implementeaza metoda Newton%

clear 
clc
close all

tipex='ex2';
Nmax=1000;%numarul de iteratii maxim


count=1;% contor pentru numarul de ecuatii
x0=0.75; % punctul de pornire
epsilon=10^(-10); % valoarea pentru conditia de stop

tic% masurarea timpului de executie
while count<Nmax % cat timp numarul de iteratii nu depaseste maximul admis
    x1=x0-f(x0,tipex)/fderiv(x0,tipex); % se calculeaza iteratia urmatoarea 
    count=count+1; % se creste numarul de iteratii
    if abs(x1-x0)<epsilon % daca doua iteratii consecutive devin destul de apropiate procedeul se opreste
        break
    end
    x0=x1; % se actualizeaza iteratia 
end
timp=toc;% masurarea timpului de executie folosind comanda tic-toc
fprintf('Numarul de iteratii este %d\n',count)% afisarea numarului de iteratii
fprintf('Solutia aproximata cu metoda Newton %f\n',x1) % afisarea solutiei
fprintf('Timpul necesar este %f secunde\n',timp)
    

    