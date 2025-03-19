function [a,b]=Interval_interpolare(tipex)
%functie care "returneaza" intervalul de interpolare
switch tipex
    case 'ex1'
        a=-1;b=1;
    case 'ex2'
        a=-2;b=2;
    case 'ex3'
        a=-3,b=3;
end