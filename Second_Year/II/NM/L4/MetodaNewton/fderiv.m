function [rez]=fderiv(x,tipex)
%calculeaza derivata; pentru alt exemplu atentie la operatiile punctuale
switch tipex
    case 'ex1'
 rez=2*cos(x)*(-sin(x))-2*x;
    case 'ex2'
 rez=0.5*cos(0.5*x) * (-sin(0.5*x)) - 2*x;
end
