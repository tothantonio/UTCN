function [rez]=f(x,tipex)
%calculeaza functia f; 
switch tipex
    case 'ex1'
rez=cos(x)^2-x^2;
    case 'ex2'
rez=cos(0.5*x)^2-x^2;
end