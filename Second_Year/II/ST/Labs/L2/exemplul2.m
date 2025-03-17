sys = tf(1, [1, 3, 2]);
t = 0:1e-1:10;
yi = exp(-t) - exp(-2*t);
ys = 1/2 - exp(-t) + 1/2*exp(-2 * t);

figure, impulse(sys, 10), grid on;
hold on;
plot(t, yi, '-or');
hold off;

figure, step(sys, 10), grid on;
hold on;
plot(t, ys, '-sg');
hold off;

