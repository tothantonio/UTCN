function SistemeLiniare
%functie care analizeaza diverse metode numerice pentru rezolvarea
%sistemelor liniare

clc
clear all 
close all

n=1000;
tipex='ex2';

tic
[A,b,solexact]=DateSistem(n,tipex);
timpexdatsist=toc;
fprintf('S-a executat functia DateSistem Timp=%s\n',num2str(timpexdatsist))

omega=DetOmegaOpt(A);% se calculeaza parametrul optimal pentru metoda SOR

%Rezolvarea sistemului folosind implementarea din MATLAB
tic
x=A\b;
timpexMATLAB=toc;
fprintf('S-a exacutat implementarea MATLAB Timp=%s\n',num2str(timpexMATLAB))

fprintf('\n')
fprintf('JACOBI\n')
tic
Nr_it=1000; epsilon=10^(-15);
[xJ,countJ]=Jacobi(A,b,Nr_it,epsilon);
timpJac=toc;
fprintf('S-a executat implemetarea Jacobi Timp=%s Iteratii %d\n',num2str(timpJac),countJ)

tic
Nr_it=1000; epsilon=(10^(-15));
[xJv,countJv]=JacobiVectorizat(A,b,Nr_it,epsilon);
timpJacv=toc;
fprintf('S-a executat implemetarea Jacobi vectorizat Timp=%s Iteratii %d\n',num2str(timpJacv),countJv)

fprintf('\n')
fprintf('GAUSS-SEIDEL\n')
tic
Nr_it=1000; epsilon=10^(-15);
[xGS,countGS]=GaussSeidel(A,b,Nr_it,epsilon);
timpGS=toc;
fprintf('S-a executat implemetarea Gauss-Seidel Timp=%s Iteratii %d\n',num2str(timpGS),countGS)

tic
Nr_it=1000; epsilon=10^(-15);
[xGSv,countGSv]=GaussSeidelVectorizat(A,b,Nr_it,epsilon);
timpGSv=toc;
fprintf('S-a executat implemetarea Gauss-Seidel vectorizat Timp=%s Iteratii %d\n',num2str(timpGSv),countGSv)

fprintf('\n')
fprintf('SOR\n')

tic
Nr_it=1000; epsilon=10^(-15);
[xSOR,countSOR]=SOR(A,b,omega,Nr_it,epsilon);
timpSOR=toc;
fprintf('S-a executat implemetarea SOR Timp=%s Iteratii %d\n',num2str(timpSOR),countSOR)

tic
Nr_it=1000; epsilon=10^(-15);
[xSORv,countSORv]=SORvectorizat(A,b,omega,Nr_it,epsilon);
timpSORv=toc;
fprintf('S-a executat implemetarea SOR vectorizat Timp=%s Iteratii %d\n',num2str(timpSORv),countSORv)

%Calculul erorilor
Eram=norm(x-solexact);
Eraj=norm(xJ-solexact);
Erajv=norm(xJv-solexact');
Erags=norm(xGS-solexact);
Eragsv=norm(xGSv-solexact');
Erasor=norm(xSOR-solexact);
Erasorv=norm(xSORv-solexact');



fprintf('\n')
fprintf('\n')

fprintf('ERORILE ABSOLUTE IN NORMA 2 \n')
fprintf('Eroarea pentru implementarea Matlab %.20f\t %.5f\n',Eram,log10(Eram))
fprintf('\n')
fprintf('Eroarea pentru implementarea Jacobi %.20f %.5f \n',Eraj,log10(Eraj))
fprintf('Eroarea pentru implementarea Jacobi vectorizat %.20f %.5f \n',Erajv,log10(Erajv))
fprintf('\n')
fprintf('Eroarea pentru implementarea Gauss-Seidel %.20f %.5f \n',Erags,log10(Erags))
fprintf('Eroarea pentru implementarea Gauss-Seidel vectorizat %.20f %.5f \n',Eragsv,log10(Eragsv))
fprintf('\n')
fprintf('Eroarea pentru implementarea SOR %.20f %.5f \n',Erasor,log10(Erasor))
fprintf('Eroarea pentru implementarea SOR vectorizat %.20f %.5f \n',Erasorv,log10(Erasorv))


