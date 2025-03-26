close all
clear all
clc

kV = 0:0.5:100;
figure; hold on;
for k = kV
    r = roots([1, 3, 4, 2 + k]);
    plot(real(r), imag(r), '*')
end
grid on 