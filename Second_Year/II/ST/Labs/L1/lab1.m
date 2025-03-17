a = 2;
A = 3;
%comentariu

%% 
b = 5;
%%

v = [2,3,4];
%v' = transpusa
A = [-1, 2, 3; 
    4, 8, 10];
rng(5); % asigura ca am aceleasi numere
B= rand(2,3);
C = A + B;
D = A * B'; %(2,3) x (3 2)
E = A .* B;
%%
A = [-1, 4, 5;
    sqrt(2), pi, exp(1);
    sin(pi/2), log(2), -3];
B = [1;1;2];
det(A) % !=0
x = inv(A)*B;
A*x - B;
x=A\B
%%
A = rand(4);
A(3,3:4);
idx = 1:10;
idx = 1:2:10;
idx = 1:-1:10;
idx = 10:-1:1;
B = [A, 2*A];
C = [B; -B];
%%
z = 4+5*j;
format hex
z;
format short
z;
abs(z);
atan2(5, 4);
%help atan2
conj(z)
%%
rad2deg(pi);
deg2rad(90);
eye(5,8)
ones(4)
zeros(3)
%%
p = [1, 5, -4, 8]
q = [2, 0, 0, 8]
M = conv(p, q)
N = deconv(p, q)
roots(p)
%%
x = 0:0.2:10;
y = return_y(x);
%plot(x, y, 'r-*'), hold on
%plot(x,y.^2,'g->')
%%
%Exercitiu 1

p1 = [1, 2, 0, 0];
p2 = [1, -6, -7];
p3 = [1, 0, 4];
p4 = [1, 3, 2];
p5 = [1, 2, 2];
p6 = [1, 0, 0, 0, -16];
    
figure
plot(roots(p1), '*'), grid on, hold on
figure
plot(roots(p2), '*'), grid on, hold on
figure
plot(roots(p3), '*'), grid on, hold on
figure
plot(roots(p4), '*'), grid on, hold on
figure
plot(roots(p5), '*'), grid on, hold on
figure
plot(roots(p6), '*'), grid on, hold on

