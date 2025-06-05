function y=fb(x,tipex)
% functie folosita pentru a determina ecuatia neliniara
switch tipex
    case 'ex1'
    y=(x/2)^2-sin(0.5*x);
    case 'ex2'
    y=x/8*(63*x^4-70*x^2+15);
end