%%Sa se scrie elem din pozitia 3->5 si 2,4,6 ale vectorului A
A = [2 4 7 3 5 10];
B = A(3:5)
C = A(2:2:6);

x = 10:-1:0

%% Sa se scrie instr. ce permit selectarea din A a liniei 2;
% col 3; 
% submat form. din lin 1->2 si col. 4->6;
% submat form. din lin 1->4 si col. 2, 4, 5

A = [1 2 3 4 5 6; 
    2 3 4 5 6 1;
    3 4 5 6 1 2;
    4 5 6 1 2 3;
    5 6 1 2 3 4];

B = A(2, :) %doar linia 2
C = A(:, 3); %doar coloana 3
D = A(1:2, 4:6); %lin. 1->2 si col. 4->6
E = A([1, 4], [2:4,5]); % lin 1->4 si col 2, 4, 5

%% Sa se roteasca in jurul unei col. si in jurul unei linii
A = [1 2 3;
    4 5 6;
    7 8 9];

B = fliplr(A)  %roteste in jurul unei coloane
%C = flipud(A);  roteste in jurul unei linii
%E = inv(A); inv lu A
%d = det(A); det lui A
%%
X = [1 2 3; 4 5 6; 7 8 9];
norm(X, 2) % cea mai mare val sing.
norm(X, inf); % cea mai mare suma a el. de pe linie
norm(X, 1); %cea mai mare suma a el. de pe col.
%%
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
T = A';
O = zeros(3, 4);
I = ones(3);
%%
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
B = ones(3);
C = A + B
C = A - B;
C = 3 * A;
C = A.*B;
D = A./(2 * B);
P = A.^2;
%%
x = 0:0.01:2*pi;
y = sin(x);
plot(x, y);
%%
Suma_Produs(2, 3);
fibo(5)