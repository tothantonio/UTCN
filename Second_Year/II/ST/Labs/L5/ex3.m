close all
clear all
clc

fileID = fopen('ECGdata.txt', 'r');
A = fscanf(fileID, '%f %f', [2, Inf]);
fclose(fileID)
timp = A(1, :);
necg = A(2, :);

T1 = 1/pi;
T2 = 1/100/pi;
K = 1/pi;
G2 = tf([K, 0], conv([T1, 1], [T2,1]))
figure
bode(G2)
figure
lsim(G2*G2, necg, timp)

figure, plot(timp, necg), grid on
xlabel('t (sec)'), ylabel('ECG nromalizat')