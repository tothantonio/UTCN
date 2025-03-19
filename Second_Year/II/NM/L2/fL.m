function y=fL(x,tipex)
%functie care "returneaza" valorile functiei in punctul x (teoretic functia nu se cunoaste, doar anumite valori-se foloseste pentru verificari)
switch tipex
    case 'ex1'
       y=sin(2*pi*x);
    case 'ex2'
        y=1./(1+x.^2);
    case 'ex3'
        y=exp(-x.^2);
 end