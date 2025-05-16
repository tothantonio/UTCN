
clear
clc


a=eps;
A=[a,1;1,1];
b=[a+1;2];
A

x1=ElimGauss(A,b);
x2=ElimGaussPivPartial(A,b);

[x1' x2']


a=eps/4;
A=[a,1;1,1];
b=[a+1;2];
A
x1=ElimGauss(A,b);
x2=ElimGaussPivPartial(A,b);

[x1' x2']
