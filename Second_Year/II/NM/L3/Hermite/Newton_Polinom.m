function rez=Newton_Polinom(A,x,xb)
%functie care calculeaza polinomul Lagrange/Hermite in forma Newton
% A- matricea diferentelor divizate cu noduri simple/duble
% x- vectorul de noduri
% xp -punctul unde se calculeaza polinomul Newton
v=A(1,:);
n=length(x); S=v(1);
P=1;
for i=1:n-1
    P=P*(xb-x(i));
    S=S+P*v(i+1);
end
 rez=S;
