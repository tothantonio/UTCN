
clc
clear 
close all



epsilon=10^(-10);
Nmax=100;
x0=2;
exact=1;

tipphi='ex1';
[sol_aprox,nr_it,err]=MetodaPicard(x0,tipphi,Nmax,epsilon,exact);
fprintf('Solutia este %.14f\n',sol_aprox)
fprintf('Numarul de iteratii este %d \n',nr_it)
fprintf('\n')
[sol_aproxa,nr_ita,erra]=AccelerareAitken(x0,tipphi,Nmax,epsilon,exact);
fprintf('Solutia accelerata este %.14f\n',sol_aproxa)
fprintf('Numarul de iteratii este pt sol. accelerata %d \n',nr_ita)
fprintf('\n')

fprintf('*************************\n')
tipphi='ex2';
[sol_aprox,nr_it,err]=MetodaPicard(x0,tipphi,Nmax,epsilon,exact);
fprintf('Solutia este %.14f\n',sol_aprox)
fprintf('Numarul de iteratii este %d \n',nr_it)
fprintf('\n')
[sol_aproxa,nr_ita,erra]=AccelerareAitken(x0,tipphi,Nmax,epsilon,exact);
fprintf('Solutia accelerata este %.14f\n',sol_aproxa)
fprintf('Numarul de iteratii este pt sol. accelerata %d \n',nr_ita)
fprintf('\n')

figure(1)
hold on
box on
plot(1:nr_it,log10(err),'b*')


fprintf('*************************\n')
x0=2;
tipphi='ex3';
[sol_aprox,nr_it,err]=MetodaPicard(x0,tipphi,Nmax,epsilon,exact);
fprintf('Solutia este %.14f\n',sol_aprox)
fprintf('Numarul de iteratii este %d \n',nr_it)
fprintf('\n')

[sol_aproxa,nr_ita,erra]=AccelerareAitken(x0,tipphi,Nmax,epsilon,exact);
fprintf('Solutia accelerata este %.14f\n',sol_aproxa)
fprintf('Numarul de iteratii este pt sol. accelerata %d \n',nr_ita)
fprintf('\n')

figure(2)
hold on
box on
plot(1:nr_it,log10(err),'ro')
