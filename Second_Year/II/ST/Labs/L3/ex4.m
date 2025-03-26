close all
clear all
clc
%%H1
num=4; den=[1 5 4];
H1 = tf(num, den);
disp('polii pt H1: ')
r=roots(den)
figure
subplot(211), step(H1), grid on
subplot(212), impulse(H1), grid on
%%H2
num=4; den=[1 1 4];
H2 = tf(num, den);
disp('polii pt H2: ')
r=roots(den)
figure
subplot(211), step(H2), grid on
subplot(212), impulse(H2), grid on
%%H3
num=4; den=[1 0 -4];
H3 = tf(num, den);
disp('polii pt H3: ')
r=roots(den)
figure
subplot(211), step(H3), grid on
subplot(212), impulse(H3), grid on
%%H4
num=4; den=[1 -1 4];
H4 = tf(num, den);
disp('polii pt H4: ')
r=roots(den)
figure
subplot(211), step(H4), grid on
subplot(212), impulse(H4), grid on
%%H5
num=4; den=[1 0 4];
H5 = tf(num, den);
disp('polii pt H5: ')
r=roots(den)
figure
subplot(211), step(H5), grid on
subplot(212), impulse(H5), grid on
%%H6
num=4; den=[1 4];
H6 = tf(num, den);
disp('polii pt H6: ')
r=roots(den)
figure
subplot(211), step(H6), grid on
subplot(212), impulse(H6), grid on
%%H7
num=4; den=conv([1 0 4], [1 0 4]);
H7 = tf(num, den);
disp('polii pt H7: ')
r=roots(den)
figure
subplot(211), step(H7, 30), grid on
subplot(212), impulse(H7, 30), grid on