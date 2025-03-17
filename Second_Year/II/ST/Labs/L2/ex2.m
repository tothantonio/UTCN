sys = tf(1, [1, 2, 2])

t = 0:0.1:10;
yi = exp(-t) .* sin(t);
ys = (1 / 2) .* (1 - exp(-t) .* sin(t) - exp(-t) .* cos(t));

figure, impulse(sys, 10), grid on;
hold on;
plot(t, yi, '*');
hold off;

figure, step(sys, 10), grid on;
hold on;
plot(t, ys, '*');
hold off;