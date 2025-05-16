function rez=DetOmegaOpt(A)
% functie care calculeaza parametrul omega optimal pentru metoda SOR

D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);


Tj=inv(D)*(L+U);
rhoj=max(abs(eig(Tj)));
rez=2/(1+sqrt(1-rhoj^2));