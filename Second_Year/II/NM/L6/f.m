function [rez]=f(x,tipex)
%calculeaza functia f; 
switch tipex
    case 'ex1'
rez=cos(100*x)^2-x^2;
    case 'ex2'
rez=(x/2)^2-sin(0.5*x);
end