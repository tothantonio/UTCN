function [a,b,exact]=Date_pb(tipex)
switch tipex
    case 'ex1'
        a=1.5;
        b=2;
        exact=1.933753765643827;
    case 'ex2'
         a=0.6;
         b=1;
         exact=0.9061798459386747;
end