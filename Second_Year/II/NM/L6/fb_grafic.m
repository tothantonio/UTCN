function y=fb_grafic(x,tipex)
% functie folosita pentru reprezentarea grafica 
switch tipex
    case 'ex1'
    y=(x/2).^2-sin(x);
    case 'ex2'
    y=x/8.*(63*x.^4-70*x.^2+15);
end