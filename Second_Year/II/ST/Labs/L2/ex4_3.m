clear

sys = tf(2, [1, 1, 9.8]);

figure, impulse(sys), grid on;
figure, step(sys), grid on;