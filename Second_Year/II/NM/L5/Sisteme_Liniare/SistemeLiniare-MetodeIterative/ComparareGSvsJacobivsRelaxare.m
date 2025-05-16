%functie care compara metoda GaussSeidel cu metoda Jacobi si cu SOR(omega)
%cu omega ales dupa formula "optima" (vezi documentatie seminar)

clc
clear 
close all

tipex='ex3';% selectarea exemplului dorit

epsilonvect=10.^(-1:-1:-15);%vector care contine valorile de stop "pragul"
le=length(epsilonvect);% lungimea vectorului

%initializarea numarului de iteratii pentru fiecare metoda in parte
countJv=zeros(1,le);
countGSv=zeros(1,le);
countSORv=zeros(1,le);

n=100;%dimensiunea sistemului
Nr_it=1000; % numarul maxim e iteratii admis 
[A,b,solexact]=DateSistem(n,tipex);% datele sistemului

%%%%%%% Pt a vedea forma sistemului consideram n=7%%%%%%%
[Ag,bg,solexactg]=DateSistem(7,tipex);
fprintf('Forma matricei A, a solutiei si a vectorul b\n')
fprintf('Matricea A\n')
disp(Ag)
fprintf('Vectorul b\n')
disp(bg)
fprintf('Solutia exacta\n')
disp(solexactg)
%%%%%%%

omega=DetOmegaOpt(A);% se determina omega_optim pentru metoda relaxarii

fprintf('Numarul de iteratii atunci cand limita de stop variaza\n')
fprintf('Epsilon\t\t\t\tJacobi\t\t\t Gauss-Seidel\t\tSOR\n')
for k=1:le
 epsilon=epsilonvect(k);
 [xJv,countJv(k)]=JacobiVectorizat(A,b,Nr_it,epsilon);
 [xGSv,countGSv(k)]=GaussSeidelVectorizat(A,b,Nr_it,epsilon);
  if (omega<=0)||(omega>=2)
      countSORv(k)=0;
  else
    [xSORv,countSORv(k)]=SORvectorizat(A,b,omega,Nr_it,epsilon);
  end
 fprintf('%e\t\t\t%d\t\t\t\t\t%d\t\t\t%d\n',epsilon,countJv(k),countGSv(k),countSORv(k))

end

figure(1)
hold on 
box on
plot(1:le,countJv,'b*')
plot(1:le,countGSv,'ro')
plot(1:le,countSORv,'gs')
legend('Jacobi','Gauss-Seidel', 'SOR(omega)')
ylabel('Numar de iteratii')
xlabel('$\varepsilon$','Interpreter','Latex','FontSize',22)



