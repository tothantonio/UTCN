function [y]=Phi(x,tipphi)
switch tipphi
    case 'ex1'
        y=log(x*exp(x));
    case 'ex2'
        y=(exp(x)+x)/(exp(x)+1);
    case 'ex3'
        y=(x^2-x+1)/x;
end
